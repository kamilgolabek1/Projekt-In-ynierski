
//#### HTML elements event listeners
var addForm = document.getElementById('addCommentForm');

document.getElementById('addPointForm').addEventListener('submit', function(e) {
	e.preventDefault();
	validateAddPointForm('addPoint', addingPoint, true);
});

console.log(document.getElementById('navTabs').getElementsByTagName('li')[0]);
document.getElementById('navTabs').getElementsByTagName('li')[0].addEventListener('click', function(e) {
	console.log(e);
	var hasClass =this.classList.contains('disabled');
	if (hasClass) {
		e.preventDefault();
		return false;
	}
});

// document.getElementById('addPointBtn').addEventListener('click', function(e) {
	// e.preventDefault();
	// createPopup('addPoint', addingPoint, true);
// });

document.getElementsByClassName('panel-toggle-button')[0].addEventListener('click', function(e) {
	
	var target = $('.panel-visible');
	var button = $('.panel-toggle-button span');
	
	var value = (target.position().left == 0) ? -400 : 0;
	target.animate({left: value}, 400);
	
	button.hasClass('glyphicon-chevron-left') ? button.removeClass('glyphicon-chevron-left').addClass('glyphicon-chevron-right') : button.removeClass('glyphicon-chevron-right').addClass('glyphicon-chevron-left');
});

if(addForm) {
	document.getElementById('addCommentInput').addEventListener('focus', function(e) {
		e.target.placeholder = "";
		e.target.rows = "1";
		document.getElementById('addCommentSubmitBtn').style.display = 'block';
		
	});

	document.getElementById('addCommentInput').addEventListener('blur', function(e) {
		e.target.placeholder = "Dodaj komentarz";
		e.target.rows = "1";
		var nextElement = document.getElementById('addCommentSubmitBtn');
		if ( document.activeElement != nextElement ) {
			//nextElement.style.display = 'none';
		}
	});


	document.getElementById('addCommentSubmitBtn').addEventListener('click', function(e) {
		e.preventDefault();
		validateAddCommentForm(e);
	});
}

$('#navTabs a').click(function(e) {
	e.preventDefault();
	if ( $(this).parent().hasClass('disabled')) {
		return false;
	} else {
		$(this).tab('show');
		console.log($(this));
	}
});

document.getElementById('commentsMore').addEventListener('click', function(e) {
	e.preventDefault();
	generateCommList(lastRetrComm-1);
});

document.getElementById('commentsLess').addEventListener('click', function(e) {
	e.preventDefault();
	generateCommList(lastRetrComm+1);
});

document.getElementById('picsMore').addEventListener('click', function(e) {
	e.preventDefault();
	generatePicsList(lastRetrPic-1);
});

document.getElementById('picsLess').addEventListener('click', function(e) {
	e.preventDefault();
	generatePicsList(lastRetrPic+1);
});

/**
 * Class: OpenLayers.Strategy.AttributeCluster
 * Strategy for vector feature clustering based on feature attributes.
 *
 * Inherits from:
 *  - <OpenLayers.Strategy.Cluster>
 */
OpenLayers.Strategy.AttributeCluster = OpenLayers.Class(OpenLayers.Strategy.Cluster, {
    /**
     * the attribute to use for comparison
     */
    attribute: null,
    /**
     * Method: shouldCluster
     * Determine whether to include a feature in a given cluster.
     *
     * Parameters:
     * cluster - {<OpenLayers.Feature.Vector>} A cluster.
     * feature - {<OpenLayers.Feature.Vector>} A feature.
     *
     * Returns:
     * {Boolean} The feature should be included in the cluster.
     */
    shouldCluster: function (cluster, feature) {
        var cc_attrval = cluster.cluster[0].attributes[this.attribute];
        var fc_attrval = feature.attributes[this.attribute];
        var superProto = OpenLayers.Strategy.Cluster.prototype;
        return cc_attrval === fc_attrval && superProto.shouldCluster.apply(this, arguments);
    },
    CLASS_NAME: "OpenLayers.Strategy.AttributeCluster"
});

