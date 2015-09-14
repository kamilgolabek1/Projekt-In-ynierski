<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "location".
 *
 * @property integer $ID
 * @property string $Nazwa
 * @property string $Opis
 * @property string $Lon
 * @property string $Lat
 * @property string $ForumID
 * @property string $Adres
 * @property integer $Category
 * @property integer $Zoom
 *
 * @property Comments[] $comments
 * @property Photos[] $photos
 * @property Tags[] $tags
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
            [['ID'], 'required'],
            [['ID', 'Category', 'Zoom'], 'integer'],
            [['Nazwa', 'ForumID', 'Adres'], 'string', 'max' => 100],
            [['Opis'], 'string', 'max' => 2000],
            [['Lon', 'Lat'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Nazwa' => 'Nazwa',
            'Opis' => 'Opis',
            'Lon' => 'Lon',
            'Lat' => 'Lat',
            'ForumID' => 'Forum ID',
            'Adres' => 'Adres',
            'Category' => 'Category',
            'Zoom' => 'Zoom',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comments::className(), ['LocationID' => 'ID'])->orderBy(['Comments.Data'=>SORT_DESC]);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhotos()
    {
        return $this->hasMany(Photos::className(), ['LocationID' => 'ID']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTags()
    {
        return $this->hasMany(Tags::className(), ['LocationID' => 'ID']);
    }
}
