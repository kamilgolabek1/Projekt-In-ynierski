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
    shouldCluster: function(cluster, feature) {
        var cc_attrval = cluster.cluster[0].attributes[this.attribute];
        var fc_attrval = feature.attributes[this.attribute];
        var superProto = OpenLayers.Strategy.Cluster.prototype;
        return cc_attrval === fc_attrval && 
               superProto.shouldCluster.apply(this, arguments);
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

                initialize: function(options) {
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

                trigger: function(e) {
								  var lonlat = (map.getLonLatFromPixel(e.xy)).transform(new OpenLayers.Projection('EPSG:900913'), new OpenLayers.Projection('EPSG:4326'));
									var lon = document.forms['addForm']['lon'];
									var lat = document.forms['addForm']['lat'];
									var zoom = document.forms['addForm']['zoom'];
									// transformacja wspolrzednych
	
									lon.value = lonlat.lon;
									lat.value = lonlat.lat;
									zoom.value = map.getZoom();
									
									//var click = new OpenLayers.Control.Click();
									//map.addControl(click);
									//click.deactivate();
									vectorlayer.setVisibility(true);
									var overlay = document.getElementById('popupMask');
									overlay.style.zIndex = 1002;
									console.log(this);
									map.removeControl(this);
									toggle_visibility('addPoint');
									var mapDiv = document.getElementById('mapOL');
									mapDiv.style.cursor = 'default';
                    //alert(lonlat.transform(new OpenLayers.Projection('EPSG:900913'), new OpenLayers.Projection('EPSG:4326')));
                }

            });


// global variables
var map, vectorlayer, features, stylemap, select;

