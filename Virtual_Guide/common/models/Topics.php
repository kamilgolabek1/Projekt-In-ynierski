<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "topics".
 *
 * @property integer $ID
 * @property string $subject
 * @property string $date
 * @property integer $categoryID
 * @property integer $userID
 * @property string $tag
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
            [['subject', 'tag'], 'string', 'max' => 2000]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'subject' => 'Temat',
            'date' => 'Data',
            'categoryID' => 'Kategoria',
            'userID' => 'Użytkownik',
            'tag' => 'Tagi',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['ID' => 'categoryID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['ID' => 'userID']);
    }
}
