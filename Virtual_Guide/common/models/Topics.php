<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "topics".
 *
 * @property integer $id
 * @property string $subject
 * @property string $date
 * @property integer $categoryID
 * @property integer $userID
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
            [['subject', 'date', 'categoryID', 'userID'], 'required'],
            [['date'], 'safe'],
            [['categoryID', 'userID'], 'integer'],
            [['subject'], 'string', 'max' => 2000]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'subject' => 'Subject',
            'date' => 'Date',
            'categoryID' => 'category ID',
            'userID' => 'User ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'categoryID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['ID' => 'userID']);
    }
}
