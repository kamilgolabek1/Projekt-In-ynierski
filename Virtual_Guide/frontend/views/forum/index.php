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

<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>

    <?= $form->field($modelup, 'imageFile')->fileInput() ?>
	name:<input type="text" name="name" />
	adress:<input type="text" name="adress" />
	descr:<input type="text" name="descr" />
	zoom:<input type="text" name="zoom" />
	category:<input type="text" name="category" />
	lon:<input type="text" name="lon" />
	lat:<input type="text" name="lat" />
	tag:<input type="text" name="tag" />
	country:<input type="text" name="country" />
	
    <button>Submit</button>

<?php ActiveForm::end() ?>


</div>