OpenLayers.Control.Click = OpenLayers.Class(OpenLayers.Control, {
	defaultHandlerOptions: {
		'single': true,
		'double': false,
		'pixelTolerance': 0,
		'stopSingle': false,
		'stopDouble': false
	},

	initialize: function (options) {
		this.handlerOptions = OpenLayers.Util.extend(
			{}, this.defaultHandlerOptions
		);
		OpenLayers.Control.prototype.initialize.apply(
			this, arguments
		);
		this.handler = new OpenLayers.Handler.Click(
			this, {
				'click': this.trigger

			}, this.handlerOptions
		);
	}, 

	trigger : function (e) {
		var lonlat = (map.getLonLatFromPixel(e.xy)).transform(new OpenLayers.Projection('EPSG:900913'), new OpenLayers.Projection('EPSG:4326'));
		var lon = document.forms['addPointForm']['lon'];
		var lat = document.forms['addPointForm']['lat'];
		var zoom = document.forms['addPointForm']['zoom'];
		// transformacja wspolrzednych

		lon.value = lonlat.lon;
		lat.value = lonlat.lat;
		zoom.value = map.getZoom();

		var control = map.getControlsBy("id", "clickControl")[0];
		if (control.active) {
			console.log('contolol activ');
			control.deactivate();
		}
		vectorlayer.setVisibility(true);

		var mapDiv = document.getElementById('map');
		mapDiv.style.cursor = 'default';
	}

});


// global variables
var map, vectorlayer, features, stylemap, select;

var infoBoxId = "";
var infoBoxStatus = 0;
var lastRetrComm = 0;
var lastRetrPic = 0;
var activePointId = "-1"
var json = [];
var activePointCommArr = [];
var activePointPicsArr = [];




makeRequest('GET','site/points', '', alertContents);






