<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tags".
 *
 * @property integer $ID
 * @property string $Nazwa
 * @property integer $LocationID
 *
 * @property Location $location
 */
class Tags extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tags';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['LocationID'], 'integer'],
            [['Nazwa'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Nazwa' => 'Nazwa',
            'LocationID' => 'Location ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocation()
    {
        return $this->hasOne(Location::className(), ['ID' => 'LocationID']);
    }
}
