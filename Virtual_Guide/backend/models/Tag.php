<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tag".
 *
 * @property integer $ID
 * @property string $name
 * @property integer $locationID
 *
 * @property Location $location
 */
class Tag extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tag';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['locationID'], 'integer'],
            [['name'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'name' => 'Name',
            'locationID' => 'Location ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocation()
    {
        return $this->hasOne(Location::className(), ['ID' => 'locationID']);
    }
}
