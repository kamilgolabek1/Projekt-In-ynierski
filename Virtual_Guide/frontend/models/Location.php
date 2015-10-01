<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "location".
 *
 * @property integer $ID
 * @property string $name
 * @property string $descr
 * @property string $lon
 * @property string $lat
 * @property string $country
 * @property string $province
 * @property string $city
 * @property string $address
 * @property integer $zoom
 * @property integer $category
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
            [[ 'zoom', 'category'], 'integer'],
            [['city','name', 'country', 'province', 'address'], 'string', 'max' => 100],
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
            'country' => 'Country',
            'province' => 'Province',
            'city' => 'City',
            'address' => 'Address',
            'zoom' => 'Zoom',
            'category' => 'Category',
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
