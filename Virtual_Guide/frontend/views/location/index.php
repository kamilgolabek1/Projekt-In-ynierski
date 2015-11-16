<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;


$this->title = 'Lokalizacje';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="location-index">
    </br>
    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>
	</br>
	 <?php  Pjax::begin();?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],
            [ 'attribute' => 'name','label' => 'Nazwa',
            	'format' => 'raw',
       			'value'=>function ($data) {
            	return Html::a(Html::encode($data->name),['site/komentarze', 'id' => $data->ID]);
        	},],
             [ 'attribute' => 'descr','label' => 'Opis'],
        	['attribute' => 'countryID','label' => 'Kraj','value' => 'country.country_name'],
        	['attribute' => 'categoryID','label' => 'Kategoria','value' => 'category.name'],
        	
        ],
    ]); ?>
   <?php Pjax::end();?>
</div>
