<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

$this->title = 'Forum';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="location-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

     
	 <?php  Pjax::begin();?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
       // 'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],
            [ 'attribute' => 'name','label' => 'Nazwa',
            	'format' => 'raw',
       			'value'=>function ($data) {
            	return Html::a('site/komentarze');
        	},],
             [ 'attribute' => 'descr','label' => 'Opis'],
        	[ 'attribute' => 'country','label' => 'Kraj'],
        	
        ],
    ]); ?>
   <?php Pjax::end();?>
</div>
