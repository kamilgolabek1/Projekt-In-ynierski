<?php
namespace frontend\controllers;

use Yii;
use common\models\LoginForm;
use common\models\UploadForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\Location;
use common\models\Comment;
use yii\data\SqlDataProvider;
use yii\web\UploadedFile;
use common\models\Category;
use common\models\Countries;
use common\models\Photo;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
		

    $modelup = new UploadForm();
    $modelup2 = new UploadForm();

        if (Yii::$app->request->isPost) {
        	
        	$request = Yii::$app->request;
        	$name = $request->post('name');
        	$adres= $request->post('adress');
        	$opis = $request->post('descr');
        	$zoom= $request->post('zoom');
        	$kategoria = $request->post('category');
        	$dlugosc= $request->post('lon');
        	$szerokosc = $request->post('lat');
        	$tag = $request->post('tag');
        	$kraj = $request->post('country');
        	
        	$location = new Location();
        	$location->name = $name;
        	$location->descr = $opis;
        	$location->lon = $dlugosc;
        	$location->lat = $szerokosc;
        	$location->countryID = $kraj;
        	$location->address = $adres;
        	$location->zoom = $zoom;
        	$location->categoryID = $kategoria;
        	$location->userID = $userId = \Yii::$app->user->identity->id;
        	$location->tag = $tag;
        	
        	if($location->save()){
        		$modelup->imageFile = UploadedFile::getInstance($modelup, 'imageFile');
			    $now =  date('Y_m_d_H_i_s');
        		$name = (string)$location->userID."_".$now;
        		$name = str_replace(" ", "_", $name);
        		if ($modelup->upload($name)) {
        			$photo =  new Photo();
        			$photo->locationID = $location->ID;
        			$photo->filename = $name.".".$modelup->imageFile->extension;
        			$photo->comment = "";
        			$photo->userID = $location->userID;
        			$photo->save();
        		}
        	}
        }
		
        $categories = Category::find()->all();
		$countries = Countries::find()->all();
		$sql = "Select * from Location ";
    	$locations = Yii::$app->db->createCommand($sql)->queryAll();
        return $this->render('index',['locations' => $locations,'modelup' => $modelup,'modelup2' => $modelup2,'categories' => $categories,'countries' => $countries] );
    }
    
    public function actionUpload()
    {
    	$modelup = new UploadForm();
    
    	if (Yii::$app->request->isPost) {
    		$modelup->imageFile = UploadedFile::getInstance($modelup, 'imageFile');
    		$now =  date('Y_m_d_H_i_s');
    		$request = Yii::$app->request;
    		$id = $request->post('id');
    		$name = $id."_".$now;
        	if ($modelup->upload($name)) {
        		$photo =  new Photo();
        		$photo->locationID = $id;
        		$photo->filename = $name.".".$modelup->imageFile->extension;
        		$photo->comment = "";
        		$photo->userID =  \Yii::$app->user->identity->id;
        		$photo->save();
        	}
    	}
    	return $this->redirect('index');
    }
	
	
	// obsluga mapy 
	public function actionPoints(){
		$sql = "Select * from Location ";
		$locations = Location::findBySql($sql)->asArray()->all();
		$locations = json_encode($locations);
		return $locations;
	}
	
	public function actionGetComments(){
		$request = Yii::$app->request;
        $id = $request->post('id');   
		if(!$id){return;}
		$sql = "Select c.id, c.comment, c.date, u.username  from Comment c  
		join User u on u.ID = c.userID where locationID = $id order by c.date desc";
		$comments = Location::findBySql($sql)->asArray()->all();
		$comments = json_encode($comments);
		return $comments;
	}
	
	public function actionGetPictures(){
		$request = Yii::$app->request;
        $id = $request->post('id');   
		if(!$id){return;}
		$sql = "Select p.id, p.filename, p.comment, u.username  from Photo p join User u on u.ID = p.userID where locationID = $id order by p.ID desc";
		$pictures = Location::findBySql($sql)->asArray()->all();
		$pictures = json_encode($pictures);
		return $pictures;
	}
    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!\Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending email.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Email z linkiem do zmiany hasła został wysłany.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Nie znaleniono użytkownika z podanym adresem email.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpExceptiona
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password was saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
    
    
    public function actionForum(){
        $searchModel = new LocationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->pagination->pageSize=2;
        return $this->render('forum', [
        		'searchModel' => $searchModel,
        		'dataProvider' => $dataProvider,
        ]);
    }
    
     public function actionKomentarze($id)
    {
    	$sql = "Select * from Comment c  join User u on c.userID = u.ID where c.locationID = $id ";
    	$count = Yii::$app->db->createCommand($sql)->queryAll();
    	$count = count($count);
    	$dataProvider = new SqlDataProvider([
    			'sql' =>$sql,
    			'totalCount' => $count,
    			'pagination' => [
    					'pagesize' => 6,
    			],
    			'sort' => ['attributes' => ['comment','username']]
    	]);
    	$Photos = Location::findOne($id)->photos;
    	return $this->render('komentarze', [
    			'dataProvider' => $dataProvider, 'model' => $this->findLocation($id),'photos' => $Photos
    	]);
    }
    
    public function actionAdd(){
        
        $request = Yii::$app->request;
        $id = $request->post('id');   
        $kom = $request->post('komentarz');   
        
        $comment = new Comment();
        $comment->comment = $kom;
        $comment->date = new \yii\db\Expression('NOW()');
        $comment->locationID = $id;
        $comment->userID = $userId = \Yii::$app->user->identity->id;
        $comment->save();
        return $this->redirect(['komentarze','id' => $id]);
       // return $this->actionKomentarze($id);
    }

		public function actionAddComment(){
        
        $request = Yii::$app->request;
        $id = $request->post('id');   
        $kom = $request->post('komentarz');   
        
        $comment = new Comment();
        $comment->comment = $kom;
        $comment->date = new \yii\db\Expression('NOW()');
        $comment->locationID = $id;
        $comment->userID = $userId = \Yii::$app->user->identity->id;
       
        if($comment->save()){
        	$comid = $comment->ID;
        	$sql = "Select * from Comment where ID = $comid ";
        	$comm = Comment::findBySql($sql)->asArray()->all();
        	$comm = json_encode($comm);
        	return $comm;
        }else {
        	return -1;
        }
        
        //$com = Comment::findOne($comment->ID);
        ///return serialize($comment);
        //return  json_encode($com);
       // return $this->actionKomentarze($id);
    }
	
    protected function findLocation($id)
    {
        if (($model = Location::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
