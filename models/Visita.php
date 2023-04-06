<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "visita".
 *
 * @property int $id
 * @property int|null $corretor_id
 * @property int|null $imovel_id
 * @property string|null $nome_corretor
 * @property string|null $imobiliaria_parceira
 * @property string $data_registro
 * @property string $data_visita
 * @property string|null $hora_visita
 * @property string|null $codigo_imovel
 * @property string $visitante_nome
 * @property int $convertido
 * @property string|null $obs
 * @property string|null $contrato
 *
 * @property Corretor $corretor
 * @property Imovel $imovel
 */
class Visita extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'visita';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['corretor_id', 'imovel_id', 'convertido'], 'integer'],
            [['data_registro', 'data_visita', 'hora_visita'], 'safe'],
            [['data_visita', 'visitante_nome'], 'required'],
            [['obs', 'contrato'], 'string'],
            [['nome_corretor'], 'string', 'max' => 145],
            [['imobiliaria_parceira'], 'string', 'max' => 245],
            [['codigo_imovel'], 'string', 'max' => 20],
            [['visitante_nome'], 'string', 'max' => 250],
            [['corretor_id'], 'exist', 'skipOnError' => true, 'targetClass' => Corretor::class, 'targetAttribute' => ['corretor_id' => 'id']],
            [['imovel_id'], 'exist', 'skipOnError' => true, 'targetClass' => Imovel::class, 'targetAttribute' => ['imovel_id' => 'id']],
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
            'imovel_id' => 'Imovel ID',
            'nome_corretor' => 'Nome Corretor',
            'imobiliaria_parceira' => 'Imobiliaria Parceira',
            'data_registro' => 'Data Registro',
            'data_visita' => 'Data Visita',
            'hora_visita' => 'Hora Visita',
            'codigo_imovel' => 'Codigo Imovel',
            'visitante_nome' => 'Visitante Nome',
            'convertido' => 'Convertido',
            'obs' => 'Obs',
            'contrato' => 'Contrato',
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
     * Gets query for [[Imovel]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getImovel()
    {
        return $this->hasOne(Imovel::class, ['id' => 'imovel_id']);
    }
}
