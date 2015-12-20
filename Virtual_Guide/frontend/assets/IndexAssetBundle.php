<?php

namespace app\assets;

use yii\web\AssetBundle;

class IndexAssetBundle extends AssetBundle 
{
		public $basePath = '@webroot';
		public $baseUrl = '@web';
		public $css = [ 
			
			'css/style3.css',
			'css/lightbox.css'
		]; 
		public $js=[
				'js/jquery.js',
				'http://maps.google.com/maps/api/js?v=3&sensor=false',
				'lib/OpenLayers.js',
				'lib/FeaturePopups.js',
				'js/virtualguide.js',
				'js/csspopup.js',
				'js/lightbox-plus-jquery.min.js'
		];

		//if this asset depends on other assets you may populate below array
		public $depends = [
		];
}