var infoBoxId = "";
var infoBoxStatus = 0;
var lastRetrComm = 0;
var lastRetrPic = 0;
var lastRetrPoint = "-1"
//var json = [{"id":"1","lon":"54.32312","lat":"18.60212","title":"Orlen","street":"ul. \u015awi\u0119tokrzyska 2","city":"Gda\u0144sk"},{"id":"2","lon":"54.37715","lat":"18.52172","title":"BP","street":"ul. S\u0142owackiego 80","city":"Gda\u0144sk"},{"id":"3","lon":"54.35812","lat":"18.58332","title":"BP","street":"ul. Rakoczego 15","city":"Gda\u0144sk"},{"id":"4","lon":"54.39468","lat":"18.58011","title":"BP","street":"al. Grunwaldzka","city":"Gda\u0144sk"},{"id":"5","lon":"54.39398","lat":"18.58689","title":"BP","street":"al. Grunwaldzka 229\/237","city":"Gda\u0144sk"},{"id":"6","lon":"54.33805","lat":"18.61407","title":"BP","street":"ul. Witosa","city":"Gda\u0144sk"},{"id":"7","lon":"54.43233","lat":"18.4889","title":"Lotos","street":"ul. Spacerowa 50","city":"Gda\u0144sk"},{"id":"8","lon":"54.34934","lat":"18.68168","title":"Lotos","street":"ul. Elbl\u0105ska 87","city":"Gda\u0144sk"},{"id":"9","lon":"54.33782","lat":"18.6296","title":"Lotos","street":"ul. Cienista 14 c","city":"Gda\u0144sk"},{"id":"10","lon":"54.37123","lat":"18.62785","title":"Lotos","street":"al. Zwyci\u0119stwa 13","city":"Gda\u0144sk"},{"id":"11","lon":"54.32889","lat":"18.61754","title":"Lotos","street":"ul. Ma\u0142omiejska 31","city":"Gda\u0144sk"},{"id":"12","lon":"54.31448","lat":"18.62952","title":"Shell","street":"ul. Trakt \u015bw. Wojciecha 223","city":"Gda\u0144sk"},{"id":"13","lon":"54.40076","lat":"18.59151","title":"Shell","street":"al. Rzeczypospolitej 8","city":"Gda\u0144sk"},{"id":"15","lon":"54.35202","lat":"18.64663","title":"Shell","street":"ul. Pa\u0142ubickiego 12","city":"Gda\u0144sk"},{"id":"16","lon":"54.32677","lat":"18.61032","title":"Shell","street":"ul. \u015awi\u0119tokrzyska 1","city":"Gda\u0144sk"},{"id":"17","lon":"54.37391","lat":"18.52192","title":"Shell","street":"ul. Z\u0142ota Karczma","city":"Gda\u0144sk"},{"id":"18","lon":"54.37853","lat":"18.63367","title":"Statoil","street":"ul. Marynarki Polskiej 93","city":"Gda\u0144sk"},{"id":"19","lon":"54.34701","lat":"18.60374","title":"Abi Sp. z o.o.","street":"ul. \u0141ostowicka 4","city":"Gda\u0144sk"},{"id":"20","lon":"54.31002","lat":"18.63466","title":"Aib Andrzej Bu\u015bko","street":"ul. Trakt \u015bw. Wojciecha 43","city":"Gda\u0144sk"},{"id":"21","lon":"54.34883","lat":"18.66036","title":"Bednar Sp. z o.o.","street":"ul. Szafarnia 11 lok. F8","city":"Gda\u0144sk"},{"id":"22","lon":"54.33505","lat":"18.65121","title":"&quot;Moto&quot; Przedsi\u0119biorstwo Handlowe Stacja Paliw J\u00f3zef Ku\u0142aga","street":"ul. Olszy\u0144ska 3","city":"Gda\u0144sk"},{"id":"23","lon":"54.38296","lat":"18.64483","title":"&quot;Moto&quot; Przedsi\u0119biorstwo Handlowe Stacja Paliw J\u00f3zef Ku\u0142aga","street":"ul. Marynarki Polskiej 73","city":"Gda\u0144sk"},{"id":"24","lon":"54.39361","lat":"18.58075","title":"Orlen","street":"al. Grunwaldzka 258","city":"Gda\u0144sk"},{"id":"25","lon":"54.33409","lat":"18.63585","title":"Orlen","street":"ul. Trakt \u015bw. Wojciecha 43 \/45","city":"Gda\u0144sk"},{"id":"26","lon":"54.39665","lat":"18.57915","title":"Orlen","street":"al. Grunwaldzka 341","city":"Gda\u0144sk"},{"id":"27","lon":"54.35905","lat":"18.64037","title":"Orlen","street":"ul. D\u0105browskiego 4","city":"Gda\u0144sk"},{"id":"28","lon":"54.40268","lat":"18.66379","title":"Orlen","street":"ul. Oliwska 37","city":"Gda\u0144sk"},{"id":"29","lon":"54.34835","lat":"18.68232","title":"Orlen","street":"ul. Mia\u0142ki Szlak 14","city":"Gda\u0144sk"},{"id":"30","lon":"54.38153","lat":"18.47584","title":"Orlen","street":"ul. S\u0142owackiego 198","city":"Gda\u0144sk"}];
var json = [];



makeRequest('GET','getAllPoints.php', '', alertContents);





