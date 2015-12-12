<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\Countries;
use yii\helpers\ArrayHelper;
use common\models\Category;
/* @var $this yii\web\View */
/* @var $model backend\models\Location */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="location-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descr')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'lon')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'lat')->textInput(['maxlength' => true]) ?>

	 <?php $countries=Countries::find()->all(); $listData=ArrayHelper::map($countries,'ID','country_name');?>
    <?=  $form->field($model, 'countryID')->dropDownList( $listData,['prompt'=>'Kraj']); ?>



    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'zoom')->textInput() ?>

   <?php $categories=Category::find()->all(); $listData2=ArrayHelper::map($categories,'ID','name');?>
    <?=  $form->field($model, 'categoryID')->dropDownList( $listData2,['prompt'=>'kategoria']); ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
