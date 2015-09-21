<?php 
use yii\helpers\Html;
use yii\grid\GridView;


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$this->title = 'Forum';
//$this->params['breadcrumbs'][] = ['label' => '', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


  
  <table class="table table-striped table-bordered detail-view">
<tr>
    <th>Nazwa</th>
    <th>Adres</th>
   
   
</tr>
 <?php
    foreach($locations as $row)
  { 
        $url=Yii::$app->urlManager->createUrl(['site/komentarze', 'id' => $row->ID]);
    echo "<tr><td><a href='".$url."'>".$row->name."</a></td><td>".$row->address."</td></tr>";
  
 
    
  }?>

</table>