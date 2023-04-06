<?php

use app\models\Visita;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\Pjax;
/** @var yii\web\View $this */
/** @var app\models\VisitaSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

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

            'id',
            'corretor_id',
            'imovel_id',
            'nome_corretor',
            'imobiliaria_parceira',
            //'data_registro',
            //'data_visita',
            //'hora_visita',
            //'codigo_imovel',
            //'visitante_nome',
            //'convertido',
            //'obs:ntext',
            //'contrato:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Visita $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>

    <?php Pjax::end(); ?>

</div>
