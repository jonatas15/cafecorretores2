<?php

use app\models\Visita;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
// use yii\grid\GridView;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
/** @var yii\web\View $this */
/** @var app\models\VisitaSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

use yii\web\JsExpression;
use kartik\editable\Editable;

$this->title = 'Visitas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="visita-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php //= Html::a('Create Visita', ['create'], ['class' => 'btn btn-success']) 
        $newmodel = new \app\models\Visita();
        ?>
        <?php 
        // echo $this->render('_form', ['model' => $newmodel]);
        echo $this->render('create', [
            'model' => $newmodel,
        ]);
        ?>
    </p>

    <?php Pjax::begin(); ?>
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
                'filter' => ArrayHelper::map(\app\models\Corretor::find()->all(), 'id','nome'),
                'value' => function($data) {
                    return $data->corretor->nome;
                }
            ],
            [
                'attribute' => 'imovel_id',
                'filter' => ArrayHelper::map(\app\models\Imovel::find()->all(), 'id','codigo'),
                'value' => function($data) {
                    return $data->imovel->codigo;
                }
            ],
            // 'imovel_id',
            'nome_corretor',
            'imobiliaria_parceira',
            //'data_registro',
            'data_visita',
            //'hora_visita',
            'codigo_imovel',
            'visitante_nome',
            // 'convertido',
            // 'obs:ntext',
            //'contrato:ntext',
            [
                'class' => 'kartik\grid\EditableColumn',
                // 'header'=>'Vendido?',
                'filter'=> ['0'=>'Não','1'=>'Sim'],
                'attribute' => 'convertido',
                'editableOptions' => function ($data) {
                    return [
                      'inputType' => Editable::INPUT_SWITCH,
                      'options' => [
                        'pluginOptions' => [
                            'onText' => 'SIM',
                            'offText' => 'Não',
                        ],
                      ],
                      'formOptions' => [ 'action' => [ 'editregistro'] ],
                      'displayValueConfig'=> [
                        '0' => '<div style="color:red"><i class="glyphicon glyphicon-thumbs-down"></i> Não</div>',
                        '1' => '<div style="color:green"><i class="glyphicon glyphicon-thumbs-up"></i> Sim</div>',
                      ],
                    ];
                },
            ],
            [
                'class' => ActionColumn::className(),
                'template' => '{delete}',
                'urlCreator' => function ($action, Visita $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
