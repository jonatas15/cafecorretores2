<?php

use yii\helpers\Html;
// use yii\widgets\ActiveForm;
use yii\bootstrap5\ActiveForm;
use yii\widgets\MaskedInput;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="row corretor-form">

    <?php $form = ActiveForm::begin([
        'action' => $modo == 'create' ? Yii::$app->homeUrl.'corretor/create':Yii::$app->homeUrl.'corretor/update?id='.$model->id,
        'options' => ['enctype' => 'multipart/form-data']
    ]); ?>

    <div class="col-md-12">
        <?php //= $form->field($model, 'foto')->textInput(['maxlength' => true]) ?>
        <?php if(!$model->isNewRecord): ?>
        <div class="col-md-12" style="text-align:center">
        <?= Html::img(Yii::$app->homeUrl.'usuarios/'.$model->foto, ['width' => '200']);?>
        <hr>
        </div>
        <?php endif; ?>
        <div class="col-md-12" style="text-align:center">
        <?= $form->field($model, 'eventImage')->fileInput() ?>
        </div>
    </div>

    <div class="col-12 col-md-12 form-group"><?= $form->field($model, 'nome')->textInput(['maxlength' => true, 'class' => 'form-control']) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'registro')->textInput(['maxlength' => true]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'celular')->widget(MaskedInput::className(), [
        'mask' => '(99) 99999-9999',
        'options'=>[
            'inputmode'=>"numeric",
            'class'=>"form-control"
        ]
    ]) ?></div>
    <div class="col-12 col-md-12"><?= $form->field($model, 'obs')->textarea(['rows' => 6]) ?></div>
    <div class="col-12 col-md-12">
        <?= Html::submitButton('Salvar', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
