<?php
namespace common\models;

use yii\base\Model;
use yii\web\UploadedFile;
use yii\imagine\Image;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $imageFile;

    public function rules()
    {
        return [
            [['imageFile'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg'],
        ];
    }
    public function attributeLabels()
    {
    	return [
    			'imageFile' => '',
    	];
    }
    
    public function upload($name)
    {
       // if ($this->validate()) {
       		$fname = 'uploads/' . $name . '.' . $this->imageFile->extension;
       		$fnamethumb = 'uploads/thumbs/' . $name . '.' . $this->imageFile->extension;
            $this->imageFile->saveAs($fname);
            Image::thumbnail($fname, 120, 120)
            ->save($fnamethumb, ['quality' => 80]);
            return true;
       // } else {
            return false;
        //}
    }
}