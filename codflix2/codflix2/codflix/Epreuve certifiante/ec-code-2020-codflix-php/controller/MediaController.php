<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD HOME PAGE -----
***************************/

function mediaPage() {

  $search = isset( $_GET['name'] ) ? $_GET['name'] : null;
  $medias = Media::filterMedias( $search );

  require('view/mediaListView.php');

}


function getapi() {

  require('view/getapi.php');

}


function infomedia() {

  if(isset($_GET['media'])) {
    $media = Media::GetMedia($_GET['media']);
    require('view/infomedia.php');
  } else {
    require('view/mediaListView.php');
  }
}


function contact() {

  require('view/contact.php');

}
function profile() {

  require('view/profile.php');

}