//tablica z obiektami zawierajacymi dane stacji do pokazania na mapie
//var json = [   { "id": 0,     "pointLon":54.42000,     "pointLat":18.62000,     "title":"my orange title",     "street":"my orange description",     "city":"../img/marker-blue.png",     "icon":""   },   { "id": 1,     "pointLon":54.37715,     "pointLat":18.52172,     "title":"BP",     "street":"ul. Słowackiego 80",     "city":"Gdańsk  ",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 2,     "pointLon":54.35812,     "pointLat":18.58332,     "title":"BP",     "street":"ul. Rakoczego 15",     "city":"Gdańsk  ",     "icon":""   },   { "id": 3,     "pointLon":54.39468,     "pointLat":18.58011,     "title":"BP",     "street":"al. Grunwaldzka",     "city":"Gdańsk  ",     "icon":""   },   { "id": 4,     "pointLon":54.39398,     "pointLat":18.58689,     "title":"BP",     "street":"al. Grunwaldzka 229/237",     "city":"Gdańsk  ",     "icon":""   },   { "id": 5,     "pointLon":54.33805,     "pointLat":18.61407,     "title":"BP",     "street":"ul. Witosa",     "city":"Gdańsk  ",     "icon":""   },   { "id": 6,     "pointLon":54.43233,     "pointLat":18.4889,     "title":"Lotos",     "street":"ul. Spacerowa 50",     "city":"Gdańsk  ",     "icon":""   },   { "id": 7,     "pointLon":54.34934,     "pointLat":18.68168,     "title":"Lotos",     "street":"ul. Elbląska 87",     "city":"Gdańsk  ",     "icon":""   },   { "id": 8,     "pointLon":54.33782,     "pointLat":18.6296,     "title":"Lotos",     "street":"ul. Cienista 14 c",     "city":"Gdańsk  ",     "icon":""   },   { "id": 9,     "pointLon":54.37123,     "pointLat":18.62785,     "title":"Lotos",     "street":"al. Zwycięstwa 13",     "city":"Gdańsk  ",     "icon":""   },   { "id": 10,     "pointLon":54.32889,     "pointLat":18.61754,     "title":"Lotos",     "street":"ul. Małomiejska 31",     "city":"Gdańsk  ",     "icon":""   },   { "id": 11,     "pointLon":54.31448,     "pointLat":18.62952,     "title":"Shell",     "street":"ul. Trakt św. Wojciecha 223",     "city":"Gdańsk  ",     "icon":""   },   { "id": 12,     "pointLon":54.40076,     "pointLat":18.59151,     "title":"Shell",     "street":"al. Rzeczypospolitej 8",     "city":"Gdańsk  ",     "icon":""   },   { "id": 13,     "pointLon":54.34701,     "pointLat":18.60374,     "title":"Shell",     "street":"ul. Łostowicka 4",     "city":"Gdańsk  ",     "icon":""   },   { "id": 14,     "pointLon":54.35202,     "pointLat":18.64663,     "title":"Shell",     "street":"ul. Pałubickiego 12",     "city":"Gdańsk  ",     "icon":""   },   { "id": 15,     "pointLon":54.32677,     "pointLat":18.61032,     "title":"Shell",     "street":"ul. Świętokrzyska 1",     "city":"Gdańsk  ",     "icon":""   },   { "id": 16,     "pointLon":54.37391,     "pointLat":18.52192,     "title":"Shell",     "street":"ul. Złota Karczma",     "city":"Gdańsk  ",     "icon":""   },   { "id": 17,     "pointLon":54.37853,     "pointLat":18.63367,     "title":"Statoil",     "street":"ul. Marynarki Polskiej 93",     "city":"Gdańsk  ",     "icon":""   },   { "id": 18,     "pointLon":54.34701,     "pointLat":18.60374,     "title":"&quot;Abi&quot;",     "street":"Sp. z o.o.",     "city":"ul. Łostowicka 4",     "icon":"Gdańsk  "   },   { "id": 19,     "pointLon":54.31002,     "pointLat":18.63466,     "title":"Aib Andrzej Buśko",     "street":"ul. Trakt św. Wojciecha 43",     "city":"Gdańsk  ",     "icon":""   },   { "id": 20,     "pointLon":54.34883,     "pointLat":18.66036,     "title":"Bednar Sp. z o.o.",     "street":"ul. Szafarnia 11 lok. F8",     "city":"Gdańsk  ",     "icon":""   },   { "id": 21,     "pointLon":54.33505,     "pointLat":18.65121,     "title":"&quot;Moto&quot; Przedsiębiorstwo Handlowe Stacja Paliw Józef Kułaga",     "street":"ul. Olszyńska 3",     "city":"Gdańsk  ",     "icon":""   },   { "id": 22,     "pointLon":54.38296,     "pointLat":18.64483,     "title":"&quot;Moto&quot; Przedsiębiorstwo Handlowe Stacja Paliw Józef Kułaga",     "street":"ul. Marynarki Polskiej 73",     "city":"Gdańsk  ",     "icon":""   },   { "id": 23,     "pointLon":54.39361,     "pointLat":18.58075,     "title":"Orlen",     "street":"al. Grunwaldzka 258",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 24,     "pointLon":54.33409,     "pointLat":18.63585,     "title":"Orlen",     "street":"ul. Trakt św. Wojciecha 43 /45",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 25,     "pointLon":54.39665,     "pointLat":18.57915,     "title":"Orlen",     "street":"al. Grunwaldzka 341",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 26,     "pointLon":54.35905,     "pointLat":18.64037,     "title":"Orlen",     "street":"ul. Dąbrowskiego 4",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 27,     "pointLon":54.40268,     "pointLat":18.66379,     "title":"Orlen",     "street":"ul. Oliwska 37",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 28,     "pointLon":54.34835,     "pointLat":18.68232,     "title":"Orlen",     "street":"ul. Miałki Szlak 14",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 29,     "pointLon":54.38153,     "pointLat":18.47584,     "title":"Orlen",     "street":"ul. Słowackiego 198",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   },   { "id": 30,     "pointLon":54.32312,     "pointLat":18.60212,     "title":"Orlen",     "street":"ul. Świętokrzyska 2",     "city":"Gdańsk",     "icon":"../img/icoGoogleOrlen.gif"   } ];
var json = [];
//tablica z obiektami, pomiedzy ktorymi obliczana jest odleglosc
var distancePoints = [ null, null ];

