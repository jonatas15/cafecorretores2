<?php

namespace app\models;

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
            [['nome'], 'string', 'max' => 250],
            [['email'], 'string', 'max' => 100],
            [['celular', 'registro'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nome' => 'Nome',
            'email' => 'Email',
            'celular' => 'Celular',
            'registro' => 'Registro',
            'obs' => 'Obs',
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
        return $this->hasMany(Numacros::class, ['corretor_id' => 'id']);
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
}