// wrap the instanciation code in an anonymous function that gets executed
// immeadeately
function main (){

    // The function that gets called on feature selection: shows information 
    // about the feature/cluser in a div on the page 
    var showInformation = function(evt){
        var feature = evt.feature;
			console.log(evt);
        var info = 'Last hovered feature:<br>';
        if (feature.cluster) {
            info += '&nbsp;&nbsp;Cluster of ' + feature.attributes.count + ' features:';
            var clazzes = {
                '1': 0,
                '2': 0,
                '3': 0,
                '4': 0,
							'5': 0
            };
            for (var i = 0; i < feature.attributes.count; i++) {
                var feat = feature.cluster[i];
                clazzes[feat.attributes.clazz]++;
            }
            for (var j=1; j<=4; j++) {
                var plural_s = (clazzes[j] !== 1) ? 's' : '';
                info += '<br>&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;clazz ' + j + ': ' + clazzes[j] + ' feature' + plural_s;
            }
        } else {
            info += '&nbsp;&nbsp;Single feature of clazz = ' + feature.attributes.clazz;
        }
        document.getElementById('info').innerHTML = info;
    };
	
	var logInformation = function(evt){
        var feature = evt.feature;
        
        
        console.log();
    };
	
	
	
    // The function that gets called on feature selection. Shows information 
    // about the number of "points" on the map.
    var updateGeneralInformation = function() {
        var info = 'Currently ' + vectorlayer.features.length + ' points are shown on the map.';
        document.getElementById('generalinfo').innerHTML = info;
    };
    
    // instanciate the map
    map = new OpenLayers.Map("map", {
    		eventListeners : {
    			featureover : function (e) {
    				e.feature.renderIntent = "select";
    				e.feature.layer.drawFeature(e.feature);
    				console.log("Map says: Pointer entered " + e.feature.id + " on " + e.feature.layer.name);
    				console.log(e.feature);
    			},
    			featureout : function (e) {
    				e.feature.renderIntent = "default";
    				e.feature.layer.drawFeature(e.feature);
    				console.log("Map says: Pointer left " + e.feature.id + " on " + e.feature.layer.name);
    			},
    			featureclick : function (e) {
    				console.log("Map says: " + e.feature.id + " clicked on " + e.feature.layer.name);
				console.log("Poprawne wykrycie kliknięcia w punkt");
					//controlFeatureClick(e);
				loadPointInfo(e);
    				//var feature = e.feature;
					//popup('popUpDiv');
    				
    			}
			}
		});
    
    // background WMS
	
	
   
	

    
    // context to style the vectorlayer
    var context = {
        getColor: function(feature){
            var color = '#aaaaaa';
					if (feature.attributes.clazz && feature.attributes.clazz === 4) {
						color = '#ee0000';
					}
					else if (feature.cluster) {
						var onlyFour = true;
						for (var i = 0; i < feature.cluster.length; i++) {
							if (onlyFour && feature.cluster[i].attributes.clazz !== 4) {
								onlyFour = false;
							}
						}
						if (onlyFour === true) {
							color = '#ee0000';
						}
						
						var onlyOne = true;
						for (var i = 0; i < feature.cluster.length; i++) {
							if (onlyOne && feature.cluster[i].attributes.clazz !== 1) {
								onlyOne = false;
							}
						}
						if (onlyOne === true) {
							color = '#00bb00';
						}
						
						var onlyTwo = true;
						for (var i = 0; i < feature.cluster.length; i++) {
							if (onlyTwo && feature.cluster[i].attributes.clazz !== 2) {
								onlyTwo = false;
							}
						}
						if (onlyTwo === true) {
							color = '#0000ff';
						}
						
						var onlyThree = true;
						for (var i = 0; i < feature.cluster.length; i++) {
							if (onlyThree && feature.cluster[i].attributes.clazz !== 3) {
								onlyThree = false;
							}
						}
						if (onlyThree === true) {
							color = '#ee00dd';
						}
						
						var onlyFive = true;
						for (var i = 0; i < feature.cluster.length; i++) {
							if (onlyFive && feature.cluster[i].attributes.clazz !== 3) {
								onlyFive = false;
							}
						}
						if (onlyFive === true) {
							color = '#ee00dd';
						}
					}
            return color;
        },
			radius: function(feature) {
					var pix = 7;
					if(feature.cluster) {
						pix = Math.min(feature.attributes.count, 7) + 11;
					}
					return pix;
				},
			strokeWidth: function(feature) {
					var pix = 7;
					if(feature.cluster) {
						pix = (Math.min(feature.attributes.count, 7) + 11) * 1.2;
					}
					return pix;
				},
			count: function(feature) {
				if (feature.attributes.count === 1) {
					return feature.cluster[0].attributes.label;
				} else {
					return feature.attributes.count;
				}
			},
			fontSize: function(feature) {
				if (feature.attributes.count === 1) {
					return "12px";
				} else {
					return "16px";
				}
			},
				labelOutlineWidth: function(feature) {
				if (feature.attributes.count === 1) {
					return "0px";
				} else {
					return "3px";
				}
			}
			
    };
    
    // style the vectorlayer
    stylemap = new OpenLayers.StyleMap({
        'default': new OpenLayers.Style({
            pointRadius: "${radius}",
					label: "${count}",
            fillColor: "${getColor}",
            fillOpacity: 0.8,
					fontColor: "#ffffff",
           fontOpacity: 0.8,
            fontSize: "${fontSize}",
            strokeColor: "${getColor}",
            strokeWidth: 5,
            strokeOpacity: 0.5,
            graphicZIndex: 1,
					labelOutlineColor: "#000000",
           labelOutlineWidth: "${labelOutlineWidth}"
        }, {
            context: context
        }),
        'select' : new OpenLayers.Style({
            pointRadius: 18,
            fillColor: "#FF530D",
            fillOpacity: 1,
            strokeColor: "#ffffff",
            strokeWidth: 5,
            strokeOpacity: 0.3,
            graphicZIndex: 2
        })
    });
    
    // the vectorlayer
    vectorlayer = new OpenLayers.Layer.Vector('Punkty', {styleMap: stylemap, strategies: [new OpenLayers.Strategy.Cluster({distance: 30})]});
    
    // the select control
   /* select = new OpenLayers.Control.SelectFeature(
        vectorlayer, {hover: true}
    );*/
	
	
	
	var fpControl = new OpenLayers.Control.FeaturePopups({
    // External div for list popups
    popupOptions: {
        list: {
            // Uses an existing div having an id 'divList'
            popupClass: 'divList'
        },
        single: null // Show a list instead of single popup if the list
                     //     has only an item.
    },
    boxSelectionOptions: {},
    layers: [
        [
        // Uses: Templates for hover & select and safe selection
        vectorlayer, {templates: {
            // hover: single & list
            //hover: '${count}',
            //hoverList: '<b>${count}</b><br>${html}',
            //hoverItem: '${.name}<br>',
            // select: single & list
            single: '<div><h2>${.title}</h2>${.description}</div>',
            item: '<li><a href="#" ${showPopup()}>${.title}</a></li>'
        }}]
    ]
});



	
   // map.addControl(select);
	
   // select.activate();
    vectorlayer.events.on({"featureselected": showInformation});
		//map.addControl(fpControl);
    
    map.addLayer(vectorlayer);
	
	// ######### podklady mapowe
	map.addLayer(new OpenLayers.Layer.OSM("Mapnik"));
	 map.addLayer(new OpenLayers.Layer.OSM("MapQuest Open",                                                   
                                           ["http://otile1.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png",
                                            "http://otile2.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png",
                                            "http://otile3.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png",
                                            "http://otile4.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/'>OpenStreetMap</a> and contributors, under an <a href='http://www.openstreetmap.org/copyright' title='ODbL'>open license</a>. Tiles Courtesy of <a href='http://www.mapquest.com/'>MapQuest</a> <img src='http://developer.mapquest.com/content/osm/mq_logo.png'>" }));
       
                                            
                                            
       map.addLayer(new OpenLayers.Layer.OSM("Humanitarian Style",                                                   
                                           ["http://a.tile.openstreetmap.fr/hot/${z}/${x}/${y}.png",
                                            "http://b.tile.openstreetmap.fr/hot/${z}/${x}/${y}.png",
                                            "http://c.tile.openstreetmap.fr/hot/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/'>OpenStreetMap</a> and contributors, under an <a href='http://www.openstreetmap.org/copyright' title='ODbL'>open license</a>. Humanitarian style by <a href='http://hot.openstreetmap.org'>H.O.T.</a>",
                                            "tileOptions": { "crossOriginKeyword": null }}));
       
       
       map.addLayer(new OpenLayers.Layer.OSM("Stamen watercolour",                                                   
                                           ["http://tile.stamen.com/watercolor/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/'>OpenStreetMap</a> and contributors, under an <a href='http://www.openstreetmap.org/copyright' title='ODbL'>open license</a>. Watercolour style by <a href='http://stamen.com'>Stamen Design</a>",
                                            "tileOptions": { "crossOriginKeyword": null }}));
      
       map.addLayer(new OpenLayers.Layer.OSM("Stamen toner",                                                   
                                           ["http://tile.stamen.com/toner/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/'>OpenStreetMap</a> and contributors, under an <a href='http://www.openstreetmap.org/copyright' title='ODbL'>open license</a>. Toner style by <a href='http://stamen.com'>Stamen Design</a>",
                                            "tileOptions": { "crossOriginKeyword": null }}));
                                            
                                            
       map.addLayer(new OpenLayers.Layer.OSM("CartoDB positron",                                                   
                                           ["http://a.basemaps.cartocdn.com/light_all/${z}/${x}/${y}.png",
                                            "http://b.basemaps.cartocdn.com/light_all/${z}/${x}/${y}.png",
                                            "http://c.basemaps.cartocdn.com/light_all/${z}/${x}/${y}.png",
                                            "http://d.basemaps.cartocdn.com/light_all/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors, &copy; <a href='http://cartodb.com/attributions'>CartoDB</a>" }));
       map.addLayer(new OpenLayers.Layer.OSM("CartoDB dark matter",                                                   
                                           ["http://a.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png",
                                            "http://b.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png",
                                            "http://c.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png",
                                            "http://d.basemaps.cartocdn.com/dark_all/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors, &copy; <a href='http://cartodb.com/attributions'>CartoDB</a>" }));
       map.addLayer(new OpenLayers.Layer.OSM("CartoDB positron (no labels)",                                                   
                                           ["http://a.basemaps.cartocdn.com/light_nolabels/${z}/${x}/${y}.png",
                                            "http://b.basemaps.cartocdn.com/light_nolabels/${z}/${x}/${y}.png",
                                            "http://c.basemaps.cartocdn.com/light_nolabels/${z}/${x}/${y}.png",
                                            "http://d.basemaps.cartocdn.com/light_nolabels/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors, &copy; <a href='http://cartodb.com/attributions'>CartoDB</a>" }));

       map.addLayer(new OpenLayers.Layer.OSM("CartoDB dark matter (no labels)",
                                           ["http://a.basemaps.cartocdn.com/dark_nolabels/${z}/${x}/${y}.png",
                                            "http://b.basemaps.cartocdn.com/dark_nolabels/${z}/${x}/${y}.png",
                                            "http://c.basemaps.cartocdn.com/dark_nolabels/${z}/${x}/${y}.png",
                                            "http://d.basemaps.cartocdn.com/dark_nolabels/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors, &copy; <a href='http://cartodb.com/attributions'>CartoDB</a>" }));

       map.addLayer(new OpenLayers.Layer.OSM("Wikimedia",
                                           ["https://maps.wikimedia.org/osm-intl/${z}/${x}/${y}.png"],
                                            {attribution: "&copy; <a href='http://www.openstreetmap.org/'>OpenStreetMap</a> and contributors, under an <a href='http://www.openstreetmap.org/copyright' title='ODbL'>open license</a>. <a href='https://www.mediawiki.org/wiki/Maps'>Wikimedia's new style (beta)</a>",
                                            "tileOptions": { "crossOriginKeyword": null }}));
        //######### koniec map
    
    map.zoomToMaxExtent();
	
	//var click = new OpenLayers.Control.Click();
	//map.addControl(click);
	
map.addControls([new OpenLayers.Control.LayerSwitcher(),
		new OpenLayers.Control.ScaleLine(),
		new OpenLayers.Control.Permalink('permalink'),
		new OpenLayers.Control.MousePosition(),
		new OpenLayers.Control.Click({id : 'clickControl'})]
);
    
   addFeaturesToVector(vectorlayer, json);
    updateGeneralInformation();

    // the behaviour and methods for clustering strategies
    var changeStrategy = function() {
        var strategies = new OpenLayers.Strategy.Cluster({
        		distance : 30
        	});
	
        // this is the checkbox
        
        // remove layer and control
			
        map.removeLayer(vectorlayer);
        map.removeControl(select);
        // rebuild layer
        vectorlayer = new OpenLayers.Layer.Vector('Vectorlayer', {styleMap: stylemap, strategies: strategies, renderers: ['Canvas']});
        map.addLayer( vectorlayer );
        vectorlayer.addFeatures(features);
		
		
				map.events.register("zoomend", map, function () {
					var zoom = map.getZoom();/*
					for (var i = 0; i < vectorlayer.features.length; i++) {
						for (var j = 0; j < vectorlayer.features[i].cluster.length; j++) {
						//console.log(vectorlayer.features.length);
						//console.log(vectorlayer.features[i].cluster.length);
							if (zoom < 12 && vectorlayer.features[i].cluster[j].attributes.clazz == 4)
								vectorlayer.features[i].style = {
									display : 'hidden'
								}
							}
					}*/
					
					vectorlayer.redraw();
					console.log("Zoom mapy: " + zoom);

				});
				
				
				//appendList(json);
        // rebuild select control
		/*
        select = new OpenLayers.Control.SelectFeature(
            vectorlayer, {hover: true}
        );
        map.addControl(select);

        select.activate();
        vectorlayer.events.on({"featureselected": showInformation});
        // update meta information
        updateGeneralInformation();
		*/
				
    };
    // bind the behviour to the radios
    var inputs = document.getElementsByTagName('input');
    for( var cnt = 0; cnt < inputs.length; cnt++) {
      var input = inputs[cnt];
      if (input.name === 'strategy') {
         input.onclick = changeStrategy;
      }
    }
};
(main());



