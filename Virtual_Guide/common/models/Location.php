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
 * @property string $country
 * @property string $province
 * @property integer $city
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
            [['city', 'zoom', 'category'], 'integer'],
            [['name', 'country', 'province', 'address'], 'string', 'max' => 100],
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
            'name' => 'Nazwa',
            'descr' => 'Opis',
            'lon' => 'Lon',
            'lat' => 'Lat',
            'country' => 'Pastwo',
            'province' => 'Dzielnica/Region',
            'city' => 'Miasto',
            'address' => 'Adres',
            'zoom' => 'Zoom',
            'category' => 'Kategoria',
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
