<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\models\Corretor $model */

?>
<div class="corretor-create">

    <?= $this->render('_form', [
        'model' => $model,
        'modo' => 'create'
    ]) ?>

</div>