// wrap the instanciation code in an anonymous function that gets executed
// immeadeately
function main(){

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
    map = new OpenLayers.Map("mapOL", {
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
					//controlFeatureClick(e);
					loadInfo(e);
    				//var feature = e.feature;
					//popup('popUpDiv');
    				
    			}
			}
		});
    
    // background WMS
	
	
    var ol_wms = new OpenLayers.Layer.OSM({
        layers: "basic"
    });
    
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
    vectorlayer = new OpenLayers.Layer.Vector('Vectorlayer', {styleMap: stylemap, strategies: [new OpenLayers.Strategy.Cluster({distance: 30})]});
    
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
    
    map.addLayers([ol_wms, vectorlayer]);
    map.addControl(new OpenLayers.Control.LayerSwitcher());
    map.zoomToMaxExtent();
	
	
	
	map.addControl(new OpenLayers.Control.ScaleLine());
	map.addControl(new OpenLayers.Control.Permalink('permalink'));
	map.addControl(new OpenLayers.Control.MousePosition());
    
   addFeaturesToVector(vectorlayer, json);
    updateGeneralInformation();

    // the behaviour and methods for the radioboxes    
    var changeStrategy = function() {
        var strategies = [];
        // this is the checkbox
        switch(this.value) {
            case 'cluster':
                // standard clustering
                strategies.push(new OpenLayers.Strategy.Cluster({distance: 30}));
                break;
            case 'attribute-cluster':
                // use the custom class: only cluster features of the same clazz
                strategies.push(new OpenLayers.Strategy.AttributeCluster({
                    attribute:'clazz'
                }));
                break;
            case 'rule-cluster':
                // use the custom class: only cluster features that have a 
                // clazz smaller than 4
                strategies.push(new OpenLayers.Strategy.RuleCluster({
                    rule: new OpenLayers.Rule({
                        filter: new OpenLayers.Filter.Comparison({
                            type: OpenLayers.Filter.Comparison.LESS_THAN,
                            property: "clazz",
                            value: 4
                        })
                    })
                }));
                break;
        }
        // remove layer and control
			
        map.removeLayer(vectorlayer);
        map.removeControl(select);
        // rebuild layer
        vectorlayer = new OpenLayers.Layer.Vector('Vectorlayer', {styleMap: stylemap, strategies: strategies});
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
//(main());
//var httpRequest=false;

function makeRequest(type, url, data, func, async) {
	//console.log(type+' '+url+' '+data);
	if (window.XMLHttpRequest) { // Mozilla, Safari, ...
		httpRequest = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE
		try {
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}

	if (!httpRequest) {
		alert('Giving up :( Cannot create an XMLHTTP instance');
		return false;
	}
	
	var a = ( async === false ) ? false : true;
	
	httpRequest.onreadystatechange = func;
	httpRequest.open(type, url, a);
	httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	if (data==="") {
		httpRequest.send();
	} else {
		httpRequest.send(data);
	}
}

function alertContents() {
	//console.log(httpRequest);
	if (httpRequest.readyState === 4) {
		//console.log(httpRequest.readyState);
		if (httpRequest.status === 200) {
			//alert(httpRequest.status);
			//  alert(httpRequest.responseText);
			var jsonObj = JSON.parse(httpRequest.responseText);
			//alert(jsonObj);
			json = jsonObj;
			//console.log(jsonObj);
			//console.log(json);
			main();
			//addFeaturesToVector(layer1, json);
		} else {
			alert('There was a problem with the request.');
		}
	}
}

  
  // funkcja zwracajaca liste stacji z obiektow json
function appendList(jsonObj) {
	
	var len = jsonObj.length;
	//list.innerHTML = "";
	var parent = document.getElementById('list');
	
	while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
	}
	
	var h2 = document.createElement('h2');
	h2.id = "listTitle";
	h2.className = "button";
	h2.setAttribute("onclick", "toggle_visibility('listContent')");
	
	var div = document.createElement('div');
	div.id = "listContent";
	div.className = "toggle";
	h2.appendChild(document.createTextNode('Gas stations'));
	
	parent.appendChild(h2);
	parent.appendChild(div);
	
	var sortP = document.createElement('select');
	sortP.id = 'sort';
	sortP.name  = 'paliwo';
	
	var o1 = document.createElement('option');
	o1.text = 'ON';
	o1.value = 'ON_';
	sortP.add(o1);
	
	var o2 = document.createElement('option');
	o2.text = 'PB95';
	o2.value = 'PB95';
	sortP.add(o2);
	
	var o3 = document.createElement('option');
	o3.text = 'PB98';
	o3.value = 'PB98';
	sortP.add(o3);
	
	var o4 = document.createElement('option');
	o4.text = 'LPG';
	o4.value = 'LPG';
	sortP.add(o4);
	
	
	var sortT = document.createElement('select');
	sortP.id = 'sort';
	sortP.name  = 'paliwo';
	
	var o5 = document.createElement('option');
	o5.text = 'Ascending';
	o5.value = 'ASC';
	sortT.add(o5);
	
	var o6 = document.createElement('option');
	o6.text = 'Descending';
	o6.value = 'DESC';
	sortT.add(o6);
	
	parent.appendChild(sortP);
	parent.appendChild(sortT);
	
	
	var	btn3 = document.createElement('button');
		btn3.setAttribute("type", "button");
		btn3.setAttribute("onclick", "sortList()");
		btn3.appendChild(document.createTextNode("Sort list"));
		parent.appendChild(btn3);
	
	/*
	listContent.innerHTML += "Sortowanie : <select id=\"sort\" name='paliwo'>" + 
	" <option value='ON_'>ON</option>" + 
	"<option value='PB95'>PB95</option>" + 
	"<option value='PB98'>PB98</option>" + 
	"<option value='LPG'>LPG</option></select>";
	listContent.innerHTML += "<select id=\"typsort\" name='typ'>" + 
	"<option value='ASC'>Rosnąco</option>" + 
	"<option value='DESC'>Majejąco</option></select>" +
	"<button type=\"button\" name=\"sortuj\" onclick=\"sortuj()\"></t> Sortuj</button>";
	*/
	//list.innerHTML = "<h2 id=\"listTitle\" class=\"button\" onclick=\"toggle_visibility(\'listContent\')\">Gas stations</h2><div id=\"listContent\" class=\"toggle\"></div>";
	//tableCreate(jsonObj);
	
}
  
function tableCreate(jsonObj) {

	var parent = document.getElementById('listContent');
	tbl = document.createElement('table');
	tbl.className = "stationsList";
	tbl.id = "stationsTable";
		
	
	var thead = document.createElement('thead');
	var trhead = thead.insertRow();
	var tbody = document.createElement('tbody');
	
	var len = jsonObj.length;
	for (var i = 0; i < len; i++) {
		var tr = tbody.insertRow();
		var arr = [ 'id', 'title', 'street', 'city'];
		var arrlen = arr.length;

		for (var j = 0; j < arrlen; j++) {
			var prop = arr[j];
			if (i===0) {
				var th = document.createElement('th');
				if (j===0) {
					th.appendChild(document.createTextNode(i));
				} else {
					th.appendChild(document.createTextNode(prop.toUpperCase()));
				}
				trhead.appendChild(th);
				if ( j===arrlen ) {
					tbl.appendChild(thead);
				}
			}
			var td = tr.insertCell();
			
			td.appendChild(document.createTextNode(jsonObj[i][prop]));
		}
		
			
		var btnTd1 = tr.insertCell();
		/*
		btn1 = document.createElement('button');
		btn1.setAttribute("type", "button");
		btn1.setAttribute("onclick", "showPoint(" + jsonObj[i].id +	")");
		btn1.appendChild(document.createTextNode("Show on map"));
		btnTd1.appendChild(btn1);*/
		/*
		a1 = document.createElement('a');
		a1.setAttribute("href", "#");
		a1.id = "showPopup-OpenLayers_Layer_Vector_26-OpenLayers_Feature_Vector_157-1";
		a1.className='button';
		a1.appendChild(document.createTextNode("Show on map"));
		btnTd1.appendChild(a1);
		*/
		
		var btnTd2 = tr.insertCell();
		btn2 = document.createElement('button');
		btn2.setAttribute("type", "button");
		btn2.setAttribute("onclick", "makeRequest('POST', 'removePoint.php', 'id=" + jsonObj[i].id + "' , afterDelete )");
		btn2.appendChild(document.createTextNode("Delete point"));
		btnTd2.appendChild(btn2);
		
		tbl.appendChild(thead);
		tbl.appendChild(tbody);
		
	}
	parent.appendChild(tbl);
}
//tableCreate();
  
function appendMarkersLayer(layer) {

	var controls = {
		selector : new OpenLayers.Control.SelectFeature(layer, {
			onSelect : createPopup,
			onUnselect : destroyPopup,
			hover: true
		}),
	};

	// wyswielenie popupu na mapie
	function createPopup(feature) {
		//if (feature.attributes.count === 1) {
			feature.popup = new OpenLayers.Popup.Anchored(feature.attributes.id,
					feature.geometry.getBounds().getCenterLonLat(),
					null,
					'<div class="popupContent">'+ feature.cluster[0].attributes.name + '</div>',
					null, 
					false,
					function () {
					controls['selector'].unselectAll();
				});
				
			var offset = {'size':new OpenLayers.Size(0,0),'offset':new OpenLayers.Pixel(-50,-20)};
       feature.popup.anchor = offset;
			//feature.popup.offset = {'size':new OpenLayers.Size(100,100),'offset':new OpenLayers.Pixel(100,100)};
			feature.popup.closeOnMove = true;
			
			
			
			feature.popup.panMapIfOutOfView = true;
			feature.popup.opacity = 0.75;
			feature.popup.backgroundColor = 'black';
			feature.popup.autoSize = true;
			feature.popup.minSize = new OpenLayers.Size( 10,10);
			//feature.popup.relativePosition = "br";
            feature.popup.calculateRelativePosition = function () {
                 return 'tr';
            }
			//console.log(feature.popup.getSafeContentSize());
			map.addPopup(feature.popup);
			
		} /*else {
			var clusterLen = feature.cluster.length;
			var minZoom = 100;
			for (var i = 0; i < clusterLen; i++) {
				var zoom = feature.cluster[i].attributes.zoom;
				if (zoom < minZoom) {
					minZoom = zoom;
				}
			}
			
			var minZoomFeatures = [];
			for ( var i=0; i<clusterLen; i++) {
			
			 if (feature.cluster[i].attributes.zoom == minZoom) {
				minZoomFeatures.push(feature.cluster[i]);
			 }
			}
			
			function placeNames() {
				var names = '';
				var len = minZoomFeatures.length;
				for ( var i=0; i<len; i++) {
					names += minZoomFeatures[i].attributes.name + '<br/>'
				}
				return names;
			}
			
			feature.popup = new OpenLayers.Popup(null,
					feature.geometry.getBounds().getCenterLonLat(),
					null,
					'<div class="popupContent">' + placeNames() + '</div>',

					false,
					function () {
					controls['selector'].unselectAll();
				});
				
				var offset = {'size':new OpenLayers.Size(10,12),'offset':new OpenLayers.Pixel(0,-12)};
					
			feature.popup.closeOnMove = true;
			feature.popup.updateSize();
			feature.popup.panMapIfOutOfView = true;
			feature.popup.opacity = 0.65;
			feature.popup.backgroundColor = 'black';
			feature.popup.autoSize = true;
			feature.popup.padding = 20;
			feature.popup.minSize = new OpenLayers.Size( 100, 20);
			feature.popup.updateSize();
			map.addPopup(feature.popup);
		}
	}*/

	function destroyPopup(feature) {
		if (feature.attributes.count === 1) {
			feature.popup.destroy();
			feature.popup = null;
		} else {
			feature.popup.destroy();
			feature.popup = null;
		}
	}
	//wyswietlenie x do zamkniecia popupu
	map.addControl(controls['selector']);
	controls['selector'].activate();
	//layer.events.on({"featureselected": showInformation});
	//wyswietlenie listy stacji
	//appendList(json);
}

function toggle_visibility(id) {
	var e = document.getElementById(id);
	if (e.style.display == 'block') {
		e.style.display = 'none';
		
			
	 
		}
	else {
		e.style.display = 'block';
		console.log(id);
		
		}
}

function toggle_element(e) {
	var element = e.target.nextSibling;
	
	if (element.style.display !== 'block') {
		element.style.display = 'block';
		}
	else {
		element.style.display = 'none';
	
		}
	console.log(element);
}
// funkcja sprawdzajaca, czy wszystkie pola formularza zostaly wypelnione
function validateAddForm() {
	var name = document.forms['addForm']['name'].value;
	var addr = document.forms['addForm']['addr'].value;
	var descr = document.forms['addForm']['descr'].value;
	var lon = document.forms['addForm']['lon'].value;
	var lat = document.forms['addForm']['lat'].value;
	var zoom = document.forms['addForm']['zoom'].value;
	var cat = document.forms['addForm']['cat'].value;
/*
	if (name === '' || lon === '' || lat === '' || desc === '') {
		addFormMsg.innerHTML = "Fill all input fields";
		return false;
	} else {
		addFormMsg.innerHTML = "Waiting for response";

		var data = 'lon=' + lon + '&lat=' + lat + '&name=' + name + '&addr=' + addr + '&desc=' + desc + '&zoom=' + zoom + '&cat=' + cat;
		makeRequest('POST', 'addPoint.php', data, afterAdd);
	}*/
	var data = 'lon=' + lon + '&lat=' + lat + '&name=' + name + '&addr=' + addr + '&descr=' + descr + '&zoom=' + zoom + '&cat=' + cat;
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

		switch (brand) {
		case "BP":
			clazz = 1;
			break;

		case "Orlen":
			clazz = 4;
			break;

		case "Shell":
			clazz = 3;
			break;

		case "Lotos":
			clazz = 3;
			break;

		default:
			clazz = 5;
			break;

		}
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
				forumID : json[i].forumID
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

function makeRequestPost(id) {
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
      httpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
      try {
        httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
      } 
      catch (e) {
        try {
          httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        catch (e) {}
      }
    }

    if (!httpRequest) {
      alert('Giving up :( Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = alertContents2;
    httpRequest.open('POST', "removePoint.php");
	httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    httpRequest.send('id=' + id);
  }  

function afterDelete() {

    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200) {
        //alert(httpRequest.responseText);
		console.log(json.length);
		
		for (var i = 0; i < json.length; i++){
			console.log(i+', '+json[i].id+', '+httpRequest.responseText);
			//console.log(json[i].id == (httpRequest.responseText).toString());
			//console.log(json[i].id === httpRequest.responseText);
			//console.log(httpRequest.responseText.length);
			//console.log(((parseInt(httpRequest.responseText)).toString()).length);
			var val = parseInt(httpRequest.responseText);
			if (json[i].id == val){
			console.log("found "+i);
			json.splice(i, 1);
			console.log(json.length);
			if ((map.popups[0]) && map.popups[0].id == val) {
				map.removePopup(map.popups[0]);
			}
			break;
			}
		}
		
		addFeaturesToVector(vectorlayer, json);
      } else {
        alert('There was a problem with the request.');
      }
    }
  }
  
function searchByTag() {

	var tag = document.getElementById("search_tag").value;

	if (tag == "") {
		addFormMsg.innerHTML = "Fill any input field";
		return false;
	} else {
		searchFormMsg.innerHTML = "Waiting for response";
		makeRequest('POST', 'searchByTag.php', 'tag=' + tag, afterSearch);
	}
	return false;
}
  
function afterSearch() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			//alert(httpRequest.responseText);
			var jsonObj = JSON.parse(httpRequest.responseText);
			searchFormMsg.innerHTML = "";
			
			json = jsonObj;
			
			if (map.popups[0]) {
				map.removePopup(map.popups[0]);
			}
			
			addFeaturesToVector(vectorlayer, json);
		} else {
			alert('There was a problem with the request.');
		}
	}
}
 // funkcja zwracajaca miniaturke w popupie na podstawie nazwy stacji