// Ustawienia mapy
var layerListeners = {
    featureclick: function(e) {
        //log(e.object.name + " says: " + e.feature.id + " clicked.");
		clearSelction();
        return false;
    },
    nofeatureclick: function(e) {
        //log(e.object.name + " says: No feature clicked.");
		p1.innerHTML = "Pick point";
		p2.innerHTML = "Pick point";
		dstnc.innerHTML = "Pick points";
		distancePoints = [null, null];
		clearSelction();	
		var lonlat = map.getLonLatFromPixel(e.xy);
		console.log(lonlat);
    }/*,
	featureover: function(e) {
		clearSelction();
	}*/
};




var style = new OpenLayers.StyleMap({
    'default': OpenLayers.Util.applyDefaults({
        label: "${label}", 
		graphicOpacity: 0.8, 
		externalGraphic: "${externalGraphic}",
		graphicHeight: 40, 
		graphicWidth: 27, 
		graphicXOffset: -14,
		graphicYOffset: -40,
		id: "${id}",
		fontFamily: "Arial, sanserif",
		fontSize: 14,
		labelXOffset: 0,
		labelYOffset: 26,
		fontColor: "white",
		labelOutlineWidth: 0
		},
		
        OpenLayers.Feature.Vector.style["default"]
    ),
    'select': OpenLayers.Util.applyDefaults({
		graphicOpacity: 1.0,
        externalGraphic: "../img/marker_orange.png",
		fontColor: "white",
		labelOutlineWidth: 0
		},
        OpenLayers.Feature.Vector.style.select
    )
});

var layer1 = new OpenLayers.Layer.Vector("Gas Stations", {
    styleMap: style,
    eventListeners: layerListeners
});

// transformacja wspolrzednych
var epsg4326 = new OpenLayers.Projection('EPSG:4326');	// Transform from WGS 1984
var epsg900913 = new OpenLayers.Projection('EPSG:900913');	// to Spherical Mercator Projection


/* 
for( var i=0; i<len; i++) {
console.log(layer1.features[i].attributes);
}
*/

