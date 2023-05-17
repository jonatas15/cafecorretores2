<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Proprietario $model */

$this->title = 'Create Proprietario';
$this->params['breadcrumbs'][] = ['label' => 'Proprietarios', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="proprietario-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
