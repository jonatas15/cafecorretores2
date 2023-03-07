<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */

?>
<div class="corretor-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modo' => 'create'
    ]) ?>

</div>
