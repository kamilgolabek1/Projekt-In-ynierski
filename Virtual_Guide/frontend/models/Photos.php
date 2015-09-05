<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "photos".
 *
 * @property integer $ID
 * @property integer $LocationID
 * @property string $Comment
 * @property integer $UserId
 *
 * @property Location $location
 * @property User $user
 */
class Photos extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'photos';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['LocationID', 'UserId'], 'integer'],
            [['Comment'], 'string', 'max' => 100]
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
            'UserId' => 'User ID',
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
        return $this->hasOne(User::className(), ['id' => 'UserId']);
    }
}
