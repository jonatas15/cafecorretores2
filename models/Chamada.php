<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "chamada".
 *
 * @property int $id
 * @property int $corretor_id
 * @property string $data
 * @property string $titulo
 * @property string|null $descricao
 * @property string|null $prioridade
 * @property string|null $prazo
 * @property string|null $horario
 * @property string|null $data_def
 *
 * @property Corretor $corretor
 * @property Whatssend[] $whatssends
 */
class Chamada extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'chamada';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['corretor_id', 'data', 'titulo'], 'required'],
            [['corretor_id'], 'integer'],
            [['data', 'prazo', 'horario', 'data_def'], 'safe'],
            [['descricao', 'prioridade'], 'string'],
            [['titulo'], 'string', 'max' => 250],
            [['corretor_id'], 'exist', 'skipOnError' => true, 'targetClass' => Corretor::class, 'targetAttribute' => ['corretor_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'corretor_id' => 'Corretor ID',
            'data' => 'Data',
            'titulo' => 'Titulo',
            'descricao' => 'Descricao',
            'prioridade' => 'Prioridade',
            'prazo' => 'Prazo',
            'horario' => 'Horario',
            'data_def' => 'Data Def',
        ];
    }

    /**
     * Gets query for [[Corretor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCorretor()
    {
        return $this->hasOne(Corretor::class, ['id' => 'corretor_id']);
    }

    /**
     * Gets query for [[Whatssends]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWhatssends()
    {
        return $this->hasMany(Whatssend::class, ['chamada_id' => 'id']);
    }
}
