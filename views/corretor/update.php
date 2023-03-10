<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */

$this->title = 'Update Corretor: ' . $model->nome;
$this->params['breadcrumbs'][] = ['label' => 'Corretores', 'url' => ['index']];
// $this->params['breadcrumbs'][] = ['label' => $model->nome, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="corretor-update row">

    <h3><?= Html::encode($this->title) ?></h3>
    <div class="col-md-4">
        <?= $this->render('_form', [
            'model' => $model,
            'modo' => 'update'
        ]) ?>
    </div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>

</div>
