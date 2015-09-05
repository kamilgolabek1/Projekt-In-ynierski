<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Photos */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="photos-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'LocationID')->textInput() ?>

    <?= $form->field($model, 'Comment')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'UserId')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
