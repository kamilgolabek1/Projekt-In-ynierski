<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "comment".
 *
 * @property integer $ID
 * @property integer $locationID
 * @property string $comment
 * @property integer $userID
 * @property string $date
 *
 * @property Location $location
 * @property User $user
 */
class Comment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'comment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['locationID', 'userID'], 'integer'],
            [['date'], 'safe'],
            [['comment'], 'string', 'max' => 2000]
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
            'comment' => 'Comment',
            'userID' => 'User ID',
            'date' => 'Date',
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
        return $this->hasOne(User::className(), ['ID' => 'userID']);
    }
}
