<?php

use yii\helpers\Html;
use yii\grid\GridView;


$this->title = 'Forum';
$this->params['breadcrumbs'][] = ['label' => 'Forum', 'url' => ['forum/forum']];
$this->params['breadcrumbs'][] = $nazwa
?>
<div class="category-index">

<h3><?php echo "Kategoria: ";echo $nazwa;?></h3>
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
<textarea name="temat" id="temat" rows="2" cols="10" placeholder="Komentarz" ></textarea></br>
<input type="text" name="tag"  style="background-color: #D0D0D0;width: 100%; 
     box-sizing: border-box;
     -webkit-box-sizing:border-box;
     -moz-box-sizing: border-box;" placeholder="Tagi" />
</br>
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

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
         [ 'attribute' => 'subject','label' => 'Temat',
            	'format' => 'raw',
       			'value'=>function ($data) {
            	return Html::a($data['subject'],['forum/replies', 'id' => $data['ID']]);
        	},],
        	['attribute' =>'date','label'=>'Data'],
        ['attribute' =>'username','label'=>'Użytkownik'],
        'odpowiedzi'],
]); ?>



 


</div>
 <script src="<?php echo  Yii::$app->urlManager->createUrl('js/ckeditor/ckeditor.js') ?>"></script>
<script type="text/javascript">
    CKEDITOR.replace('temat') ;
</script>