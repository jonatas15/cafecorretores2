<?php

use yii\helpers\Html;
use yii\bootstrap5\Modal;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */

?>
<?php Modal::begin([
    'title' => 'Nova visita',
    'size' => 'modal-lg',
    'toggleButton' => [
        'label' => 'Registrar nova visita',
        'class' => 'btn btn-success'
    ],
]); ?>
    <?= $this->render('_form', [
        'model' => $model,
        'modo' => 'create'
    ]) ?>
<?php Modal::end(); ?>
