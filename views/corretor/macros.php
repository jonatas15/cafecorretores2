<?php
use kartik\range\RangeInput;
use yii\bootstrap5\Modal;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

function rangecampo($form, $modelmacros, $campo, $value, $max, $min) {
    $modelmacros->$campo = $value;
    return $form->field($modelmacros, $campo)->widget(RangeInput::classname(), [
        'options' => [
            'placeholder' => 'Leads', 
            'size' => 'lg',
        ],
        'html5Container' => ['style' => 'width: 70%'],
        'html5Options' => ['min' => $min, 'max' => $max],
        'addon' => ['append' => ['content' => '<i class="fas fa-star"></i>']]
    ]);
}

Modal::begin([
    'title' => 'Números Macro para '.$model->nome,
    'size' => 'modal-lg',
    'toggleButton' => [
        'label' => '📊',
        'class' => 'btn btn-success'
    ],
    'options' => [
        'id' => 'assignApplicantModal',
        'tabindex' => false
    ]
]);
?>
<?php 
$form = ActiveForm::begin(); 
$modelmacros = new \app\models\Numacros();
?>
    <div class=""><?= $form->field($modelmacros, 'corretor_id')->hiddenInput(['value' => $model->id])->label(false) ?></div>
    <div class=""><?= $form->field($modelmacros, 'data')->hiddenInput(['value' => date('Y-m-d')])->label(false) ?></div>
    <div class="row">
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'percentual_conversao', 1, 100, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'quant_vendas_vgc', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'quant_vendas_vgv', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'quant_visitas', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'quant_imoveis_agenciados', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'ticket_medio_venda', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'custo_lead', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'pos_ranking_geral_vendas', 1, 20, 1); ?></div>
        <div class="col-12 col-md-6"><?= rangecampo($form, $modelmacros, 'mes_referencia', 1, 20, 1); ?></div>
        <div class="col-12 col-md-12">
            <div class="form-group">
                <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
            </div>
        </div>
        
    </div>
<?php ActiveForm::end(); ?>
<?php
Modal::end();

// VOLTAR AO BANCO DE DADOS E TRABALHAR METAS E NÚMEROS MACROS PERIÓDICOS, POR MÊS
// Ícones - Emojis
/**
 * 📈 
 * 📊
 * 📉
 * 💹
 * 🚀
 */