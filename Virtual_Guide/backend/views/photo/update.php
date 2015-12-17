<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Photo */

$this->title = 'Aktualizuj Zdjęcie: ' . ' ' . $model->ID;
$this->params['breadcrumbs'][] = ['label' => 'Zdjęcia', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ID, 'url' => ['view', 'id' => $model->ID]];
$this->params['breadcrumbs'][] = 'Aktualizuj';
?>
<div class="photo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
