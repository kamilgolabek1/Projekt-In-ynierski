<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Topics */

$this->title = 'Utwórz Wątek';
$this->params['breadcrumbs'][] = ['label' => 'Wątki', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="topics-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
