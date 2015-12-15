<?php
use yii\helpers\Html;
use common\models\User;
 Html::csrfMetaTags();
 use frontend\assets\AppAsset;

 AppAsset::register($this);
 //LocateAsset::register($this)
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Lokalizacje', 'url' => ['location/index']];
$this->params['breadcrumbs'][] = $this->title;
?>


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
<table class="table table-striped table-bordered detail-view">
<tr>
    <th>Uzytkownik</th>
    <th>Komentarz</th> 
</tr>
 <?php

    foreach($model->comments as $row)
  { 
      $User = User::find()
    ->where(['id' => $row->userID])
    ->one();

    echo "<tr><td width='20%'>".$User->username.""
            . "</br>"
            .$row->date. "</td><td>".$row->comment."</td></tr>";
  }?>
</table>
  <script src="../js/ckeditor/ckeditor.js"></script>


<script type="text/javascript">
    CKEDITOR.replace('komentarz') ;
</script>
