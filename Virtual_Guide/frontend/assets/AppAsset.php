<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/style3.css',
        'css/style3.css',
				'css/lightbox.css',
    ];
    public $js = [
				
				'lib/OpenLayers.js',
        'lib/FeaturePopups.js',
				'js/virtualguide.js',
				'js/csspopup.js',
				'js/lightbox-plus-jquery.min.js',
    			'js/ckeditor/ckeditor.js'
				
    ];
    public $depends = [
        'yii\web\YiiAsset'
        
    ];
}
