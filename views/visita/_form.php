<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
// use yii\widgets\ActiveForm;
use yii\bootstrap5\ActiveForm;
use kartik\time\TimePicker;


/** @var yii\web\View $this */
/** @var app\models\Visita $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="visita-form">

    <?php $form = ActiveForm::begin([
        'action' => Yii::$app->homeUrl.'visita/create'
    ]); ?>
    <div class="row">
        <div class="col-6 col-md-6">
            <?php
                $corretores = \app\models\Corretor::find()->all();
                $listacorretores = ArrayHelper::map($corretores,'id','nome');
            ?>
            <?= $form->field($model, 'corretor_id')->dropDownList($listacorretores,
                [
                    'onchange' => '$.post("' . Yii::$app->homeUrl . "visita/filtrar?id=" .'" + $(this).val(), function(data) {
                        $("#visita-imovel_id").html(data)
                        console.log("sss")
                    })'
                ]); 
            ?>
        </div>
        <div class="col-6 col-md-6">
            <?php
                $imoveis = \app\models\Imovel::find()->all();
                $listaimoveis = ArrayHelper::map($imoveis,'id','codigo');
            ?>
            <?= $form->field($model, 'imovel_id')->dropDownList($listaimoveis); ?>
        </div>
        <div class="col-6 col-md-6">
        <?= $form->field($model, 'nome_corretor')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-6 col-md-6">
        <?= $form->field($model, 'imobiliaria_parceira')->textInput(['maxlength' => true]) ?>
        </div>
        <!-- <div class="col-6 col-md-4"> -->
        <?php //= $form->field($model, 'data_registro')->textInput() ?>
        <!-- </div> -->
        <div class="col-6 col-md-6">
        <?= $form->field($model, 'data_visita')->widget(\yii\jui\DatePicker::classname(), [
            'language' => 'pt',
            'dateFormat' => 'dd/MM/yyyy',
            'options' => [
                'class' => 'form-control',
            ]
        ]) ?>
        </div>
        <div class="col-6 col-md-6">
        <?php //= $form->field($model, 'hora_visita')->textInput() ?>
        <?php
            echo $form->field($model, 'hora_visita')->widget(TimePicker::classname(), [
                'pluginOptions' => [
                    'showSeconds' => false
                ]
            ]);
        ?>
        </div>
        <div class="col-6 col-md-6">
        <?= $form->field($model, 'codigo_imovel')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-6 col-md-6">
        <?= $form->field($model, 'visitante_nome')->textInput(['maxlength' => true]) ?>
        </div>
        <!-- <div class="col-6 col-md-6"> -->
        <?php ?>
        <?php //= $form->field($model, 'convertido')->textInput() ?>
        <!-- </div> -->
        <!-- <div class="col-6 col-md-4">
        <?php //= $form->field($model, 'obs')->textarea(['rows' => 6]) ?>
        </div>
        <div class="col-6 col-md-4">
        <?php //= $form->field($model, 'contrato')->textarea(['rows' => 6]) ?>
        </div> -->
        <div class="col-6 col-md-6">
            <label><br><br></label>
            <?= Html::submitButton('Salvar', ['class' => 'btn btn-success']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>
