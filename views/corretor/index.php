<?php

use app\models\Corretor;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;

use yii\bootstrap5\Modal;
use kartik\editable\Editable;

/** @var yii\web\View $this */
/** @var app\models\CorretorSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$corretores = Corretor::find()->limit(8)->all();
echo '<div class="row">';
echo '<div class="col-12 col-md-6 row">';
$i = 1;
foreach ($corretores as $key => $val) {
    // echo $val->nome;
    echo '<div class="col-4 col-md-3" style="text-align: center !important;">';
    echo '<a class="btn btn-link btn-corretor" href="?CorretorSearch[id]='.$val->id.'">';
    if($val->foto == null || $val->foto == '' || empty($val->foto) || $val->foto == " " ) {
        $val->foto = 'ocorretor.png';
    }
    echo Html::img(Yii::$app->homeUrl.'usuarios/'.$val->foto, ['style'=> [
        'height' => '80px',
        'width' => '80px',
        'border-radius' => '100px',
        'object-fit'=> 'cover'
    ]]);
    echo '<br>';
    echo '<br>';
    echo "<label>{$val->nome}</label>";
    echo '</a>';
    echo '</div>';
    if ($i%4==0) {
        echo '</div>';
        echo '<div class="col-12 col-md-6 row">';
    }
    $i++;
}
echo '</div>';
echo '</div>';
echo '<div class="clearfix"></div>';

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

    <?php $dataProvider->pagination->pageSize = 100; ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            [
                'attribute'=>'foto',
                'filter'=>'',
                'format'=>'raw',
                'value'=>function($data){
                    if($data->foto == null || $data->foto == '' || empty($data->foto) || $data->foto == " " ) {
                        $data->foto = 'ocorretor.png';
                    }
                    return Html::img(Yii::$app->homeUrl.'usuarios/'.$data->foto, ['style'=> [
                        'height' => '40px !important',
                        'width' => '40px !important',
                        'border-radius' => '100px !important',
                        'object-fit'=> 'cover !important'
                    ]]);
                }
            ],
            'nome',
            'email:email',
            'registro',
            'celular',
            // 'jetimobid',
            [
                'attribute' => 'jetimobid',
                'format'=>'raw',
                'value' => function($data) {
                    return Editable::widget([
                        'name'=>'jetimobid', 
                        'asPopover' => true,
                        'value' => $data->jetimobid,
                        'header' => 'Id no Jetimob',
                        'size'=>'md',
                        'options' => [
                            'class'=>'form-control',
                            'placeholder'=>'Enter person name...',
                        ],
                        'formOptions' => [
                            'action' => [
                                'editcampo',
                                'id' => $data->id
                            ]
                        ],
                    ]);
                } 
            ],
            // 'obs',
            [
                'attribute' => 'id',
                'filter' => false,
                'header' => 'Nºs Macro',
                'format' => 'raw',
                'value' => function ($data) {
                    return '<center>'.$this->render('macros', [
                        'id' => $data->id,
                    ]).'</center>';
                },
                'headerOptions' => ['style' => 'width:5%; text-align: center'],
            ],
            [
                'attribute' => 'id',
                'filter' => false,
                'header' => 'Imóveis',
                'format' => 'raw',
                'value' => function ($data) {
                    return '<center>'.$this->render('imoveis', [
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
    .btn-corretor {
        height: 100%;
        width: 100%;
    }
    .btn-corretor:hover {
        background-color: lightcyan;
    }
</style>
