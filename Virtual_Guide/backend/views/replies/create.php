<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Replies */

$this->title = 'Create Replies';
$this->params['breadcrumbs'][] = ['label' => 'Replies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="replies-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
