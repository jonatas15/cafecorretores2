<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="corretor-form">

    <?php $form = ActiveForm::begin([
        'action' => 'corretor/create',
        'options' => [
            ]
    ]); ?>

    <?= $form->field($model, 'nome')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'celular')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'registro')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'obs')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
