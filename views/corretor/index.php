<?php

use app\models\Corretor;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;

use yii\bootstrap5\Modal;

/** @var yii\web\View $this */
/** @var app\models\CorretorSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Corretores';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="corretor-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?php 
            Modal::begin([
                'title' => 'Novo Corretor',
                'toggleButton' => [
                    'label' => 'Novo Corretor',
                    'class' => 'btn btn-success'
                ],
            ]);
            
                $novocorretor = new Corretor();
                echo $this->render('create', [
                    'model' => $novocorretor,
                ]);
            
            Modal::end();
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
            [
                'attribute'=>'foto',
                'filter'=>'',
                'format'=>'html',
                'value'=>function($data){
                    return Html::img(Yii::$app->homeUrl.'usuarios/'.$data->foto, ['style'=> [
                        'max-height' => '40px',
                        'max-width' => '50px',
                    ]]);
                }
            ],
            'nome',
            'email:email',
            'celular',
            'registro',
            'obs',
            [
                'attribute' => 'id',
                'header' => 'Nºs Macro',
                'format' => 'raw',
                'value' => function ($data) {
                    return '<center>'.$this->render('macros', [
                        'id' => $data->id,
                    ]).'</center>';
                },
                'headerOptions' => ['style' => 'width:5%; text-align: center'],
            ],
            // [
            //     'attribute' => 'id',
            //     'header' => 'Metas',
            //     'format' => 'raw',
            //     'value' => function ($data) {
            //         $corretor = Corretor::findOne($data->id);
            //         return $this->render('metas', [
            //             'model' => $corretor,
            //         ]);
            //     }
            // ]
            [
                'header' => 'Gerenciar',
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Corretor $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 },
                 'template' => '<center id="menu-acoes">{update} {delete}</center>'
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
<style>
    #menu-acoes {
        padding-top: 10px;
    }
    #menu-acoes a {
        padding: 8px;
        border: 1px solid blue;
        border-radius: 5px;
        background-color: blue;
        top: 20px !important;
        color: white !important;
    }
</style>
