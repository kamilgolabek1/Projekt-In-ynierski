<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Topics */

$this->title = 'Aktualizuj Wątek: ' . ' ' . $model->subject;
$this->params['breadcrumbs'][] = ['label' => 'Wątki', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->subject, 'url' => ['view', 'id' => $model->ID]];
$this->params['breadcrumbs'][] = 'Aktualizuj';
?>
<div class="topics-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