function pickThumbnail(brand) {
	switch(brand) {
		case 'Orlen':
			return '../img/orlen.jpg'
			break;
		case 'Lotos':
			return '../img/lotos.jpg'
			break;
		case 'Shell':
			return '../img/shell.jpg'
			break;
		case 'BP':
			return '../img/bp.jpg'
			break;
		default:
			return '../img/inne.png'
	}
}

function controlFeatureClick(e) {
	console.log(e);	
}

function getCoordinates() {
			var click = new OpenLayers.Control.Click();
			map.addControl(click);
			click.activate();
			vectorlayer.setVisibility(false);
			toggle_visibility('addPoint');
			var overlay = document.getElementById('popupMask');
			overlay.style.zIndex = 90;
			
			var mapDiv = document.getElementById('mapOL');
			mapDiv.style.cursor = 'crosshair';
			return false;
	}
	
	function loadInfo(e) {
	//console.log(e);	
	
	var data = e.feature.cluster[0].attributes;
	var infoBox = document.getElementById('infoBox');
	var thisBoxId = data.id;
	lastRetrPoint = thisBoxId;
	if (thisBoxId !== infoBoxId) {
		while (infoBox.firstChild) {
			infoBox.removeChild(infoBox.firstChild);
		}
		
		
		var infoBoxCloseBtn = document.createElement('h1');
		infoBoxCloseBtn.innerHTML = '<span>X Close</span>';
		infoBoxCloseBtn.className = 'infoBoxLabel infoBoxCloseBtn';
		//infoBoxLabel.nextSibling.style.display = 'block';
		infoBoxCloseBtn.addEventListener('click', function(){
			toggle_visibility('infoBox');
			infoBoxStatus ^= 1;
			}, false);
		infoBox.appendChild(infoBoxCloseBtn);
		
		
		var infoBoxLabel = document.createElement('h1');
		infoBoxLabel.innerHTML = '<span>' + data.name + '</span>';
		infoBoxLabel.className = 'infoBoxLabel';
		//infoBoxLabel.nextSibling.style.display = 'block';
		infoBoxLabel.addEventListener('click', toggle_element, false);
		infoBox.appendChild(infoBoxLabel);
		if (infoBoxStatus === 0) {
			toggle_visibility('infoBox');
			infoBoxStatus ^= 1;
		}
		
		
		
		var infoDescrBox = document.createElement('div');
		infoDescrBox.id = 'infoDescrBox';
		infoDescrBox.className = 'infoBoxItem';
		infoDescrBox.style.display = 'block';
		
		
		var infoCords = document.createElement('p');
		var infoDescr = document.createElement('p');
		infoDescr.id = 'infoDescr';
		infoDescr.className = 'infoDescr'
		infoDescr.innerHTML = data.description;
		
		infoCords.id = 'infoCords';
		infoCords.innerHTML = data.lon + ' ' + data.lat;
		infoDescrBox.appendChild(infoCords);
		infoDescrBox.appendChild(infoDescr);
		
		infoBox.appendChild(infoDescrBox);
		
		var infoCommLabel = document.createElement('h1');
		infoCommLabel.className = 'infoBoxLabel';
		infoCommLabel.innerHTML= '<span>Comments</span>';
		//infoCommLabel.nextSibling.style.display = 'none';
		infoCommLabel.addEventListener('click', toggle_element, false);
		infoBox.appendChild(infoCommLabel);
		
		var infoCommBox = document.createElement('div');
		infoCommBox.id = 'infoCommBox';
		infoCommBox.className =  'infoBoxItem';
		infoBox.appendChild(infoCommBox);
		
		var dataString = 'pointId=' + data.id + '&commId=0';
		makeRequest('POST', 'getComments.php', dataString, afterGetComments, false);

		var infoPicsLabel = document.createElement('h1');
		infoPicsLabel.className = 'infoBoxLabel';
		infoPicsLabel.innerHTML = '<span>Images</span>';
		infoBox.appendChild(infoPicsLabel);
		
		var infoPicsBox = document.createElement('div');
		infoPicsBox.id = 'infoPicsBox';
		infoPicsBox.className =  'infoBoxItem';
		//infoPicsLabel.nextSibling.style.display = 'none';
		infoPicsLabel.addEventListener('click', toggle_element, false);
		infoBox.appendChild(infoPicsBox);
		
		var dataString2 = 'pointId=' + data.id + '&picId=0';
		makeRequest('POST', 'getPictures.php', dataString2, afterGetPics, false);
		
		var infoForumLabel = document.createElement('h1');
		infoForumLabel.className = 'infoBoxLabel';
		infoForumLabel.innerHTML = '<span>Forum Link</span>';
		infoForumLabel.addEventListener('click', toggle_element, false);
		infoBox.appendChild(infoForumLabel);
		
		var infoForumBox = document.createElement('div');
		infoForumBox.id = 'infoForumBox';
		infoForumBox.className =  'infoBoxItem';
		
		
		infoForumBox.innerHTML = '<p>' + (data.forumID == null) ? "<a href='#'>Create new post</a>" : data.forumID + '</p>';
		infoBox.appendChild(infoForumBox);
		
		console.log('first');
		
		infoBoxId = thisBoxId;
		
	} else {
		
		toggle_visibility('infoBox');
		console.log('second');
	}
/*
	*/
}

