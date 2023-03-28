<?php

use app\models\Levante;
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
    'title' => 'Imóveis de '.$model->nome,
    'size' => 'modal-lg',
    'toggleButton' => [
        'label' => '🏠',
        'class' => 'btn btn-success'
    ],
    'options' => [
        'id' => 'assignApplicantModal-imoveis-'.$id,
        'tabindex' => false
    ]
]);
?>
<h4>Imóveis</h4>
<?php
// $numacrosmd = \app\models\Numacros::find()->where([
//     'corretor_id' => $model->id
// ])->all();
$head_numacros = "";
    foreach ($model->imovel as $m) {
        // foreach ($m as $key => $value) {
        //     if ($key == 'id') {
        //         $iddd = $value;
        //         $levante = Levante::find()->where([
        //             'imovel_id' => $iddd
        //         ])->one();
        //     }
        //     // $head_numacros .= '<tr>'.
        //     // '<td>'.$key.'</td>';
        //     // '</tr>';
        //     if (!in_array($key, ['id', 'corretor_id', 'data', 'mes_referencia'])) {
        //         $valore = $value;
        //     }
        // }
        $acessos_contados = 0;
        if ($m->levante->acessos) {
            $acessos_contados = $m->levante->acessos;
        }
        $classetr = "";
        switch (true) {
            case $acessos_contados > 500:
                $classetr = 'background-color: #008000; color: #fff';
                break;
            case $acessos_contados > 100 && $acessos_contados < 500:
                $classetr = 'background-color: #6eaa5e;';
                break;
            case $acessos_contados > 50 && $acessos_contados < 100:
                $classetr = 'background-color: #93bf85;';
                break;
            case $acessos_contados > 10 && $acessos_contados < 50:
                $classetr = 'background-color: #b7d5ac;';
                break;
            default:
                $classetr = 'background-color: #dbead5;';
                break;
        }
        $head_numacros .= '<tr style="'.$classetr.'">'.
            '<td><strong>PIN-'.$m->codigo.'</strong></td>'.
            '<td><strong>'.$acessos_contados.'</strong></td>'.
        '</tr>';
    }
    echo '<table class="table table-hover">';
    echo $head_numacros;
    echo '</table>';
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
