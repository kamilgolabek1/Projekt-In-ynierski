<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Comments */
/* @var $form ActiveForm */
?>
<div class="comments">

    <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($model, 'LocationID') ?>
        <?= $form->field($model, 'UserID') ?>
        <?= $form->field($model, 'Data') ?>
        <?= $form->field($model, 'Comment') ?>
    
        <div class="form-group">
            <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div><!-- comments -->
