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
$todos_os_codigos = [];
$imoveisnosistema = Imovel::find()->all();
foreach ($imoveisnosistema as $imv) {
    array_push($todos_os_codigos, $imv->codigo);
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
                if (in_array($rel->imovel, $todos_os_codigos)) {
                    // echo $rel->imovel . ' JÁ está lá com '.$value->nome.'<br>';
                } else {
                    // echo $rel->imovel . ' NÃO está lá'.'<br>';
                    $model = new Imovel();
                    $model->corretor_id = $value->id;
                    $model->codigo = $rel->imovel;
                    if ($model->save()) {
                        $conta_salves ++;
                    }

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
//Aqui, vamos cadastrar as visitas e fim de papo ou nao
$jsonimvacessos0 = file_get_contents("acessosporimovelgeral.json");
$dataimvacessos = json_decode($jsonimvacessos0);

// print_r($dataimvacessos0);

$imoveisnosistema = Imovel::find()->all();
foreach ($imoveisnosistema as $imv) {
    foreach ($dataimvacessos as $acesso) {
        // echo "$acesso->imovel == $imv->codigo";
        # code...
        if ($acesso->imovel == $imv->codigo) {
            $levante = new Levante();
            $levante->imovel_id = $imv->id;
            $levante->data_levantamento = '2023-03-27';
            $acessoscont = 0;
            if (!empty($acesso->acessos) && $acesso->acessos > 0) {
                $acessoscont = (int)$acesso->acessos;
            }
            $levante->acessos = $acessoscont;
            if ($levante->save()) {
                echo '<br> - Registrado '. $acessoscont . ' para Imóvel '. $imv->codigo;
            }

        }
    }
}