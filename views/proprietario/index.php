<?php

use app\models\Proprietario;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use kartik\editable\Editable;
use yii\widgets\MaskedInput;
use yii\helpers\ArrayHelper;

/** @var yii\web\View $this */
/** @var app\models\ProprietarioSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Proprietarios cadastrados pelos corretores';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="proprietario-index">

    <h3><?= Html::encode($this->title) ?></h3>

    <p>
        <?php //= Html::a('Create Proprietario', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            // 'id',
            // 'corretor_id',
            [
                'attribute' => 'corretor_id',
                'filter' => ArrayHelper::map(\app\models\Corretor::find()->all(),'id','nome'),
                'value' => function ($data) {
                    return $data->corretor->nome;
                },
            ],
            // 'nome',
            // 'email:email',
            [
                'attribute' => 'nome',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'name'=>'nome', 
                        'asPopover' => true,
                        'value' => $data->nome,
                        'header' => 'Retorno',
                        'size'=>'md',
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'nome'
                            ]
                        ],
                    ]);
                } 
            ],
            [
                'attribute' => 'email',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'name'=>'email', 
                        'asPopover' => true,
                        'value' => $data->email,
                        'header' => 'Retorno',
                        'size'=>'md',
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'email'
                            ]
                        ],
                    ]);
                } 
            ],
            // 'telefone',
            [
                'attribute' => 'telefone',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'inputType' => Editable::INPUT_WIDGET,
                        'name'=>'telefone', 
                        'asPopover' => true,
                        'value' => $data->telefone,
                        'header' => 'Contato',
                        'size'=>'md',
                        'widgetClass' => MaskedInput::className(),
                        'options' => [
                            'mask' => ['(99) 9999-9999', '(99) 99999-9999'],
                            'class' => 'form-control',
                        ],
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'telefone'
                            ]
                        ],
                    ]);
                } 
            ],
            [
                'attribute' => 'cpf',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'inputType' => Editable::INPUT_WIDGET,
                        'name'=>'cpf', 
                        'asPopover' => true,
                        'value' => $data->cpf,
                        'header' => 'CPF',
                        'size'=>'md',
                        'widgetClass' => MaskedInput::className(),
                        'options' => [
                            'mask' => ['999.999.999-99', '99.999.999/9999-99'],
                            'class' => 'form-control',
                        ],
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'cpf'
                            ]
                        ],
                    ]);
                } 
            ],
            //'cpf',
            //'cnpj',
            //'endereco',
            //'linkmaps:ntext',
            //'retorno:ntext',
            [
                'attribute' => 'endereco',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'name'=>'endereco', 
                        'asPopover' => true,
                        'value' => $data->endereco,
                        'header' => 'Retorno',
                        'size'=>'md',
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'endereco'
                            ]
                        ],
                    ]);
                } 
            ],
            [
                'attribute' => 'retorno',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'name'=>'retorno', 
                        'asPopover' => true,
                        'value' => $data->retorno,
                        'header' => 'Retorno',
                        'size'=>'md',
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id,
                                'campo' => 'retorno'
                            ]
                        ],
                    ]);
                } 
            ],
            [
                'attribute' => 'linkmaps',
                'filter' => false,
                'format' => 'raw',
                'value' => function($data) {
                    return '<a href="'.$data->linkmaps.'" target="_blanck">Maps</a>';
                }
            ],
            [
                'header' => 'Gerenciar',
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Proprietario $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 },
                 'template' => '<center id="menu-acoes">{delete}</center>'
            ],
        ],
    ]); ?>
</div>
<style>
    #menu-acoes {
        padding-top: 10px;
    }
    #menu-acoes a {
        padding: 5px;
        border: 1px solid red;
        border-radius: 5px;
        background-color: red;
        top: 20px !important;
        color: white !important;
    }
    .btn-corretor {
        height: 100%;
        width: 100%;
    }
    .btn-corretor:hover {
        background-color: lightcyan;
    }
</style>