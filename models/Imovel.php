<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "imovel".
 *
 * @property int $id
 * @property int $corretor_id
 * @property string $codigo
 *
 * @property Corretor $corretor
 * @property Levante[] $levantes
 */
class Imovel extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'imovel';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['corretor_id', 'codigo'], 'required'],
            [['corretor_id'], 'integer'],
            [['codigo'], 'string', 'max' => 20],
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
            'codigo' => 'Codigo',
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
     * Gets query for [[Levantes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevantes()
    {
        return $this->hasMany(Levante::class, ['imovel_id' => 'id']);
    }
    public function getLevante()
    {
        return $this->hasOne(Levante::class, ['imovel_id' => 'id']);
    }
    // Para a API
    public function fields() {
        return [
            'id',
            'codigo',
            'corretor_id',
            'acessos' => function(Imovel $model) {
                return (int)$model->levante->acessos * 1;
            },
            'totalpage' => function() {
                return count(\app\models\Imovel::find()->all());
            } 
        ];
    }
}
