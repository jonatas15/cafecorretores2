<?php
use yii\bootstrap5\Modal;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\money\MaskMoney;

$model = \app\models\Corretor::find()->where([
    'id' => $id
])->one();

$listData = [
    '1' => 'Janeiro',
    '2' => 'Fevereiro',
    '3' => 'Março',
    '4' => 'Abril',
    '5' => 'Maio',
    '6' => 'Junho',
    '7' => 'Julho',
    '8' => 'Agosto',
    '9' => 'Setembro',
    '10' => 'Outubro',
    '11' => 'Novembro',
    '12' => 'Dezembro'
];

Modal::begin([
    'title' => 'Números Macro para '.$model->nome,
    'size' => 'modal-lg',
    'toggleButton' => [
        'label' => '📊',
        'class' => 'btn btn-success'
    ],
    'options' => [
        'id' => 'assignApplicantModal-'.$id,
        'tabindex' => false
    ]
]);
?>
<?php 
$form = ActiveForm::begin([
    'action' => '/corretor/numacros'
]); 
$modelmacros = new \app\models\Numacros();
?>
    <div class=""><?= $form->field($modelmacros, 'corretor_id')->hiddenInput(['value' => $model->id])->label(false) ?></div>
    <div class=""><?= $form->field($modelmacros, 'data')->hiddenInput(['value' => date('Y-m-d')])->label(false) ?></div>
    <div class="row">
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'leads_recebidos', 1, 100, 1, 'star', $id); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'percentual_conversao', 1, 100, 1, 'percent', $id); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'quant_vendas_vgc', 1, 100, 1, 'dollar-sign', $id); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'quant_vendas_vgv', 1, 100, 1, 'dollar-sign', $id); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'quant_visitas', 1, 100, 1, 'home', $id); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'quant_imoveis_agenciados', 1, 100, 1, 'home', $id); ?></div>
        <!-- <div class="col-12 col-md-6"><?php //= rangecampo($form, $modelmacros, 'ticket_medio_venda', 1, 20, 1, 'circle'); ?></div> -->
        <div class="col-12 col-md-6"><?= $form->field($modelmacros, 'ticket_medio_venda')->widget(MaskMoney::classname(), [
            'pluginOptions' => [
                'prefix' => 'R$ ',
                'thousands' => '.',
                'decimal' => ',',
                'precision' => 2,
                'allowNegative' => false,
                'value' => 0,
            ],
            'options' => [
                'id' => 'ticket_medio_venda_'.$id
            ]
        ]); ?></div>
        <!-- <div class="col-12 col-md-6"><?php //= rangecampo($form, $modelmacros, 'custo_lead', 1, 20, 1, 'dollar-sign'); ?></div> -->
        <div class="col-12 col-md-6"><?= $form->field($modelmacros, 'custo_lead')->widget(MaskMoney::classname(), [
            'pluginOptions' => [
                'prefix' => 'R$ ',
                'thousands' => '.',
                'decimal' => ',',
                'precision' => 2,
                'allowNegative' => false,
                'value' => 0,
            ],
            'options' => [
                'id' => 'custo_lead_'.$id
            ]
        ]); ?></div>
        <div class="col-12 col-md-6"><?= $this->context->rangecampo($form, $modelmacros, 'pos_ranking_geral_vendas', 1, 100, 1, 'list', $id); ?></div>
        <div class="col-12 col-md-6"><?php
                $modelmacros->mes_referencia = date('m');
            ?>
            <?= $form->field($modelmacros, 'mes_referencia')->dropDownList(
                $listData, 
                ['prompt'=>'Selecione']); 
            ?>
        </div>
        <div class="col-12 col-md-12">
            <div class="form-group">
                <?= Html::submitButton('Salvar', ['class' => 'btn btn-success']) ?>
            </div>
        </div>
        
    </div>
<?php ActiveForm::end(); ?>
<hr>
<h4>Histórico</h4>
<?php
// $numacrosmd = \app\models\Numacros::find()->where([
//     'corretor_id' => $model->id
// ])->all();
    foreach ($model->numacros as $m) {
        $head_numacros = "";
        foreach ($m as $key => $value) {
            if (!in_array($key, ['id', 'corretor_id', 'data', 'mes_referencia'])) {
                $valore = $value;
                if (in_array($key, ['ticket_medio_venda', 'custo_lead'])) {
                    $valore = 'R$ '.number_format($value,2,",",".");
                }
                $head_numacros .= '<tr><td>'.$m->getAttributeLabel($key).'</td><td><strong>'.$valore.'</strong></td></tr>';
            }
        }
        echo '<table class="table table-hover">';
        echo '<thead class="thead-dark">';
        echo '<tr>
            <th scope="col">Nºs Macro de '.$listData[$m->mes_referencia].'</th>
            <th scope="col">Registro em '.date('d/m/Y', strtotime($m->data)).'</th>
        </tr>';
        echo '</thead>';
        echo $head_numacros;
        echo '</table>';
    }
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
?>
<style scoped>
    /* estilos */
    .row .col-12 {
        margin: 10px 0px;
    }
    .row label {
        font-weight: 500;
        margin-bottom: 3px;
    }
    .input-group-text i {
        width: 25px !important;
    }
    .thead-dark {
        background-color: darkslategray;
        color: white;
    }
</style>
