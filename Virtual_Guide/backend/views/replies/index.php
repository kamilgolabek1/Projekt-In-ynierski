<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\RepliesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Replies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="replies-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Replies', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'ID',
            'content',
            'data',
            'topic.subject',
            'user.username',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
