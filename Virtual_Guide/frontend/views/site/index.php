<?php

/* @var $this yii\web\View */
use yii\widgets\ActiveForm;
use app\assets\IndexAssetBundle;
IndexAssetBundle::register($this);

$this->title = 'Wirtualny Przewodnik';
$this->params['fluid'] = true;
$this->params['fullscreen'] = true;
$this->registerCss(".container-fluid {padding: 0;}");
?>

<div class="site-index">

    
        <!-- Miejsce na mapę -->
		<div id="map" class="olMap"></div>
						
					
		<div id="panel">
			<div class="panel-visible">
				
				<div class="panel-toggle-button-container">
					<button class="panel-toggle-button"><span class="glyphicon glyphicon-chevron-left"></span></button>
				</div>
				<div class="panel-content">
					<div class="panel-content-holder tab-content">	
						
						<ul id="navTabs" class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation" class="disabled"><a href="#infoBox" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-file"></span> Opis</a></li>
							<li role="presentation"><a href="#addPoint" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-plus"></span> Dodawanie</a></li>
							<li role="presentation" class="active"><a href="#searchPoint" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-search"></span> Wyszukiwanie</a></li>
						</ul>
						
						<div id="infoBox" class="panel-section-infobox tab-pane" role="tabpanel">
						
							
							<div id="infoDescrBox" class="panel-section-infobox-item panel-section-infobox-description-container">
								<h2 class="panel-section-infobox-item-label"><span class="glyphicon glyphicon-chevron-right"></span> Tu jest nazwa</h2>
								<p id="infoCords" class="panel-section-infobox-coordinates">Tu są współrzędne</p>
								<p id="infoDescr" class="panel-section-infobox-description">Tu jest opis</p>
							</div>
							
							
							<div id="infoCommBox" class="panel-section-infobox-item panel-section-infobox-comments-container">
								<h2 class="panel-section-infobox-item-label"><span class="glyphicon glyphicon-chevron-right"></span> Komentarze</h2>
								<?php if (!Yii::$app->user->isGuest) {
									echo '
								<form id="addCommentForm" class="form-horizontal" name="addCommentForm" action="#" method="post">
									<div class="form-group">
										<label class="sr-only" for="addCommentInput">Komentarz</label>
										<div class="col-sm-12">
											<textarea id="addCommentInput" class="form-control" rows="1" name="comment" placeholder="Dodaj komentarz"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="sr-only" for="addCommentInput">Komentarz</label>
										<div class="col-sm-12">
											<input class="btn btn-default btn-sm" id="addCommentSubmitBtn" type="submit" value="Dodaj komentarz"/>
										</div>
									</div>
								</form>';
								}?>
								<ul id="commentsList" class="panel-section-infobox-comments-list"><li>Tu są komentarze</li></ul>
								<div id="commPaginationContainer"  class="pagination-links">
									<div class="pagination-links-left">
										<span class="glyphicon glyphicon-menu-left"></span><a href="#" id="commentsMore"> Poprzednie</a>
									</div>
									<div class="pagination-links-right">
										<a href="#" id="commentsLess">Następne </a><span class="glyphicon glyphicon-menu-right"></span>
									</div>
								</div>
							</div>
							
							
							<div id="infoPicsBox" class="panel-section-infobox-item panel-section-infobox-pictures-container">
								<h2 class="panel-section-infobox-item-label"><span class="glyphicon glyphicon-chevron-right"></span> Zdjęcia</h2>
								
								<div id="addPicture">
								<!-- Formularz 'Dodaj zdjęcie' -->
								<?php if (!Yii::$app->user->isGuest) {
									echo '
									<form id="addPictureForm" class="form" name="addPictureForm action="#" method="post" enctype="multipart/form-data">
										<input type="hidden" name="'.Yii::$app->request->csrfParam.'" value="'.Yii::$app->request->csrfToken.'">
										<input type="hidden" name="id" value="0" />
										<div class="form-group field-uploadform-imagefile">
											<label class="control-label" for="file5"/>
											<input type="hidden" name="UploadForm[imageFile]" value="">
											<input type="file" id="file2" name="UploadForm[imageFile]">
										</div>
										<button class="btn btn-primary btn-sm">Dodaj zdjęcie</button>
									</form>	
									<div id="addPictureFormMsg"></div>';
								}?>
								</div>
								
								
								<ul id="picsList" class="panel-section-infobox-pictures-list"><li>Tu są zdjęcia</li></ul>
								<div id="picsPaginationContainer" class="pagination-links">
									<div class="pagination-links-left">
										<span class="glyphicon glyphicon-menu-left"></span><a href="#" id="picsMore"> Poprzednie</a>
									</div>
									<div class="pagination-links-right">
										<a href="#" id="picsLess">Następne </a><span class="glyphicon glyphicon-menu-right"></span>
									</div>
								</div>
							</div>
						</div>
					
					
						<div id="addPoint"  class="panel-section-addform-container tab-pane" role="tabpanel">
							<?php if (!Yii::$app->user->isGuest) {
										echo '
							<h2 id="addPointTitle" class="panel-section-addform-label"><span class="glyphicon glyphicon-chevron-right"></span> Dane nowej lokalizacji</h2>
							<!-- Formularz Dodaj punkt -->
							<form id="addPointForm" class="form form-horizontal form-group" name="addPointForm" action="#" method="post" enctype="multipart/form-data">
								<input type="hidden" name="'.Yii::$app->request->csrfParam.'" value="'.Yii::$app->request->csrfToken.'">   

								<div class="form-group">
								<label class="col-sm-3 control-label" for="addPointForm-image"><span class="form-label">Zdjęcie</span></label>
									<div class="col-sm-9 field-uploadform-imagefile">
										<input type="hidden" name="UploadForm[imageFile]" value="">
										<input type="file" id="addPointForm-image" name="UploadForm[imageFile]">
										<div id="addPicsFormMsg"></div>
									</div>						    
								</div>

							    <div class="form-group">
									<label class="col-sm-3 control-label" for="addPointForm-name"><span class="form-label">Nazwa</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="name" id="addPointForm-name">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="addPointForm-addr"><span class="form-label">Adres</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="addr" id="addPointForm-addr">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="addPointForm-descr"><span class="form-label">Opis</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm"  type="text" name="descr" id="addPointForm-descr"> 
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="addPointForm-tag"><span class="form-label">Tag</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="tag" id="addPointForm-tag">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="addPointForm-cat><span class="form-label">Kategoria</span></label>
									<div class="col-sm-9">
										<select class="form-control input-sm" id="addPointForm-cat">';?>
										<?php foreach($categories as $cat){ ?>
											<option name="<?php echo $cat->name?>" value="<?php echo $cat->ID?>"><?php  echo $cat->name?></option>
										<?php }?>
										<?php echo '
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">
										<button class="cordsBtn btn btn-default btn-sm" onclick="return getCoordinates();">Pobierz współrzędne</button>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span class="form-label">Długość</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="lon" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span class="form-label">Szerokość</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="lat" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span class="form-label">Zoom</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="zoom" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"><span class="form-label">Kraj</span></label>
									<div class="col-sm-9">
										<select class="form-control input-sm">';?>
										<?php foreach($countries as $country){ ?>
											<option name="<?php echo $country->country_name?>" value="<?php echo $country->ID?>"><?php  echo $country->country_name?></option>
										<?php }?>
										<?php echo '
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">	
										<button id="addPointSubmitBtn" class="btn btn-primary btn-sm">Dodaj lokalizację</button>
										<button id="addPointResetBtn" class="btn btn-sm">Wyczyść</button>
									</div>
								</div>
							</form>		
							<div id="addPointFormMsg"></div>';
							} else {
								echo '<h2 id="addPointTitle" class="panel-section-addform-label"><span class="glyphicon glyphicon-chevron-right"></span> Zaloguj się, aby dodać lokalizację</h2>';
							}?>
							
						</div>
						
						<div id="searchPoint"  class="panel-section-searchform-container tab-pane active" role="tabpanel">
							<h2 id="searchPointTitle" class="panel-section-searchform-label"><span class="glyphicon glyphicon-chevron-right"></span> Kryteria wyszukiwania lokalizacji</h2>						
							<form id="searchPointForm" class="form-horizontal" name="searchPointForm" action="#" method="post">
								<div class="form-group">
									<label class="col-sm-3 control-label"><span class="form-label">Kraj</span></label>
									<div class="col-sm-9">
										<select class="form-control input-sm" name="country">
										<?php foreach($countries as $country){ ?>
											<option name="<?php echo $country->country_name?>" value="<?php echo $country->ID?>"><?php  echo $country->country_name?></option>
										<?php }?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="searchPointForm-cat><span class="form-label">Kategoria</span></label>
									<div class="col-sm-9">
										<select class="form-control input-sm" id="searchPointForm-cat" name="category">
										<?php foreach($categories as $cat){ ?>
											<option name="<?php echo $cat->name?>" value="<?php echo $cat->ID?>"><?php  echo $cat->name?></option>
										<?php }?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="searchPointForm-tag"><span class="form-label">Tag</span></label>
									<div class="col-sm-9">
										<input class="form-field form-control input-sm" type="text" name="tag" id="searchPointForm-tag" placeholder="-- opcjonalnie --">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-9">	
										<button id="searchSubmitBtn" class="btn btn-primary btn-sm">Szukaj</button>
										<button id="searchResetBtn" class="btn btn-sm">Wyczyść</button>
									</div>
								</div>
							</form>
						
						</div>
						
					</div>
				</div>
			</div>
	
			
		</div>
		
		<div id="custom-menu-container">
			<ul class="custom-menu">
				<?php if (!Yii::$app->user->isGuest) {
				echo '
				<li id="firstCustomMenuOption">Dodaj lokalizację</li>
				<li id="secondCustomMenuOption">Dodaj lokalizację tutaj</li>';
				}?> 
				<li id="thirdCustomMenuOption">Szukaj lokalizacji</li>
			</ul>
		</div>
		
<div id="divList">Divlist</div>
<div id="generalinfo"></div>
<div id="info"></div>