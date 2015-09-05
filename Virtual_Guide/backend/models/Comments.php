<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "comments".
 *
 * @property integer $ID
 * @property integer $LocationID
 * @property string $Comment
 * @property integer $UserID
 * @property string $Data
 *
 * @property Location $location
 * @property User $user
 */
class Comments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'comments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['LocationID', 'UserID'], 'integer'],
            [['Data'], 'safe'],
            [['Comment'], 'string', 'max' => 2000]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'LocationID' => 'Location ID',
            'Comment' => 'Comment',
            'UserID' => 'User ID',
            'Data' => 'Data',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocation()
    {
        return $this->hasOne(Location::className(), ['ID' => 'LocationID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'UserID']);
    }
}