// universal jQ ajax request
function makeRequest(type, url, data, func, isAsync, contentType) {
	$.ajax({
		url : url,
		type : type,
		async : (isAsync) ? isAsync : true,
		data : data,
		contentType : contentType,
		success : function (responseData) {
			func(responseData);
		}
	});
}
			

function alertContents(responseText) {
	
			var jsonObj = JSON.parse(responseText);
			//alert(jsonObj);
			json = jsonObj;
			//console.log(jsonObj);
			//console.log(json);
			//main();
			addFeaturesToVector(vectorlayer, json);
		
	}


  
// dołączenie warstwy z markerami do mapy
function appendMarkersLayer(layer) {



}

// funkcja sprawdzajaca, czy wszystkie pola formularza zostaly wypelnione
function validateAddPointForm() {
	var name = document.forms['addPointForm']['name'].value;
	var addr = document.forms['addPointForm']['addr'].value;
	var descr = document.forms['addPointForm']['descr'].value;
	var lon = document.forms['addPointForm']['lon'].value;
	var lat = document.forms['addPointForm']['lat'].value;
	var zoom = document.forms['addPointForm']['zoom'].value;
	var cat = document.forms['addPointForm']['cat'].value;

	/*if (name === '' || lon === '' || lat === '' || desc === '') {
		addFormMsg.innerHTML = "Wypełnij wszystkie pola";
		return false;
	} else {
		addFormMsg.innerHTML = "Dodawanie...";

		var data = 'lon=' + lon + '&lat=' + lat + '&name=' + name + '&addr=' + addr + '&desc=' + desc + '&zoom=' + zoom + '&cat=' + cat;
		makeRequest('POST', 'addPoint.php', data, afterAdd);
	}*/
	var data = 'lon=' + lon + '&lat=' + lat + '&name=' + name + '&addr=' + addr + '&descr=' + descr + '&zoom=' + zoom + '&cat=' + cat + '&userID=1';// + userID;
	makeRequest('POST', 'addPoint.php', data, afterAdd);
	return false;
}

