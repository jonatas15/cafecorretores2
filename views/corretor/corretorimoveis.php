<?php
use app\models\Corretor;
use app\models\Imovel;
use app\models\Levante;

$this->title = "Alteres";

$json = file_get_contents("cafeimoveiscorretor.json");
$data = json_decode($json);

function registra($idcorretor, $data){
    $array = '';
    $contador = 0;

    foreach ($data as $key => $value) {
        // echo $value->imovel . '<br>';
        if ($value->corretor == $idcorretor) {
            $array .= $value->imovel.';';
            $contador++;
        }
    }

    return [
        'ids' => $array,
        'cts' => $contador,
    ];
}
// foreach ($data as $key => $value) {
//     echo $value->imovel . '<br>';
// }
$corretores = Corretor::find()->all();
foreach ($corretores as $key => $value) {
    echo  $value->nome. '<br>';
    if (!in_array($value->jetimobid, ['', ' ', null, NULL, 'null'])) {
        // echo  registra($value->jetimobid, $data)['cts']. '<br>';
        // echo  registra($value->jetimobid, $data)['ids']. '<br>';
        $conta_salves = 0;
        foreach ($data as $key => $rel) {
            // echo $value->imovel . '<br>';
            if ($rel->corretor == $value->jetimobid) {
                // $array .= $value->imovel.';';
                // $contador++;
                $model = new Imovel();
                $model->corretor_id = $value->id;
                $model->codigo = $rel->imovel;
                if ($model->save()) {
                    $conta_salves ++;
                }
            }
        }
        echo "contados: $conta_salves <br>";
        // $model = Corretor::find()->where([
        //    'id' => $value->id
        // ])->one();
        // $model->imoveis = registra($value->jetimobid, $data)['ids'];
        // $model->numimoveis = registra($value->jetimobid, $data)['cts'];
        // $model->save();
    }
}