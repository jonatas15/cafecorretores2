<?php

namespace app\controllers;

use app\models\Visita;
use app\models\VisitaSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

use yii\helpers\ArrayHelper;

/**
 * VisitaController implements the CRUD actions for Visita model.
 */
class VisitaController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    public function actionFiltrar() {
        $id = $_REQUEST['id'];
        $corretor = \app\models\Corretor::find()->where([
            'id' => $id,
        ])->one();
        
        $imoveis = \app\models\Imovel::find()->where([
            'corretor_id' => $id
        ])->all();
        $content_select = '<option  value="">Imóveis de '.$corretor->nome.'</option>';
        foreach ($imoveis as $imv) {
            $content_select .= "<option value='".$imv->id."'>".$imv->codigo."</option>";
        }
        return $content_select;
    }
    /**
     * Lists all Visita models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new VisitaSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Visita model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Visita model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Visita();

        if ($this->request->isPost) {
            // echo '<pre>';
            // print_r($this->request->post());
            // echo '</pre>';
            if ($model->load($this->request->post())) {
                $model->data_visita = $this->formatar_data_pro_banco($model->data_visita);
                $model->hora_visita = str_replace([' AM', ' PM'], ':00', $model->hora_visita);
                // echo $model->hora_visita;
                // exit();
                if ($model->save()) {
                    return $this->redirect(['index']);
                }
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Visita model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Visita model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Visita model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return Visita the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Visita::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
    public function formatar_data_pro_banco($data) {
        $arr = explode('/',$data);
        return $arr[2].'-'.$arr[1].'-'.$arr[0];
    }
    protected function clean($string) {
        $string = str_replace(' ', '', $string); // Replaces all spaces with hyphens.
        $string = preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
 
        return preg_replace('/-+/', '', $string); // Replaces multiple hyphens with single one.
     }
}
