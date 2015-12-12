<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "replies".
 *
 * @property integer $id
 * @property string $content
 * @property string $data
 * @property integer $topicID
 * @property integer $userID
 *
 * @property Topics $topic
 * @property User $user
 */
class Replies extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'replies';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content', 'data', 'topicID', 'userID'], 'required'],
            [['data'], 'safe'],
            [['topicID', 'userID'], 'integer'],
            [['content'], 'string', 'max' => 1000]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'content' => 'Content',
            'data' => 'Data',
            'topicID' => 'Topic ID',
            'userID' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTopic()
    {
        return $this->hasOne(Topics::className(), ['id' => 'topicID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['ID' => 'userID']);
    }
}
