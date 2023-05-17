<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Proprietario;

/**
 * ProprietarioSearch represents the model behind the search form of `app\models\Proprietario`.
 */
class ProprietarioSearch extends Proprietario
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'corretor_id'], 'integer'],
            [['nome', 'email', 'telefone', 'cpf', 'cnpj', 'endereco', 'linkmaps', 'retorno'], 'safe'],
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
        $query = Proprietario::find();

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
        ]);

        $query->andFilterWhere(['like', 'nome', $this->nome])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'telefone', $this->telefone])
            ->andFilterWhere(['like', 'cpf', $this->cpf])
            ->andFilterWhere(['like', 'cnpj', $this->cnpj])
            ->andFilterWhere(['like', 'endereco', $this->endereco])
            ->andFilterWhere(['like', 'linkmaps', $this->linkmaps])
            ->andFilterWhere(['like', 'retorno', $this->retorno]);

        return $dataProvider;
    }
}