function afterAdd() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			//alert(httpRequest.responseText);
			var jsonObj = JSON.parse(httpRequest.responseText);
			//alert(jsonObj);
			json = [jsonObj];
			//console.log(jsonObj);
			console.log(json);
			addFormMsg.innerHTML = "";
			document.forms["addForm"].reset();
			if (map.popups[0]) {
				map.removePopup(map.popups[0]);
			}
			addFeaturesToVector(vectorlayer, json);
		} else {
			alert('There was a problem with the request.');
		}
	}
}



function addFeaturesToVector(layer, json) {
	layer.destroyFeatures();

	features = [];

	// transformacja wspolrzednych
	var epsg4326 = new OpenLayers.Projection('EPSG:4326'); // Transform from WGS 1984
	var epsg900913 = new OpenLayers.Projection('EPSG:900913'); // to Spherical Mercator Projection

	// adding lots of features:
	for (var i = 0; i < json.length; i++) {
		var brand = json[i].title;
		var clazz;
		console.log(i)
		
		//var rand = Math.floor(Math.random() * (14 - 7) + 7);
		//var p = new OpenLayers.Geometry.Point(json[i].lat, json[i].lon).transform(epsg4326, epsg900913);
		var p = new OpenLayers.Geometry.Point(json[i].lon, json[i].lat).transform(epsg4326, epsg900913);
		var f = new OpenLayers.Feature.Vector(p, {
				clazz : parseInt(json[i].cat),
				zoom : parseInt(json[i].zoom),
				label : i + 1,
				address : json[i].address,
				description : json[i].descr,
				name : json[i].name,
				id : parseInt(json[i].ID),
				lon : json[i].lon,
				lat : json[i].lat,
				//forumID : json[i].forumID
			});
		features.push(f);
		console.log(f.id);
		console.log(layer.id);
	}
	//appendList(json);
	layer.addFeatures(features);

	//layer.destroyFeatures();

	appendMarkersLayer(layer);
	layer.refresh({
		force : true
	});
}