var options = {
	controls: [
		new OpenLayers.Control.Navigation(),
		new OpenLayers.Control.PanZoomBar(),
		new OpenLayers.Control.Attribution()
	],
	//allOverlays: true,
	eventListeners: {
		featureover: function(e) {
			clearSelction();
			e.feature.renderIntent = "select";
			e.feature.layer.drawFeature(e.feature);
			//log("Map says: Pointer entered " + e.feature.id + " on " + e.feature.layer.name);
			console.log(e.feature);
		},
		featureout: function(e) {
			e.feature.renderIntent = "default";
			e.feature.layer.drawFeature(e.feature);
			//log("Map says: Pointer left " + e.feature.id + " on " + e.feature.layer.name);
		},
		featureclick: function(e) {
			//log("Map says: " + e.feature.id + " clicked on " + e.feature.layer.name);
			var feature = e.feature;
			//console.log(point);
			distancePoints.push(feature);
			distancePoints.shift();
			//console.log(distancePoints);
			distanceBetweenPoints(distancePoints);
		}/*,
		nofeatureclick: function(e) {
        //log(e.object.name + " says: No feature clicked.");
		var lonlat = map.getLonLatFromPixel(e.xy);
		
		console.log("no feature clicked");
		console.log(lonlat);
		p1.innerHTML = "Pick point";
		//p2.innerHTML = "Pick point";
		//dstnc.innerHTML = "Pick points";
		//distancePoints = [null, null];
		//clearSelction();	
    }*/
	}
};
/*
// start attributes
	var url = "test2.php"
	makeRequest(url);
	
	console.log(json);
	addFeaturesToVector(layer1, json);
	*/
var map;

// funkcja wyswietlajaca mape po otwarciu strony
function init() {	
	var osmLayer       = new OpenLayers.Layer.OSM();	// Open Street Map       
	var lonCenter      = 18.62;
	var latCenter      = 54.40;
	var zoom           = 11;
	var position       = new OpenLayers.LonLat(lonCenter, latCenter).transform(epsg4326, epsg900913);
	map = new OpenLayers.Map("map", options);

	map.addLayer(osmLayer);
	map.addLayer(layer1);
	map.addControl(new OpenLayers.Control.LayerSwitcher());
	map.setCenter(position, zoom);
	
	//appendMarkersLayer (layer1);
	
}

function appendMarkersLayer (layer) {
	

    var controls = {
      selector: new OpenLayers.Control.SelectFeature(layer, {onSelect: createPopup, onUnselect: destroyPopup }),
    };

	// wyswielenie popupu na mapie
    function createPopup(feature) {
      feature.popup = new OpenLayers.Popup(feature.attributes.id,
          feature.geometry.getBounds().getCenterLonLat(),
          null,
          '<div class="popupContent"><h2 class="popupHeader">'+feature.attributes.title+'</h2><img class="popupThumb" src="' + pickThumbnail(feature.attributes.title) + '" alt="Smiley face" height="42" width="42"/><p class="popupDesc">' +feature.attributes.description + '</p></div>',
         
          true,
          function() { controls['selector'].unselectAll(); }
      );
      //feature.popup.closeOnMove = true;
	  feature.popup.updateSize;
	  feature.popup.panMapIfOutOfView = true;
      map.addPopup(feature.popup);
    }

    function destroyPopup(feature) {
      feature.popup.destroy();
      feature.popup = null;
    }
    
	//wyswietlenie x do zamkniecia popupu
    map.addControl(controls['selector']);
    controls['selector'].activate();
	
	//wyswietlenie listy stacji
	appendList(json);
}

