<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\base\Application;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$url  = Yii::$app->urlManager->createUrl(['forum/topics', 'id' => $catid]);
$this->title = 'Odpowiedzi';
$this->params['breadcrumbs'][] = ['label' => 'Forum', 'url' => ['forum/index']];
$this->params['breadcrumbs'][] = ['label' => $category, 'url' => $url];

?>
<div class="category-index">


</br>
<table class="table  ">
<tr>
	<th width='20%'>
		<div align="center"><img src="../../img/user.png" width="80"/></div>
		<div align="center"><a href="#"><h3><?php echo $topic->user->username; ?></h3></a></div></br>
		<div align="center"><?php echo $topic->date?></div>
	</th>
	<th>
		<h4 ><?php echo $nazwa ?></h4>
		
	</th>
</tr>
<tr><td><h4>Tagi: <a> <?= $topic->tag?></a></h4></td></tr>
</table>

</br>

<?php 

 if (Yii::$app->user->isGuest) {
     echo "<h4>Aby móc dodawać opinie, zaloguj się</h4>";
 }else {
     echo "<h4>Odpowiedz</h4>";
     $url=Yii::$app->urlManager->createUrl('forum/newreplie'); 
     ?>
    <form action=<?php echo $url; ?>  method="POST">
        
        <textarea name="odpowiedz" id="odpowiedz" rows="2" cols="5" ></textarea></br>
        <input type="submit" value="Dodaj odpowiedź" class="btn btn-primary">
		<input type="hidden" name="id" value="<?php echo $id ?>"/>
        <input type="hidden" name="_csrf" value="<?=Yii::$app->request->getCsrfToken()?>" />
    </form>
<?php
 }
?>

</br>
<h4>Odpowiedzi</h4>
<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        ['attribute' => 'username','label' => 'Nazwa użytkownika', 'contentOptions' =>['style' => 'width:30px']],
         [ 'attribute' => 'content','label' => 'Komentarz',
         		'format' => 'raw',
       			'value'=>function ($data) {
            	return $data['content'];
        	},
         ],
    ],
]); ?>


</div>
<script src="../../js/ckeditor/ckeditor.js"></script>


<script type="text/javascript">
    CKEDITOR.replace('odpowiedz') ;
</script>