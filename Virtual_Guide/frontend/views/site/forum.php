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
<div class="jumbotron">
        <h1>Forum</h1>
    </div>


  
  <table class="table table-striped table-bordered detail-view">
<tr>
    <th>Nazwa</th>
    <th>Adres</th>
    <th></th>
   
</tr>
 <?php
    foreach($locations as $row)
  { 
        $url=Yii::$app->urlManager->createUrl(['site/komentarze', 'id' => $row->ID]);
    echo "<tr><td>".$row->Nazwa."</td><td>".$row->Adres."</td>";
    echo '<td><a href="';echo $url; echo '" title="View" aria-label="View" data-pjax="0"><span class="glyphicon glyphicon-eye-open"></span></a></td></tr>';
  
 
    
  }?>

</table>