// funkcja zwracajaca nazwe pliku z markerem na podstawie nazwy stacji
function pickPinpointer(brand) {
	switch(brand) {
		case 'Orlen':
			return '../img/marker_red.png'
			break;
		case 'Lotos':
			return '../img/marker_blue.png'
			break;
		case 'Shell':
			return '../img/marker_yellow.png'
			break;
		case 'BP':
			return '../img/marker_green.png'
			break;
		default:
			return '../img/marker_grey.png'
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

// funkcja logujaca akcje uzytkownika - tylko dla testow
function log(msg) {
	if (!log.timer) {
		result.innerHTML = "";
		log.timer = window.setTimeout(function() {delete log.timer;}, 100);
	}
	result.innerHTML += msg + "<br>";
}

// funkcja zwracajaca liste stacji z obiektow json
function appendList(jsonObj) {
	var len = jsonObj.length;
	//list.innerHTML = "";
	list.innerHTML = "<h2 id=\"listTitle\" class=\"button\" onclick=\"toggle_visibility(\'listContent\')\">Gas stations</h2><ul id=\"listContent\" class=\"toggle\"></ul>";
	for( var i=0; i<len; i++) {
		listContent.innerHTML += "<li class=\"listItemTitle\" data-id=" + jsonObj[i].id + ">" + (i+1) + ". " + jsonObj[i].title + "</li><li>" + jsonObj[i].street + ", " + jsonObj[i].city + "</li><li><button type=\"button\" onclick=\"makeRequestPost(" + jsonObj[i].id + ")\">Delete Point</button><button type=\"button\" onclick=\"showPoint(" + jsonObj[i].id + ")\">Show on map</button></li>";
	}
}

// funkcja dodajaca obiekty do warstwy wektorowej
function addFeaturesToVector(layer, jsonObj) {
	layer.destroyFeatures();
	
	//layer.destroyFeatures();
	var len = jsonObj.length;
	for( var i=0; i<len; i++) {
		var feature = new OpenLayers.Feature.Vector(
			new OpenLayers.Geometry.Point(jsonObj[i].lat,jsonObj[i].lon).transform(epsg4326, epsg900913),
				{label:i+1,
				description:jsonObj[i].street+', '+jsonObj[i].city,
				externalGraphic: pickPinpointer(jsonObj[i].title), graphicHeight: 40, graphicWidth: 40, graphicXOffset:-12, graphicYOffset:-25  ,
				title:jsonObj[i].title, id:jsonObj[i].id
				}
			);
		layer.addFeatures(feature);
	}
	appendMarkersLayer (layer);
	layer.refresh({force:true});
}



// funkcja zwracajaca odleglosc pomiedzy dwoma punktami z tablicy distancePoints[]
function distanceBetweenPoints(points){
	var point1 = points[0];
	var point2 = points[1];

	if (point1 == null && point2 == null) {
		//dist.innerHTML = "Distance beetween two points. <br/>Pick two points:<br/>";
	} else if (point1 == null && point2 != null) {
		//dist.innerHTML = "Distance beetween two points. <br/>Pick second point:<br/>point1: " + point2.data.label + ". " + point2.data.title;
		p1.innerHTML = point2.data.label + ". " + point2.data.title;
		p2.innerHTML = "Pick second point";
	} else if (point1 != null && point2 != null) {
		var distance = (point1.geometry).distanceTo(point2.geometry).toFixed(2);
		//dist.innerHTML = "Distance beetween two points. <br/>point1: " + point1.data.label + ". " + point1.data.title + "<br/>point2: " + point2.data.label + ". " + point2.data.title  + "<br/>distance: " + distance + " m";
		p1.innerHTML = point1.data.label + ". " + point1.data.title;
		p2.innerHTML = point2.data.label + ". " + point2.data.title;
		dstnc.innerHTML = distance + " m";
		distancePoints = [null, null];
	}
		
}

// funkcja sprawdzajaca, czy wszystkie pola formularza zostaly wypelnione
function validateForm() {
    var name = document.forms["addForm"]["title"].value;
	var street = document.forms["addForm"]["street"].value;
	var city = document.forms["addForm"]["city"].value;
	var lon = document.forms["addForm"]["lon"].value;
	var lat = document.forms["addForm"]["lat"].value;
    
    if (name=="" || street == "" || city == "" || lon == "" || lat == "" ) {
		addFormMsg.innerHTML = "Fill all input fields";
        return false;
    } else {
		addFormMsg.innerHTML = "Waiting for response";
		makeRequestAdd();
	}
	return false;
}

 function searchStations() {
 
	var company = document.getElementById("search_company_name").value;
	var street = document.getElementById("search_street").value;
	var city = document.getElementById("search_city").value;
	
	 if (company=="" && street == "" && city == "" ) {
		addFormMsg.innerHTML = "Fill any input field";
        return false;
    } else {
	searchFormMsg.innerHTML = "Waiting for response";
  	makeRequestSearch();
	}
	return false;
 }

// funkcja usuwajaca stacje z bazy
/*
function removePoint(id) {
    var form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('action', 'removePoint.php');
	
	var inputField = document.createElement("input");
    inputField.setAttribute("type", "input");
	inputField.setAttribute("name", "id");
	inputField.setAttribute("value", id);
	form.appendChild(inputField);
	
	
    form.style.display = 'hidden';
    document.body.appendChild(form);
    form.submit();
}
*/
// funkcja wskazujaca stacje na mapie
function showPoint(id) {
	var len = layer1.features.length;
	for (var i=0; i<len; i++) {
		layer1.features[i].renderIntent = "default";
		layer1.features[i].layer.drawFeature(layer1.features[i]);
	}

   var featureArr = layer1.getFeaturesByAttribute("id", id.toString());
   var feature = featureArr[0];
   feature.renderIntent = "select";	
   feature.layer.drawFeature(feature);
   //console.log(feature);
   //console.log(layer1.features);
   
}

var httpRequest=false;

function makeRequestGet(url) {
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
    httpRequest.onreadystatechange = alertContents;
    httpRequest.open('GET', url);
    httpRequest.send();
  }

function alertContents() {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200) {
        //alert(httpRequest.responseText);
		var jsonObj = JSON.parse(httpRequest.responseText);
		//alert(jsonObj);
		json = jsonObj
		//console.log(jsonObj);
		//console.log(json);
		if (map.popups[0]) {
		map.removePopup(map.popups[0]);
		}
		addFeaturesToVector(layer1, json);
      } else {
        alert('There was a problem with the request.');
      }
    }
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

function alertContents2() {
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
		
		addFeaturesToVector(layer1, json);
      } else {
        alert('There was a problem with the request.');
      }
    }
  }
  
  
  
 function makeRequestAdd() {
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
	
	var title = encodeURIComponent(document.forms["addForm"]["title"].value);
	var street = encodeURIComponent(document.forms["addForm"]["street"].value);
	var city = encodeURIComponent(document.forms["addForm"]["city"].value);
	var lon = encodeURIComponent(document.forms["addForm"]["lon"].value);
	var lat = encodeURIComponent(document.forms["addForm"]["lat"].value);
	
    httpRequest.onreadystatechange = alertContents3;
    httpRequest.open('POST', "addPoint.php");
	httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	httpRequest.send('lon='+lon+'&lat='+lat+'&title='+title+'&street='+street+'&city='+city);
  }  

