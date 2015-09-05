<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\LocationSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="location-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ID') ?>

    <?= $form->field($model, 'Nazwa') ?>

    <?= $form->field($model, 'Opis') ?>

    <?= $form->field($model, 'Lon') ?>

    <?= $form->field($model, 'Lat') ?>

    <?php // echo $form->field($model, 'ForumID') ?>

    <?php // echo $form->field($model, 'Adres') ?>

    <?php // echo $form->field($model, 'Category') ?>

    <?php // echo $form->field($model, 'Zoom') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
