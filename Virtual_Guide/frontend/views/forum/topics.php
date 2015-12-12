<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\base\Application;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categories';
$this->params['breadcrumbs'][] = ['label' => 'Forum', 'url' => ['forum/index']];
$this->params['breadcrumbs'][] = $nazwa
?>
<div class="category-index">

<h3><?php echo $nazwa;?></h3>
 <div align="right">
 <?php 

 if (Yii::$app->user->isGuest) {
     echo "<h4>Aby móc dodawać opinie, zaloguj się</h4>";
    
 }else {
 echo Html::button('Utwórz wątek', [ 'class' => 'btn btn-success', 'onclick' => '$("#create_topic").is(":visible") ? $("#create_topic").slideUp() : $("#create_topic").slideDown()']);?>
 </div></h3>

<div id="create_topic" style="display:none">
	<form action=<?php echo Yii::$app->urlManager->createUrl('forum/newtopic');  ?>  method="POST">
<h3>Temat</h3>
<textarea name="temat" id="temat" rows="2" cols="10" ></textarea></td>
</br>
		<input type="submit" value="Dodaj wątek" class="btn btn-primary">
	 	<input type="hidden" name="_csrf" value="<?=Yii::$app->request->getCsrfToken()?>" />
	 	<input type="hidden" name="id" value="<?php echo $id ?>" />
	 	</form>

<?php
 }
?>
</div>


</br></br>
<table class="table table-striped ">
<thead>
	<tr>
		<th>Temat</th>
		<th>Data założenia</th>
		<th>Utworzył</th>
		<th>Odpowiedzi</th>
	</tr>
</thead>
<tbody>
<?php 

 foreach($model as $row)    {   
 	echo "<tr>";
	echo "<td>";
		echo Html::a( $row['subject'],['forum/replies', 'id' => $row['ID']]);
 	echo "</td>";
 	echo "<td>";
 	echo $row['date'];
 	echo "</td>";
 	echo "<td>";
 		echo $row['username'];
 	echo "</td>";
 	echo "<td>";
 		echo $row['odpowiedzi'];
 	echo "</td>";
 	
 	echo "</tr>";
}
?>
</tbody>
</table>


 


</div>
<script src="../js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKEDITOR.replace('temat') ;
</script>