function afterGetComments() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log(httpRequest.responseText);
			var commObj = JSON.parse(httpRequest.responseText);
			
			var len = commObj.length;
			var parent = document.getElementById('infoCommBox');
			var commList = document.createElement('ul');
			commList.id = 'commentList';
			commList.className = 'commentList';
			
			while (parent.firstChild) {
			parent.removeChild(parent.firstChild);
		}
			
			for ( var i=0; i< len; i++){
				var commListItemContent = document.createElement('li');
				commListItemContent.className = 'commListItem comment';
				commListItemContent.innerHTML = commObj[i].comment;
				commList.appendChild(commListItemContent);
				
				var commListItemAuthor =  document.createElement('li');
				commListItemAuthor.className = 'commListItem author';
				commListItemAuthor.innerHTML = commObj[i].username;
				commList.appendChild(commListItemAuthor);
				
				var commListItemDate =  document.createElement('li');
				commListItemDate.className = 'commListItem date';
				commListItemDate.innerHTML = commObj[i].date;
				commList.appendChild(commListItemDate);
				
				if ( i == len-1) {
				lastRetrComm = commObj[i].id;
				}
			}
			parent.appendChild(commList);
			//console.log(commObj);
			var moreCommLink = document.createElement('div');
			var getCommLink = document.createElement('a');
			getCommLink.href = "#";
			
			
			var dataString3 = 'pointId=' + lastRetrPoint + '&commId=' + lastRetrComm;
			
			
			getCommLink.onclick = function() {
				makeRequest('POST', 'getComments.php', dataString3, afterGetComments, false);
			};
			
			var getCommLinkTN = document.createTextNode("More comments");
			getCommLink.appendChild(getCommLinkTN);
			moreCommLink.appendChild(getCommLink);
			
		
			parent.appendChild(moreCommLink);
	
		} else {
			alert('There was a problem with the request.');
		}
	}
}



