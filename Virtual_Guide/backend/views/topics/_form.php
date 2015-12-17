<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\Category;
use common\models\User;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\Topics */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="topics-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'subject')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'date')->textInput() ?>

    
    
      <?php $categories=Category::find()->all(); $listData2=ArrayHelper::map($categories,'ID','name');?>
    <?=  $form->field($model, 'categoryID')->dropDownList( $listData2,['prompt'=>'kategoria']); ?>
    
    
    <?php $users=User::find()->all(); $listData=ArrayHelper::map($users,'ID','username');?>
    <?=  $form->field($model, 'userID')->dropDownList( $listData,['prompt'=>'Uzytkownik']); ?>
	 <?= $form->field($model, 'tag')->textInput(['maxlength' => true]) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Utwórz' : 'Aktualizuj', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
