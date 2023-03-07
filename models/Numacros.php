<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "numacros".
 *
 * @property int $id
 * @property int $corretor_id
 * @property int|null $leads_recebidos
 * @property float|null $percentual_conversao
 * @property int|null $quant_vendas_vgc
 * @property int|null $quant_vendas_vgv
 * @property int|null $quant_visitas
 * @property int|null $quant_imoveis_agenciados
 * @property float|null $ticket_medio_venda
 * @property float|null $custo_lead
 * @property int|null $pos_ranking_geral_vendas
 * @property string|null $data
 * @property int|null $mes_referencia
 *
 * @property Corretor $corretor
 */
class Numacros extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'numacros';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['corretor_id'], 'required'],
            [['corretor_id', 'leads_recebidos', 'quant_vendas_vgc', 'quant_vendas_vgv', 'quant_visitas', 'quant_imoveis_agenciados', 'pos_ranking_geral_vendas', 'mes_referencia'], 'integer'],
            [['percentual_conversao', 'ticket_medio_venda', 'custo_lead'], 'number'],
            [['data'], 'safe'],
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
            'leads_recebidos' => 'Leads Recebidos',
            'percentual_conversao' => 'Percentual Conversao',
            'quant_vendas_vgc' => 'Quant Vendas Vgc',
            'quant_vendas_vgv' => 'Quant Vendas Vgv',
            'quant_visitas' => 'Quant Visitas',
            'quant_imoveis_agenciados' => 'Quant Imoveis Agenciados',
            'ticket_medio_venda' => 'Ticket Medio Venda',
            'custo_lead' => 'Custo Lead',
            'pos_ranking_geral_vendas' => 'Pos Ranking Geral Vendas',
            'data' => 'Data',
            'mes_referencia' => 'Mes Referencia',
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