function afterGetPics() {
	if (httpRequest.readyState === 4) {
		if (httpRequest.status === 200) {
			console.log(httpRequest.responseText);
			var picsObj = JSON.parse(httpRequest.responseText);
			
			var len = picsObj.length;
			var parent = document.getElementById('infoPicsBox');
			var picsList = document.createElement('ul');
			picsList.id = 'picsList';
			picsList.className = 'picsList';
			
				while (parent.firstChild) {
			parent.removeChild(parent.firstChild);
		}
			
			for ( var i=0; i< len; i++){
				var picsListItemContent = document.createElement('li');
				picsListItemContent.className = 'picsListItem pic';
				
				var link = document.createElement('a');
				link.href = 'http://127.0.0.1/dyplom/examples/gallery/' + picsObj[i].filename + '_z.jpg';
				link.title = picsObj[i].login + ' ' + picsObj[i].date;
				link.dataset.lightbox = "set";
				
				
				var thumb = document.createElement('img');
				thumb.src = 'http://127.0.0.1/dyplom/examples/gallery/' + picsObj[i].filename + '_m.jpg';
				thumb.style.width = 50 + 'px';
				thumb.style.height = 50 + 'px';
				
				link.appendChild(thumb);
				picsListItemContent.appendChild(link);
				picsList.appendChild(picsListItemContent);
				
				if ( i == len-1) {
				lastRetrPic = picsObj[i].id;
				}
				
			}
			parent.appendChild(picsList);
			
		
			var morePicsLink = document.createElement('div');
			
			var getPicsLink = document.createElement('a');
			 getPicsLink.href = "#";
			
			
			var dataString4 = 'pointId=' + lastRetrPoint + '&picId=' + lastRetrPic;
			
			
			 getPicsLink.onclick = function() {
				makeRequest('POST', 'getPictures.php', dataString4, afterGetPics, false);
			};
			
			var getPicsLinkTN = document.createTextNode("More pictures");
			getPicsLink.appendChild(getPicsLinkTN);
			morePicsLink.appendChild(getPicsLink);
			

			parent.appendChild(morePicsLink);
			
			//console.log(picsObj);
			
			
	
		} else {
			alert('There was a problem with the request.');
		}
	}
}