function controlFeatureClick(e) {
	console.log(e);	
}

function getCoordinates() {
	var control = map.getControlsBy("id", "clickControl")[0];
	console.log(control);
   
   if (!control.active) {
		console.log('contolol not activ');
		control.activate();
    }
    
	vectorlayer.setVisibility(false);
	
	var mapDiv = document.getElementById('map');
	mapDiv.style.cursor = 'crosshair';
	return false;
}
	
function loadPointInfo(e) {
	console.log("Wywołanie funkcji wczytującej dane do infoboxa");

	var data = e.feature.cluster[0].attributes;
	var dataString = 'id=' + data.id;
	document.getElementById('navTabs').getElementsByTagName('li')[0].classList.remove('disabled');
	
	var infoBoxLabel = document.getElementById('infoDescrBox').getElementsByClassName('panel-section-infobox-item-label')[0];
	var infoCords = document.getElementById('infoCords');
	var infoDescr = document.getElementById('infoDescr');
	
	infoBoxLabel.innerHTML = '<span class="glyphicon glyphicon-chevron-right"></span> ' + data.name;
	infoCords.innerHTML = data.lat.match(/^\d{1,3}\.\d{6}/) + ( data.lat > 0 ? ' N ' : ' S ' ) + ' ' + data.lon.match(/^\d{1,3}\.\d{6}/) + ( data.lon > 0 ? ' E ' : ' W ' );;
	infoDescr.innerHTML = data.description;
	
	makeRequest('POST', 'site/get-comments', dataString, afterGetComments);
	makeRequest('POST', 'site/get-pictures', dataString, afterGetPics);
	
	activePointId = data.id;
	document.getElementsByClassName('panel-content-holder')[0].scrollTop = 0;
	//document.getElementById('locationId').value = data.id;
	console.log(activePointId);
}

