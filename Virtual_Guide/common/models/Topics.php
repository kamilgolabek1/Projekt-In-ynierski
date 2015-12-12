<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "topics".
 *
 * @property integer $id
 * @property string $subject
 * @property string $date
 * @property integer $CategoryID
 * @property integer $UserID
 *
 * @property Category $category
 * @property User $user
 */
class Topics extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'topics';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['subject', 'date', 'CategoryID', 'UserID'], 'required'],
            [['date'], 'safe'],
            [['CategoryID', 'UserID'], 'integer'],
            [['subject'], 'string', 'max' => 200]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'subject' => 'Subject',
            'date' => 'Date',
            'CategoryID' => 'Category ID',
            'UserID' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'CategoryID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['ID' => 'UserID']);
    }
}
