<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "photo".
 *
 * @property integer $ID
 * @property integer $locationID
 * @property string $filename
 * @property string $comment
 * @property integer $userId
 *
 * @property Location $location
 * @property User $user
 */
class Photo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'photo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['locationID', 'userId'], 'integer'],
            [['filename'], 'string', 'max' => 100],
            [['comment'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'locationID' => 'Location ID',
            'filename' => 'Filename',
            'comment' => 'Comment',
            'userId' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLocation()
    {
        return $this->hasOne(Location::className(), ['ID' => 'locationID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['ID' => 'userId']);
    }
}
