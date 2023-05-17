<?php

namespace app\controllers;

use app\models\Corretor;
use app\models\CorretorSearch;
use app\models\Numacros;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use kartik\range\RangeInput;
use yii\web\UploadedFile;

/**
 * CorretorController implements the CRUD actions for Corretor model.
 */
class CorretorController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return [
            'ghost-access'=> [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
        ];
    }

    /**
     * Lists all Corretor models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new CorretorSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    public function actionCorretorimoveis()
    {
        return $this->render('corretorimoveis');
    }

    /**
     * Displays a single Corretor model.
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
     * Creates a new Corretor model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $model = new Corretor();

        if ($this->request->isPost) {
            // $model->eventImage = UploadedFile::getInstance($model, 'eventImage');
            if ($model->load($this->request->post())) {
                $model->eventImage = UploadedFile::getInstance($model, 'eventImage');
                if ($model->eventImage)
                    $model->foto = $model->eventImage->baseName.'.'.$model->eventImage->extension;
                if ($model->save()) {
                    if ($model->eventImage){
                        $model->upload();
                    }
                    $this->redirect(\Yii::$app->request->referrer);
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
     * Updates an existing Corretor model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post())) {
            $model->eventImage = UploadedFile::getInstance($model, 'eventImage');
            if ($model->eventImage) {
                $model->foto = $model->eventImage->baseName.'.'.$model->eventImage->extension;
            }
            if ($model->save()) {
                if ($model->eventImage){
                    $model->upload();
                }
                $this->redirect('index');
            }
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actionNumacros()
    {
        $model = new Numacros;

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            $this->redirect(\Yii::$app->request->referrer);
        }
    }

    /**
     * Deletes an existing Corretor model.
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
     * Finds the Corretor model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return Corretor the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Corretor::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function rangecampo($form, $modelmacros, $campo, $value, $max, $min, $icon, $idcorretor) {
        $modelmacros->$campo = $value;
        return $form->field($modelmacros, $campo)->widget(RangeInput::classname(), [
            'options' => [
                'placeholder' => 'Leads', 
                'size' => 'lg',
                'id' => $campo.'_'.$idcorretor
            ],
            'html5Container' => ['style' => 'width: 70%'],
            'html5Options' => ['min' => $min, 'max' => $max, 'style' => 'width: 100%'],
            'addon' => ['append' => ['content' => "<i class='fas fa-solid fa-$icon'></i>"]]
        ]);
    }
    /**
     * Editar Campo
     */
    public function actionEditcampo($id) {
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $r_jetimobid = $_REQUEST['jetimobid'];
        $r_idsistema = $_REQUEST['idsistema'];
        $model = $this->findModel($id);
        $model->jetimobid = $r_jetimobid != "" ? $r_jetimobid : $model->jetimobid;
        $model->idsistema = $r_idsistema != "" ? $r_idsistema : $model->idsistema;
        $model->save();
        return ['output' => $r_jetimobid, 'message'=>''];
    }
}
