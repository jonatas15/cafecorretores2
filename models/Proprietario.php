<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "proprietario".
 *
 * @property int $id
 * @property int $corretor_id
 * @property string|null $nome
 * @property string|null $email
 * @property string|null $telefone
 * @property string|null $cpf
 * @property string|null $cnpj
 * @property string|null $endereco
 * @property string|null $linkmaps
 * @property string|null $retorno
 *
 * @property Corretor $corretor
 */
class Proprietario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'proprietario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['corretor_id'], 'required'],
            [['corretor_id'], 'integer'],
            [['linkmaps', 'retorno'], 'string'],
            [['nome'], 'string', 'max' => 245],
            [['email', 'telefone', 'cpf', 'cnpj'], 'string', 'max' => 45],
            [['endereco'], 'string', 'max' => 300],
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
            'nome' => 'Nome',
            'email' => 'Email',
            'telefone' => 'Telefone',
            'cpf' => 'Cpf',
            'cnpj' => 'Cnpj',
            'endereco' => 'Endereco',
            'linkmaps' => 'Linkmaps',
            'retorno' => 'Retorno',
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
