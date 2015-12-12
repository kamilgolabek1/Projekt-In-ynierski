<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\Topics;
use common\models\User;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model common\models\Replies */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="replies-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'content')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'data')->textInput() ?>

   <?php $topics=Topics::find()->all(); $listData2=ArrayHelper::map($topics,'id','subject');?>
    <?=  $form->field($model, 'topicID')->dropDownList( $listData2,['prompt'=>'Wątek']); ?>
    
    <?php $users=User::find()->all(); $listData=ArrayHelper::map($users,'ID','username');?>
    <?=  $form->field($model, 'userID')->dropDownList( $listData,['prompt'=>'Uzytkownik']); ?>
    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
