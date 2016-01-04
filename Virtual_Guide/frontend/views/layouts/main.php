<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
		
		
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'Wirtualny Przewodnik',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    $menuItems = [
        ['label' => 'Strona Główna', 'url' => ['/site/index']],
		['label' => 'Lokalizacje', 'url' => ['/site/location']],
		['label' => 'Forum', 'url' => ['/forum/forum']],
        ['label' => 'Kontakt', 'url' => ['/site/contact']],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Rejestracja', 'url' => ['/site/signup']];
        $menuItems[] = ['label' => 'Logowanie', 'url' => ['/site/login']];
    } else {
        $menuItems[] = [
            'label' => 'Wyloguj (' . Yii::$app->user->identity->username . ')',
            'url' => ['/site/logout'],
            'linkOptions' => ['data-method' => 'post']
        ];
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container<?= $this->params['fluid'] ? '-fluid' : '' ?>">
        <?= Breadcrumbs::widget([
        'homeLink' => ['label' => 'Strona Główna',
        'url' => Yii::$app->getHomeUrl()],
        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [], 
    ]); ?>
        
       
        
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<?= $this->params['fullscreen'] ? '' : 
'<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Wirtualny Przewodnik ' .date('Y'). '</p>
    </div>
</footer>'
?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
