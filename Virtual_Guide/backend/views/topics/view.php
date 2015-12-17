<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Topics */

$this->title = $model->subject;
$this->params['breadcrumbs'][] = ['label' => 'Wątki', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="topics-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Aktualizuj', ['update', 'id' => $model->ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Usuń', ['delete', 'id' => $model->ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ID',
            'subject',
            'date',
            'category.name',
            'user.username',
        		'tag'
        ],
    ]) ?>

</div>
