<?php
namespace frontend\controllers;

use Yii;
use common\models\LoginForm;
use common\models\PasswordResetRequestForm;
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
		$sql = "Select * from Location ";
    	$locations = Yii::$app->db->createCommand($sql)->queryAll();
        return $this->render('index',['locations' => $locations]);
    }
	
	// obsluga mapy 
	public function actionPoints(){
		$sql = "Select * from Location ";
		$locations = Location::findBySql($sql)->asArray()->all();
		$locations = json_encode($locations);
		return $locations;
	}
	
	public function actionComments(){
		$request = Yii::$app->request;
        $id = $request->post('id');   
		//if(!$id){return ;}
		///$sql = "Select * from Comment where location ";
		$comments = Location::findOne($id)->comments;
		//$locations = Location::findBySql($sql)->asArray()->all();
		$comments = json_encode($comments);
		return $comments;
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
    	return $this->render('komentarze', [
    			'dataProvider' => $dataProvider, 'model' => $this->findLocation($id)
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


    protected function findLocation($id)
    {
        if (($model = Location::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
