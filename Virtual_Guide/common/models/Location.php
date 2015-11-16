<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "location".
 *
 * @property integer $ID
 * @property string $name
 * @property string $descr
 * @property string $lon
 * @property string $lat
 * @property integer $countryID
 * @property string $address
 * @property integer $zoom
 * @property integer $categoryID
 *
 * @property Comment[] $comments
 * @property Category $category
 * @property Countries $country
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
            [['countryID', 'zoom', 'categoryID'], 'integer'],
            [['name', 'address'], 'string', 'max' => 100],
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
            'countryID' => 'Country ID',
            'address' => 'Address',
            'zoom' => 'Zoom',
            'categoryID' => 'Category ID',
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
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['id' => 'categoryID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(Countries::className(), ['id' => 'countryID']);
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
