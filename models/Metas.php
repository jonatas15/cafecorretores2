<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "metas".
 *
 * @property int $id
 * @property string|null $agenciamentos
 * @property string|null $placas
 * @property string|null $gestao_imoveis
 * @property string|null $recuperacao_leads
 * @property string|null $prospeccoes
 * @property string|null $incentivo_semanal
 * @property int|null $corretor_id
 *
 * @property Corretor $corretor
 */
class Metas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'metas';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['incentivo_semanal'], 'string'],
            [['corretor_id'], 'integer'],
            [['agenciamentos', 'placas', 'gestao_imoveis', 'recuperacao_leads', 'prospeccoes'], 'string', 'max' => 10],
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
            'agenciamentos' => 'Agenciamentos',
            'placas' => 'Placas',
            'gestao_imoveis' => 'Gestao Imoveis',
            'recuperacao_leads' => 'Recuperacao Leads',
            'prospeccoes' => 'Prospeccoes',
            'incentivo_semanal' => 'Incentivo Semanal',
            'corretor_id' => 'Corretor ID',
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
}
