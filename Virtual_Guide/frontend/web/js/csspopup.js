function toggle_visibility(id) {
       var e = document.getElementById(id);
       if (e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
}


function window_pos(popUpDivVar) {
	//console.log("wywolano window_pos");
	if (typeof window.innerWidth != 'undefined') {
		viewportwidth = window.innerHeight;
	} else {
		viewportwidth = document.documentElement.clientHeight;
	}
	if ((viewportwidth > document.body.parentNode.scrollWidth) && (viewportwidth > document.body.parentNode.clientWidth)) {
		window_width = viewportwidth;
	} else {
		if (document.body.parentNode.clientWidth > document.body.parentNode.scrollWidth) {
			window_width = document.body.parentNode.clientWidth;
		} else {
			window_width = document.body.parentNode.scrollWidth;
		}
	}
	var popUpDiv = document.getElementById(popUpDivVar);
	window_width=window_width/2-225;//150 is half popup's width
	//console.log("window_width/2: "+window_width);
	popUpDiv.style.left = window_width + 'px';
	//console.log("popup.style.left: "+popUpDiv.style.left);
}

function createPopupMask() {

	var fullHeight = getViewportHeight();
	var fullWidth = getViewportWidth();

	var overlay = document.createElement('div');
	overlay.id = 'popupMask';
	overlay.className = "dark_overlay";
	overlay.style.height = fullHeight + 'px';
	overlay.style.width = fullWidth + 'px';
	//overlay.style.display = 'none';
	document.body.appendChild(overlay);
	
	
}
createPopupMask();



function createPopup(container, func, overlay) {
	
		var fullHeight = getViewportHeight();
		var fullWidth = getViewportWidth();
						
		if ( overlay === true ) {
			toggle_visibility('popupMask');
		}
		
		var infoBox = document.getElementById('infoBox');
		
		if (infoBoxStatus == 1) {
			toggle_visibility('infoBox');
			infoBoxStatus ^= 1;
		}

		addEvent(window, "resize", centerPopup);
		addEvent(window, "resize", function(){var cont=container; window_pos(cont)});

		func();
		
		
	window_pos(container);
	
		
}


	function centerPopup() {
		//var container = document.getElementById(cont);
		var fullHeight = getViewportHeight();
		var fullWidth = getViewportWidth();
		console.log(fullWidth+ " "+fullHeight);
		//var width = container.offsetWidth;
		//var height = container.offsetHeight;
		
		var overlay = document.getElementById('popupMask');
		overlay.style.width = fullWidth + 'px';
		overlay.style.height = fullHeight + 'px';
		//container.className = ('black_overlay');
		/*container.style.height = fullHeight + "px";
		container.style.width = fullWidth + "px";
		container.style.top = scTop + "px";
		container.style.left = scLeft + "px";
		
		var scLeft,scTop;
		if (self.pageYOffset) {
			scLeft = self.pageXOffset;
			scTop = self.pageYOffset;
		} else if (document.documentElement && document.documentElement.scrollTop) {
			scLeft = document.documentElement.scrollLeft;
			scTop = document.documentElement.scrollTop;
		} else if (document.body) {
			scLeft = document.body.scrollLeft;
			scTop = document.body.scrollTop;
		} 
		//container.style.position = 'fixed';
		
		
		var topMargin = scTop;
		if (topMargin < 0) { topMargin = 0; }
		container.style.top = topMargin + "px";
		container.style.left =  scLeft + "px";
		*/
		}


/**
 * X-browser event handler attachment and detachment
 * @argument obj - the object to attach event to
 * @argument evType - name of the event - DONT ADD "on", pass only "mouseover", etc
 * @argument fn - function to call
 */
function addEvent(obj, evType, fn){
 if (obj.addEventListener){
    obj.addEventListener(evType, fn, false);
    return true;
 } else if (obj.attachEvent){
    var r = obj.attachEvent("on"+evType, fn);
    return r;
 } else {
    return false;
 }
}

/**
 * Code below taken from - http://www.evolt.org/article/document_body_doctype_switching_and_more/17/30655/ *
 * Modified 4/22/04 to work with Opera/Moz (by webmaster at subimage dot com)
 * Gets the full width/height because it's different for most browsers.
 */		
function getViewportHeight() {
	if (window.innerHeight != window.undefined)
		return window.innerHeight;
	if (document.compatMode == 'CSS1Compat')
		return document.documentElement.clientHeight;
	if (document.body)
		return document.body.clientHeight;
	return window.undefined;
}

function getViewportWidth() {
	if (window.innerWidth != window.undefined)
		return window.innerWidth;
	if (document.compatMode == 'CSS1Compat')
		return document.documentElement.clientWidth;
	if (document.body)
		return document.body.clientWidth;
	return window.undefined;
}

function addingPoint() {
	var addPoint = document.getElementById('addPoint');
	addPoint.style.position = 'absolute';
	addPoint.style.zIndex = 1205;
	addPoint.style.display = 'block';
	document.getElementById("addForm").reset();
	
	var old_element = document.getElementById('popupMask');
	var new_element = old_element.cloneNode(true);
	
	old_element.parentNode.replaceChild(new_element, old_element);
	var overlay = document.getElementById('popupMask');
	
	//overlay.addEventListener('click', function() {
		//toggle_visibility('popupMask');
		//toggle_visibility('addPoint');
	//	}, false);
	
	}