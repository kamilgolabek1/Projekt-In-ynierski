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
   
    </br></br>
   
</tr>
 <?php
    foreach($locations as $row)
  { 
         $connection=Yii::$app->db;
         $sql = "Select * from Comment where locationID  = ".$row->ID;
         
   $command=$connection->createCommand($sql);
   $dataReader=$command->query();
   $rowCount = $dataReader->rowCount;
    
        
        $url=Yii::$app->urlManager->createUrl(['site/komentarze', 'id' => $row->ID]);
    echo "<tr><td><a href='".$url."'><h4>".$row->name."</h4></a></td>";
    echo "<td>"."Opinie: ".$rowCount." </br> ".$row->address."</td></tr>";
  
 
    
  }?>

</table>