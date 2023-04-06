<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Visita;

/**
 * VisitaSearch represents the model behind the search form of `app\models\Visita`.
 */
class VisitaSearch extends Visita
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'corretor_id', 'imovel_id', 'convertido'], 'integer'],
            [['nome_corretor', 'imobiliaria_parceira', 'data_registro', 'data_visita', 'hora_visita', 'codigo_imovel', 'visitante_nome', 'obs', 'contrato'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Visita::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'corretor_id' => $this->corretor_id,
            'imovel_id' => $this->imovel_id,
            'data_registro' => $this->data_registro,
            'data_visita' => $this->data_visita,
            'hora_visita' => $this->hora_visita,
            'convertido' => $this->convertido,
        ]);

        $query->andFilterWhere(['like', 'nome_corretor', $this->nome_corretor])
            ->andFilterWhere(['like', 'imobiliaria_parceira', $this->imobiliaria_parceira])
            ->andFilterWhere(['like', 'codigo_imovel', $this->codigo_imovel])
            ->andFilterWhere(['like', 'visitante_nome', $this->visitante_nome])
            ->andFilterWhere(['like', 'obs', $this->obs])
            ->andFilterWhere(['like', 'contrato', $this->contrato]);

        return $dataProvider;
    }
}
