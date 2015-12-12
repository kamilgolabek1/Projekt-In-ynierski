<?php

namespace frontend\controllers;
use Yii;
use common\models\Category;
use common\models\CategorySearch;
use common\models\Replies;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\Topics;

class ForumController extends \yii\web\Controller
{
    public function actionConversation()
    {
        return $this->render('conversation');
    }

    public function actionIndex()
    {
        $searchModel = new CategorySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
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
    	
    	$sql = "SELECT * FROM replies join topics on topics.id = replies.topicID join User on replies.userID = User.ID where topics.id = $id ";
    	$topic =  Topics::findOne($id);
    	$topic_subject = $topic->subject;
    	$category = $topic->category->name;
    	$catID = $topic->category->ID;
    	$rows = Yii::$app->db->createCommand($sql)->queryAll();
    	return $this->render('replies', [
    			'model' => $rows, 'nazwa' => $topic_subject,'category' => $category,'topic' => $topic, 'id' => $id,'catid' => $catID
    	]);
    }

    public function actionNewtopic()
    {
        $request = Yii::$app->request;
    	$id = $request->post('id');
    	$sub = $request->post('temat');
    	
    	$topic = new Topics();
    	$topic->subject = $sub;
    	$topic->date = new \yii\db\Expression('NOW()');
    	$topic->userID =  $userId = \Yii::$app->user->identity->id;
    	$topic->categoryID = $id;
    	$topic->save();
    	
    	
    	$sql = "Select t.*, u.username ,(select count(*) from replies where topicID = t.ID) as odpowiedzi from topics t join user u on t.userID = u.ID where categoryID = $id ";
    	$subject = Category::findOne($id)->name;
    	$rows = Yii::$app->db->createCommand($sql)->queryAll();
    	return $this->render('topics', [
    			'model' => $rows, 'nazwa' => $subject,'id' => $id
    	]);
    }

    public function actionReplies($id)
    {
       $sql = "SELECT * FROM replies join topics on topics.id = replies.topicID join User on replies.userID = User.ID where topics.id = $id ";
    	$topic =  Topics::findOne($id);
    	$topic_subject = $topic->subject;
		$category = $topic->category->name;
		$catID = $topic->category->ID;
    	$rows = Yii::$app->db->createCommand($sql)->queryAll();
    	return $this->render('replies', [
    			'model' => $rows, 'nazwa' => $topic_subject,'category' => $category,'topic' => $topic, 'id' => $id, 'catid' => $catID
    	]);
    }

    public function actionTopics($id)
    {
        $sql = "Select t.*, u.username ,(select count(*) from replies where topicID = t.ID) as odpowiedzi from topics t join user u on t.userID = u.ID where CategoryID = $id ";
    	$subject = Category::findOne($id)->name;
    	$rows = Yii::$app->db->createCommand($sql)->queryAll();
    	return $this->render('topics', [
    			'model' => $rows, 'nazwa' => $subject, 'id' => $id
    	]);
    }

}
