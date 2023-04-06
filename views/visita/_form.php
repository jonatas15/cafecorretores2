<?php

use yii\helpers\Html;
// use yii\widgets\ActiveForm;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Visita $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="visita-form">

    <?php $form = ActiveForm::begin([
        'action' => Yii::$app->homeUrl.'visita/create'
    ]); ?>
    <div class="row">
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'corretor_id')->textInput() ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'imovel_id')->textInput() ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'nome_corretor')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'imobiliaria_parceira')->textInput(['maxlength' => true]) ?>
        </div>
        <!-- <div class="col-6 col-md-4"> -->
        <?php //= $form->field($model, 'data_registro')->textInput() ?>
        <!-- </div> -->
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'data_visita')->textInput() ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'hora_visita')->textInput() ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'codigo_imovel')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-6 col-md-4">
        <?= $form->field($model, 'visitante_nome')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-6 col-md-4">
        <?php ?>
        <?= $form->field($model, 'convertido')->textInput() ?>
        </div>
        <!-- <div class="col-6 col-md-4">
        <?php //= $form->field($model, 'obs')->textarea(['rows' => 6]) ?>
        </div>
        <div class="col-6 col-md-4">
        <?php //= $form->field($model, 'contrato')->textarea(['rows' => 6]) ?>
        </div> -->
        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
