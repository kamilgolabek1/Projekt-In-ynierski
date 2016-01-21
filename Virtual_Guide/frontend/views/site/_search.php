<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
//use yii\widgets\ActiveForm;
use yii\widgets\Pjax;
use common\models\Countries;
use yii\helpers\ArrayHelper;
use common\models\Category;
/* @var $this yii\web\View */
/* @var $model frontend\models\LocationSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="location-search">
 <?php  Pjax::begin();?>
    <?php $form = ActiveForm::begin([
        'action' => ['location'],
        'method' => 'get',
    	'layout' => 'inline',	
    		//'template' => "{label}\n{beginWrapper}\n{input}\n{hint}\n{error}\n{endWrapper}",
    ]); ?>
   
    <?= $form->field($model, 'name', [
    'inputOptions' => [
        'placeholder' => $model->getAttributeLabel('name'), 
    ],])->label(false); ?>


   <?= $form->field($model, 'descr', [
    'inputOptions' => [
        'placeholder' => $model->getAttributeLabel('descr'), 
    ],])->label(false); ?>
    

    <?php $countries=Countries::find()->all(); $listData=ArrayHelper::map($countries,'ID','country_name');?>
    <?=  $form->field($model, 'countryID')->dropDownList( $listData,['prompt'=>'Kraj']); ?>
    
     <?php $categories=Category::find()->all(); $listData2=ArrayHelper::map($categories,'ID','name');?>
    <?=  $form->field($model, 'categoryID')->dropDownList( $listData2,['prompt'=>'Kategoria']); ?>
    
    <div class="form-group">
        <?= Html::submitButton('Szukaj', ['class' => 'btn btn-primary']) ?>
    </div>
    
    <?php ActiveForm::end(); ?>
 <?php Pjax::end();?>
</div>
