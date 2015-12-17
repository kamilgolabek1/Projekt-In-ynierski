<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\LocationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lokalizacje';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="location-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Utwórz lokalizacje', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
	 <?php  Pjax::begin();?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'ID',
            'name',
            'descr',
           // 'lon',
            //'lat',
             'country.country_name',
            // 'province',
            // 'city',
            // 'address',
            // 'zoom',
             'category.name',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
     <?php Pjax::end();?>

</div>
