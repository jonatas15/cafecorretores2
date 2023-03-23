<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "levante".
 *
 * @property int $id
 * @property int $imovel_id
 * @property string $data_levantamento
 * @property int $acessos
 * @property int|null $usoforms
 * @property int|null $usomaps
 * @property int|null $usowhats
 *
 * @property Imovel $imovel
 */
class Levante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'levante';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['imovel_id', 'data_levantamento', 'acessos'], 'required'],
            [['imovel_id', 'acessos', 'usoforms', 'usomaps', 'usowhats'], 'integer'],
            [['data_levantamento'], 'safe'],
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
            'imovel_id' => 'Imovel ID',
            'data_levantamento' => 'Data Levantamento',
            'acessos' => 'Acessos',
            'usoforms' => 'Usoforms',
            'usomaps' => 'Usomaps',
            'usowhats' => 'Usowhats',
        ];
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
