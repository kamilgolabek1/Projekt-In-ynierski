<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Location */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="location-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'ID')->textInput() ?>

    <?= $form->field($model, 'Nazwa')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Opis')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Lon')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Lat')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ForumID')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Adres')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Category')->textInput() ?>

    <?= $form->field($model, 'Zoom')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
