<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\MaskedInput;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row corretor-form">

    <?php $form = ActiveForm::begin([
        'action' => $modo == 'create' ? '/corretor/create':'/corretor/update?id='.$model->id,
        'options' => [
        ]
    ]); ?>

    <div class="col-12 col-md-12"><?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'celular')->widget(MaskedInput::className(), [
        'mask' => '(99) 99999-9999',
        'options'=>[
            'inputmode'=>"numeric",
            'class'=>"form-control"
        ]
    ]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'registro')->textInput(['maxlength' => true]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'obs')->textarea(['rows' => 6]) ?></div>
    <div class="col-12 col-md-12">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