function alertContents3() {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200) {
        //alert(httpRequest.responseText);
		var jsonObj = JSON.parse(httpRequest.responseText);
		//alert(jsonObj);
		json = [jsonObj];
		console.log(jsonObj);
		console.log(json);
		addFormMsg.innerHTML = "";
		document.forms["addForm"].reset();
		if (map.popups[0]) {
		map.removePopup(map.popups[0]);
		}
		addFeaturesToVector(layer1, json);
      } else {
        alert('There was a problem with the request.');
      }
    }
  }
  

  
  function makeRequestSearch() {
	
		if (window.XMLHttpRequest) { // Mozilla, Safari, ...
      httpRequest = new XMLHttpRequest();
    } else if (window.Actisearch_stationsveXObject) { // IE
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
    httpRequest.onreadystatechange = alertContents4;
    httpRequest.open('POST', "searchStations.php");
	httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	var company = document.getElementById("search_company_name").value;
	var street = document.getElementById("search_street").value;
	var city = document.getElementById("search_city").value;
	
    httpRequest.send('company='+ company +'&street='+ street +'&city='+ city);
	
  }
  
  function alertContents4() {
    if (httpRequest.readyState === 4) {
      if (httpRequest.status === 200) {
        //alert(httpRequest.responseText);
		var jsonObj = JSON.parse(httpRequest.responseText);
		searchFormMsg.innerHTML = "";
		show_visibility('dist');
		//alert(jsonObj);
		json = jsonObj
		//console.log(jsonObj);
		//console.log(json);
		if (map.popups[0]) {
		map.removePopup(map.popups[0]);
		}
		addFeaturesToVector(layer1, json);
      } else {
        alert('There was a problem with the request.');
      }
    }
  }

  

  
 function toggle_visibility(id) {
       var e = document.getElementById(id);
       if (e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
}

 function show_visibility(id) {
       var e = document.getElementById(id);
          e.style.display = 'block';
}

function clearSelction() {
	var len = layer1.features.length;
	for (var i=0; i<len; i++) {
	layer1.features[i].renderIntent = "default";
	layer1.features[i].layer.drawFeature(layer1.features[i]);
	}
}