function afterGetComments(responseText) {
	activePointCommArr = JSON.parse(responseText);
	generateCommList();
}

function generateCommList(page) {
	
	var parent = document.getElementById('commentsList');
	var docFrag = document.createDocumentFragment();
	
	if (!page) {
		while (parent.firstChild) {
		parent.removeChild(parent.firstChild);
		var page = 1;
		}
	} else if (page < 1) {
		var page = 1;
	}
	
	var submitBtn = document.getElementById('addCommentSubmitBtn');
	if (submitBtn) {
		submitBtn.style.display = 'none';
	}
	
	var perpage = 2;
	var commObjArr = renderPagination(page, perpage, activePointCommArr);
	if (commObjArr === false) {
		return false;
	}
	
	while (parent.firstChild) {
		parent.removeChild(parent.firstChild);
	}
	
	var len = commObjArr.length;
	for ( var i = 0; i < len; i++ ) {
		var commentListItem = document.createElement('li');
		if (i%2) {
			commentListItem.className = 'panel-section-infobox-comments-list-item bubble bubble-right';
		} else {
			commentListItem.className = 'panel-section-infobox-comments-list-item bubble bubble-left';
		}
		docFrag.appendChild(commentListItem);
		
		var commentListItemText = document.createElement('p');
		commentListItemText.innerHTML = commObjArr[i].comment;
		commentListItem.appendChild(commentListItemText);
		
		var commentListItemAuthor =  document.createElement('span');
		commentListItemAuthor.className = 'panel-section-infobox-comments-list-item-author';
		commentListItemAuthor.innerHTML = commObjArr[i].username;
		commentListItem.appendChild(commentListItemAuthor);
		
		var commentListItemDate =  document.createElement('span');
		commentListItemDate.className = 'panel-section-infobox-comments-list-item-date text-right';
		commentListItemDate.innerHTML = commObjArr[i].date;
		commentListItem.appendChild(commentListItemDate);		
	}
	parent.appendChild(docFrag);
	lastRetrComm = page;
}

