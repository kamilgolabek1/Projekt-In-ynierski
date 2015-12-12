<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\base\Application;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Forum';

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

<h3>Forum</h3>

<table class="table table-striped ">
<thead>
	<tr>
		<th>Kategoria</th>
		<th>Licza wątków</th>
	</tr>
</thead>
<tbody>
<?php 
$sql = "select c.name ,c.id,(select count(*) from topics t where t.CategoryID = c.ID) as ilosc from category c";
//$rows = Yii::app()->db->createCommand($sql)->queryAll();
$rows = Yii::$app->db->createCommand($sql)->queryAll();
 foreach($rows as $row)    {   
 	echo "<tr>";
	echo "<td>";
		echo Html::a(Html::encode( $row['name']),['forum/topics', 'id' => $row['id']]);
 	echo "</td>";
 	echo "<td>";
 		echo $row['ilosc'];
 	echo "</td>";
 	
 	echo "</tr>";
}
?>
</tbody>
</table>


</div>
