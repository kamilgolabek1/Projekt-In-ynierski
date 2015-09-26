<?php

/* @var $this yii\web\View */

$this->title = 'Virtual Guide';
?>
<div class="site-index">

    <div class="jumbotron">
<<<<<<< 6102fcc41389e1762f27871f7e59fe2a0043f42c
        <h1>Miejsce na mapę</h1>
        <ul>
            <li>
                    <button class="button nav" onclick="createPopup('addPoint2', addingPoint, true);">Add point</button>
            </li>
            <li class="current">
                    <div id="search">
                            <h2 id="searchTitle" class="button nav">Search</h2>
                            <form id="searchForm" class="form toggle" name="searchForm" action="#" onsubmit="return searchByTag()" method="post">
                                    <label for="search_tag"><span>Search</span></label>
                                    <input class="button nav" type="text" name="search_tag" id="search_tag" placeholder="Search..."/>
                                    <input class="button nav" type="submit" value="Submit"/>
                                    <h3 id="searchFormMsg"></h3>
                            </form>
                    </div>

		<div id="addPoint">
                            <h2 id="addPointTitle" class="button" onclick="toggle_visibility('addForm')">Add point</h2>
                            <form id="addForm" class="form toggle" name="addForm" action="#" onsubmit="return validateAddForm()" method="post">
                                    <label><span class="form_label">Name</span><input class="form_field"type="text" name="name"></label>
                                    <label><span class="form_label">Address</span><input class="form_field" type="text" name="addr"></label> 
                                    <label><span class="form_label">Description</span><input class="form_field"  type="text" name="descr"></label> 
                                    <label><span class="form_label">Longitude</span><input class="form_field" type="text" name="lon" readonly><button class="cordsBtn" onclick="return getCoordinates();">Get Coordinates</button></label> 
                                    <label><span class="form_label">Latitude</span><input class="form_field" type="text" name="lat" readonly></label>
                                    <label><span class="form_label">Zoom</span><input class="form_field" type="text" name="zoom" readonly></label>
                                    <label><span class="form_label">Category</span><input class="form_field" type="text" name="cat"></label>
                                    <input type="submit" value="Submit"/>
                                    <h3 id="addFormMsg"></h3>
                            </form>
                                                    <div id="search_result"></div>
                                                    </li>

                                            </ul>
                    <section id="banner">
                                            <div id="mapOL" class="smallmap"></div>
                                            <div id="divList">Divlist</div>
                                            <div id="generalinfo"></div>
        <div id="info"></div>


                            </section>

</div>
=======
        <!-- <h1>Miejsce na mapę</h1> -->
				<ul>
							<li>
								<button class="button nav" onclick="createPopup('addPoint2', addingPoint, true);">Add point</button>
							</li>
							<li class="current">
								<div id="search">
									<h2 id="searchTitle" class="button nav">Search</h2>
									<form id="searchForm" class="form toggle" name="searchForm" action="#" onsubmit="return searchByTag()" method="post">
										<label for="search_tag"><span>Search</span></label>
										<input class="button nav" type="text" name="search_tag" id="search_tag" placeholder="Search..."/>
										<input class="button nav" type="submit" value="Submit"/>
										<h3 id="searchFormMsg"></h3>
									</form>
								</div>
								
								<div id="addPoint">
				<h2 id="addPointTitle" class="button" onclick="toggle_visibility('addForm')">Add point</h2>
				<form id="addForm" class="form toggle" name="addForm" action="#" onsubmit="return validateAddForm()" method="post">
					<label><span class="form_label">Name</span><input class="form_field"type="text" name="name"></label>
					<label><span class="form_label">Address</span><input class="form_field" type="text" name="addr"></label> 
					<label><span class="form_label">Description</span><input class="form_field"  type="text" name="descr"></label> 
					<label><span class="form_label">Longitude</span><input class="form_field" type="text" name="lon" readonly><button class="cordsBtn" onclick="return getCoordinates();">Get Coordinates</button></label> 
					<label><span class="form_label">Latitude</span><input class="form_field" type="text" name="lat" readonly></label>
					<label><span class="form_label">Zoom</span><input class="form_field" type="text" name="zoom" readonly></label>
					<label><span class="form_label">Category</span><input class="form_field" type="text" name="cat"></label>
					<input type="submit" value="Submit"/>
					<h3 id="addFormMsg"></h3>
				</form>
							<div id="search_result"></div>
							</li>
				
						</ul>
			<section id="banner">
						<div id="mapOL" class="smallmap"></div>
						<div id="divList">Divlist</div>
						<div id="generalinfo"></div>
            <div id="info"></div>
					

				</section>
        
    </div>
>>>>>>> 9ad43ddc0781c9c7dff1360525865ae2209b741c

    <div class="body-content">

        <div id="infoBox" class="infoBox"></div>

    </div>
</div>
