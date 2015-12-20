<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $searchModel common\models\CategorySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Forum';

$this->params['breadcrumbs'][] = $this->title;
?>
<div class="category-index">

<h3>Forum</h3>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'columns' => [
         [
         	'attribute' => 'name',
           'label'=>'Kategoria',
           'format' => 'raw',
       'value'=>function ($data) {
            return Html::a( $data['name'],['forum/topics', 'id' => $data['id']]);
        },
    ],
        [
        'attribute' => 'ilosc',
        'label' => 'Ilość wątków'
        		],
      ],
]); ?>




</div>