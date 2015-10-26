<?php
use yii\helpers\Html;
use frontend\models\User;
 Html::csrfMetaTags();
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Forum', 'url' => ['forum']];
$this->params['breadcrumbs'][] = $this->title;
?>
<script src="../../js/ckeditor/ckeditor.js"></script>

<?php echo "<h3>".$model->name."</h3>";

 echo "<h5>".$model->descr."</h5>";
?>
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
        <textarea name="komentarz" id="komentarz" rows="2" cols="10" ></textarea></br>
        <input type="submit" value="Dodaj Komentarz">

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





<script>
 CKEDITOR.replace( 'komentarz' );
 CKEDITOR.config.height  = 150;  
 
</script>
