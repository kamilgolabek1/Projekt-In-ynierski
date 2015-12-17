<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Replies */

$this->title = 'Aktualizuj Opdowiedź: ' . ' ' . $model->ID;
$this->params['breadcrumbs'][] = ['label' => 'Odpowiedzi', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->ID, 'url' => ['view', 'id' => $model->ID]];
$this->params['breadcrumbs'][] = 'Aktualizuj';
?>
<div class="replies-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
