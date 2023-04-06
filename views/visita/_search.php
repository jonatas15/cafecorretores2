<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\VisitaSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="visita-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'corretor_id') ?>

    <?= $form->field($model, 'imovel_id') ?>

    <?= $form->field($model, 'nome_corretor') ?>

    <?= $form->field($model, 'imobiliaria_parceira') ?>

    <?php // echo $form->field($model, 'data_registro') ?>

    <?php // echo $form->field($model, 'data_visita') ?>

    <?php // echo $form->field($model, 'hora_visita') ?>

    <?php // echo $form->field($model, 'codigo_imovel') ?>

    <?php // echo $form->field($model, 'visitante_nome') ?>

    <?php // echo $form->field($model, 'convertido') ?>

    <?php // echo $form->field($model, 'obs') ?>

    <?php // echo $form->field($model, 'contrato') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