function validateAddCommentForm(e) {
	
	var comment = document.forms['addCommentForm']['comment'].value;
	console.log('validateAddCommentForm');

	if (comment === '') {
		//addFormMsg.innerHTML = "Komentarz nie może być pusty";
		
	} else {
		//addFormMsg.innerHTML = "Dodawanie...";

		var data = 'komentarz=' + comment + '&id=' + activePointId;
	makeRequest('POST', 'site/add-comment', data, afterAddComment);
	}
	
	return false;
}

function afterAddComment(responseText) {
	activePointCommArr.unshift(JSON.parse(responseText)[0]);
	
	var oldComment = document.forms['addCommentForm'];
	oldComment.reset();
	generateCommList();
}

function afterGetPics(responseText) {
	activePointPicsArr = JSON.parse(responseText);
	generatePicsList();	
} 

function generatePicsList(page) {
	
	var parent = document.getElementById('picsList');
	var docFrag = document.createDocumentFragment();
	
	if (!page) {
		while (parent.firstChild) {
		parent.removeChild(parent.firstChild);
		var page = 1;
		}
	} else if (page < 1) {
		var page = 1;
	}
		
	
	var perpage = 3;
	var picsObjArr = renderPagination(page, perpage, activePointPicsArr);
	if (picsObjArr === false) {
		return false;
	}
	
	while (parent.firstChild) {
		parent.removeChild(parent.firstChild);
	}
	
	var len = picsObjArr.length;
	for ( var i = 0; i < len; i++ ){
		var picsListItem = document.createElement('li');
		picsListItem.className = 'panel-section-infobox-pictures-list-item';
		
		var link = document.createElement('a');
		link.href = 'uploads/' + picsObjArr[i].filename;
		link.title = picsObjArr[i].username + ' ' + picsObjArr[i].comment;
		link.dataset.lightbox = "set";
		
		
		var thumb = document.createElement('img');
		thumb.className = 'img-resposive img-thumbnail';
		thumb.src = 'uploads/thumbs/' + picsObjArr[i].filename;
		thumb.style.width = 50 + 'px';
		thumb.style.height = 50 + 'px';
		thumb.alt = 'Miniaturka zdjęcia';
		
		link.appendChild(thumb);
		
		picsListItem.appendChild(link);
		docFrag.appendChild(picsListItem);
	}
	parent.appendChild(docFrag);
	lastRetrPic = page;
}

function validateAddPicsForm() {
	var comment = document.forms['addCommentForm']['comment'].value;
	

	/*if (comment === '') {
		addFormMsg.innerHTML = "Komentarz nie może być pusty";
		return false;
	} else {
		addFormMsg.innerHTML = "Dodawanie...";

		var data = 'lon=' + lon + '&lat=' + lat + '&name=' + name + '&addr=' + addr + '&desc=' + desc + '&zoom=' + zoom + '&cat=' + cat;
		makeRequest('POST', 'addPoint.php', data, afterAdd);
	}*/
	var data = 'komentarz=' + comment + '&id=' + activePointId;
	makeRequest('POST', 'site/add-comment', data, afterAddComment);
	//return false;
}

function renderPagination(page, perpage, array) {
	var len = array.length;
	if ( len === 0 || page <= 0 || perpage <= 0) {
		return false;
	}

	var pagesNum = Math.ceil(len / perpage);
	var pageIndex = page-1;
	if ( page <= pagesNum ) {
		var start = pageIndex*perpage;
		var end = page*perpage < len ? page*perpage : len;
		return array.slice(start, end);
	} else {
		return false;
	}
}
	
	