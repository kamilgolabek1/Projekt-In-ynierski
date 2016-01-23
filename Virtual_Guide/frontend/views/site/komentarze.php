<?php
use yii\helpers\Html;
use common\models\User;
 Html::csrfMetaTags();
 use frontend\assets\AppAsset;
 use yii\grid\GridView;

 AppAsset::register($this);
 //LocateAsset::register($this)
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Lokalizacje', 'url' => ['location']];
$this->params['breadcrumbs'][] = $this->title;
?>

<h3>Galeria</h3>
<!-- taka klasa nie istnieje -->
<div class="galeria">
	
	
	
	
<?php foreach($photos as $photo){ ?>
	<a href="uploads/<?php echo $photo->filename ?>" data-lightbox="set"><img src="uploads/thumbs/<?php echo $photo->filename ?>" style="width: 100px; height: 100px;"></a>
	<?php }?>
</div>



<?php echo "<h2>".$model->name."</h2>";?>
<div class="row">
	<div class="col-lg-4">
	<h4>Położenie</h4>
		Kraj: <?=  $model->country ? $model->country->country_name : "nie ustawiono" ?> </br>
		długość geograficzna: <?= $model->lon ?> </br>
		Szerokość geograficzna: <?= $model->lat ?> </br>
	</div>
	<div class="col-lg-6">
	<h4>Opis</h4>
		<?= $model->descr ?>
	</div>
</div>
<div>Tagi:<a> <?php echo $model->tag?></a></div>
</br>
<?php 

 if (Yii::$app->user->isGuest) {
     echo "<h4>Aby móc dodawać opinie, zaloguj się</h4>";
 }else {
     echo "<h4>Dodaj komentarz</h4>";
     $url=Yii::$app->urlManager->createUrl('site/add'); 
     ?>
    <form action=<?php echo $url; ?>  method="POST">
        <input type="hidden" name="id" value=<?php echo $model->ID; ?> >
        <div style="width:90%"><textarea name="komentarz" id="komentarz"  ></textarea></div></br>
        <input type="submit" value="Dodaj Komentarz" class="btn btn-primary">

        <input type="hidden" name="_csrf" value="<?=Yii::$app->request->getCsrfToken()?>" />
    </form>
<?php
 }
?>
</br></br>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
        ['attribute' => 'username', 'label' => 'Użytownik'],
        [ 'attribute' => 'comment','label' => 'Komentarz',
            	'format' => 'raw',
       			'value'=>function ($data) {
            	return $data['comment'];},
            	],],
]); ?>

  <script src="<?php echo  Yii::$app->urlManager->createUrl('js/ckeditor/ckeditor.js') ?>"></script>


<script type="text/javascript">
    CKEDITOR.replace('komentarz') ;
</script>
