<?php

namespace frontend\controllers;
use Yii;
use common\models\Category;
use common\models\UploadForm;
use yii\data\SqlDataProvider;
use common\models\Replies;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\Topics;
use yii\web\UploadedFile;
use common\models\Location;

class ForumController extends \yii\web\Controller
{
    public function actionConversation()
    {
        return $this->render('conversation');
    }

    public function actionIndex()
    {
    	$sql = "select c.name ,c.id,(select count(*) from topics t where t.CategoryID = c.ID) as ilosc from category c";
    	$count = Yii::$app->db->createCommand($sql)->queryAll();
 		$count = count($count);
   		$dataProvider = new SqlDataProvider([
	    'sql' =>$sql,
	    'totalCount' => $count,
	    		'pagination' => [
	    				'pagesize' => 6,
	    		],
	    		'sort' => ['attributes' => ['name','ilosc']]
	    ]);
		
   		$modelup = new UploadForm();

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
        		if ($modelup->upload()) {
        			// file is uploaded successfully
        		}
        	}
        	
           
        }

		
        return $this->render('index', [
        	'dataProvider' => $dataProvider, 'modelup' => $modelup,
        ]);
    }
    
    public function actionNewreplie()
    {
    	$request = Yii::$app->request;
    	$id = $request->post('id');
    	$sub = $request->post('odpowiedz');
    	 
    	$reply = new Replies();
    	$reply->content = $sub;
    	$reply->data = new \yii\db\Expression('NOW()');
    	$reply->userID =  $userId = \Yii::$app->user->identity->id;
    	$reply->topicID = $id;
    	$reply->save();
    	 
    	return $this->redirect(['replies','id' => $id]);
    }
    
    public function actionNewtopic()
    {
    	$request = Yii::$app->request;
    	$id = $request->post('id');
    	$sub = $request->post('temat');
    	$tag = $request->post('tag');
    	$topic = new Topics();
    	$topic->subject = $sub;
    	$topic->date = new \yii\db\Expression('NOW()');
    	$topic->userID =  $userId = \Yii::$app->user->identity->id;
    	$topic->categoryID = $id;
    	$topic->tag = $tag;
    	$topic->save();
    	 
    	return $this->redirect(['topics','id' => $id]);
    	//return $this->actionTopics($id);
    }
    
    public function actionReplies($id)
    {
    	$sql = "SELECT * FROM replies join topics on topics.id = replies.topicID join User on replies.userID = User.ID where topics.id = $id ";
    	$count = Yii::$app->db->createCommand($sql)->queryAll();
    	$count = count($count);
    	$dataProvider = new SqlDataProvider([
    			'sql' =>$sql,
    			'totalCount' => $count,
    			'pagination' => [
    					'pagesize' => 6,
    			],
    			'sort' => ['attributes' => ['username','content']]
    	]);
    	$topic =  Topics::findOne($id);
    	$topic_subject = $topic->subject;
    	$category = $topic->category->name;
    	$catID = $topic->category->ID;
    	$rows = Yii::$app->db->createCommand($sql)->queryAll();
    	 
    	 
    	return $this->render('replies', [
    			'dataProvider' => $dataProvider, 'nazwa' => $topic_subject,'category' => $category,'topic' => $topic, 'id' => $id, 'catid' => $catID
    	]);
    }
    
    public function actionTopics($id)
    {
    	$sql = "Select t.*, u.username ,(select count(*) from replies where topicID = t.ID) as odpowiedzi from topics t join user u on t.userID = u.ID where CategoryID = $id ";
    	$count = Yii::$app->db->createCommand($sql)->queryAll();
    	$count = count($count);
    	$subject = Category::findOne($id)->name;
    	$dataProvider = new SqlDataProvider([
    			'sql' =>$sql,
    			'totalCount' => $count,
    			'pagination' => [
    					'pagesize' => 6,
    			],
    			'sort' => ['attributes' => ['subject','username','date','odpowiedzi']]
    	]);
    	return $this->render('topics', [
    			'dataProvider' => $dataProvider,'nazwa' => $subject, 'id' => $id
    	]);
    }
    
    }
    
    