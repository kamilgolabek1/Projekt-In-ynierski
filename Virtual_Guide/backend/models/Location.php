<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "location".
 *
 * @property integer $ID
 * @property string $name
 * @property string $descr
 * @property string $lon
 * @property string $lat
 * @property string $forumID
 * @property string $address
 * @property integer $category
 * @property integer $zoom
 *
 * @property Comment[] $comments
 * @property Photo[] $photos
 * @property Tag[] $tags
 */
class Location extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'location';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['category', 'zoom'], 'integer'],
            [['name', 'forumID', 'address'], 'string', 'max' => 100],
            [['descr'], 'string', 'max' => 2000],
            [['lon', 'lat'], 'string', 'max' => 50]
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
            'descr' => 'Descr',
            'lon' => 'Lon',
            'lat' => 'Lat',
            'forumID' => 'Forum ID',
            'address' => 'Address',
            'category' => 'Category',
            'zoom' => 'Zoom',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::className(), ['locationID' => 'ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhotos()
    {
        return $this->hasMany(Photo::className(), ['locationID' => 'ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTags()
    {
        return $this->hasMany(Tag::className(), ['locationID' => 'ID']);
    }
}
