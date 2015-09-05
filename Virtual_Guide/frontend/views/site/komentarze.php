<?php
use yii\helpers\Html;

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$this->title = $model->Nazwa;
$this->params['breadcrumbs'][] = ['label' => 'Forum', 'url' => ['forum']];
$this->params['breadcrumbs'][] = $this->title;
?>

<h2>Wątek</h3>


<table class="table table-striped table-bordered detail-view">
<tr>
    <th>Uzytkownik</th>
    <th>Komentarz</th> 
</tr>
 <?php

    foreach($model->comments as $row)
  { 
       
    echo "<tr><td>".$row->UserID."</td><td>".$row->Comment."</td></tr>";
  }?>
</table>


<?php  $url=Yii::$app->urlManager->createUrl('site/addkomentarz');  ?>
<form action=<?php echo $url; ?>  method="POST">
    <input type="hidden" name="id" value=<?php echo $model->ID; ?> >
    <textarea name="komentarz" rows="8" cols="180" ></textarea></br>
    <input type="submit" value="Dodaj Koemntarz">
</form>

