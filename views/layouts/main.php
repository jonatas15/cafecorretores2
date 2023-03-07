<?php

/** @var yii\web\View $this */
/** @var string $content */

use app\assets\AppAsset;
use app\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use webvimark\modules\UserManagement\UserManagementModule;

// Ícones
use rmrevin\yii\fontawesome\FAS as FA;

AppAsset::register($this);

$this->registerCsrfMetaTags();
$this->registerMetaTag(['charset' => Yii::$app->charset], 'charset');
$this->registerMetaTag(['name' => 'viewport', 'content' => 'width=device-width, initial-scale=1, shrink-to-fit=no']);
$this->registerMetaTag(['name' => 'description', 'content' => $this->params['meta_description'] ?? '']);
$this->registerMetaTag(['name' => 'keywords', 'content' => $this->params['meta_keywords'] ?? '']);
$this->registerLinkTag(['rel' => 'icon', 'type' => 'image/x-icon', 'href' => Yii::getAlias('@web/favicon.ico')]);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
    <title><?= Html::encode($this->title) ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>

<header id="header">
    <?php
    NavBar::begin([
        'brandLabel' => 'Corretores',
        // 'options' => ['class' => 'navbar-nav navbar-right'],
        'brandUrl' => Yii::$app->homeUrl,
        'options' => ['class' => 'navbar navbar-expand-lg navbar-dark bg-dark fixed-top navbar-collapse'],
    ]);
    echo Nav::widget([
        'encodeLabels' => false,
        // 'options' => ['class' => 'navbar-nav'],
        'options' => ['class' => 'navbar-nav me-auto mb-2 mb-lg-0'],
        'items' => [
            ['label' => FA::icon('home').' Home', 'url' => ['/site/index']],
            ['label' => FA::icon('walking').' Corretores', 'url' => ['/corretor']],
            // ['label' => 'About', 'url' => ['/site/about']], 
            // ['label' => 'Contact', 'url' => ['/site/contact']],
        ]
    ]);
    // echo '========================================================';
    echo Nav::widget([
        'encodeLabels' => false,
        'options' => [
            'class' => 'navbar-nav'
        ],
        'items' => [
            ['label' => FA::icon('cog')->spin().' Usuários', 'items' => UserManagementModule::menuItems()],
            Yii::$app->user->isGuest
                ? ['label' => FA::icon('lock').' Login' ,'items' => [
                    ['label'=>'Login', 'url'=>['/user-management/auth/login']],
                    ['label'=>'Registration', 'url'=>['/user-management/auth/registration']],
                    ['label'=>'Change own password', 'url'=>['/user-management/auth/change-own-password']],
                    ['label'=>'Password recovery', 'url'=>['/user-management/auth/password-recovery']],
                    ['label'=>'E-mail confirmation', 'url'=>['/user-management/auth/confirm-email']],
                ]]
                : '<li class="nav-item">'
                    . Html::beginForm(['/site/logout'])
                    . Html::submitButton(
                        FA::icon('lock').' Logout (' . Yii::$app->user->identity->username . ')',
                        ['class' => 'nav-link btn btn-link logout']
                    )
                    . Html::endForm()
                    . '</li>'
        ]
    ]);
    // echo '<form class="d-flex">
    //     <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
    //     <button class="btn btn-outline-success" type="submit">Search</button>
    // </form>';
    NavBar::end();
    ?>
</header>

<main id="main" class="flex-shrink-0" role="main">
    <div class="container">
        <?php if (!empty($this->params['breadcrumbs'])): ?>
            <?= Breadcrumbs::widget(['links' => $this->params['breadcrumbs']]) ?>
        <?php endif ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>

<footer id="footer" class="mt-auto py-3 bg-light">
    <div class="container">
        <div class="row text-muted">
            <div class="col-md-6 text-center text-md-start">&copy; My Company <?= date('Y') ?></div>
            <div class="col-md-6 text-center text-md-end"><?= Yii::powered() ?></div>
        </div>
    </div>
</footer>
<style lang="">
    .pull-right {
        float: right !important;
    }
</style>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
