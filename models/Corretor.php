<?php

namespace app\models;
use yii\web\UploadedFile;


use Yii;

/**
 * This is the model class for table "corretor".
 *
 * @property int $id
 * @property string $nome
 * @property string $email
 * @property string $celular
 * @property string|null $registro
 * @property string|null $obs
 *
 * @property Chamada[] $chamadas
 * @property Metas[] $metas
 * @property Numacros[] $numacros
 * @property Whatssend[] $whatssends
 */
class Corretor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public $eventImage;
    public static function tableName()
    {
        return 'corretor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nome', 'email', 'celular'], 'required'],
            [['obs'], 'string'],
            [['foto'], 'string'],
            [['nome'], 'string', 'max' => 250],
            [['email'], 'string', 'max' => 100],
            [['celular', 'registro'], 'string', 'max' => 15],
            [['eventImage'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg, gif, jpeg, PNG, JPG, GIF, JPEG']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Id',
            'nome' => 'Nome',
            'email' => 'Email',
            'celular' => 'Celular',
            'registro' => 'Registro',
            'obs' => 'Observações',
            'eventImage' => 'Foto'
        ];
    }

    /**
     * Gets query for [[Chamadas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getChamadas()
    {
        return $this->hasMany(Chamada::class, ['corretor_id' => 'id']);
    }

    /**
     * Gets query for [[Metas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMetas()
    {
        return $this->hasMany(Metas::class, ['corretor_id' => 'id']);
    }

    /**
     * Gets query for [[Numacros]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getNumacros()
    {
        return $this->hasMany(Numacros::class, ['corretor_id' => 'id'])->orderBy([
            'data' => SORT_DESC,
            'mes_referencia' => SORT_DESC,
        ])->limit(12);
    }

    /**
     * Gets query for [[Whatssends]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWhatssends()
    {
        return $this->hasMany(Whatssend::class, ['corretor_id' => 'id']);
    }
    /**
     * Upload de foto
     */
    public function upload()
    {
        if ($this->validate()) {
            $this->eventImage->saveAs(Yii::$app->basePath.'/web/usuarios/' . $this->eventImage->baseName . '.' . $this->eventImage->extension);
            return true;
        } else {
            return false;
        }
    }

    // Para a API
    public function fields() {
        return [
            'id',
            'nome',
            'email',
            'celular',
            'registro',
            'eventImage',
            'macros' => function(Corretor $model) {
                return $model->numacros;
            }
        ];
    }
}
