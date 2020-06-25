<?php

require_once( 'model/user.php' );

/****************************
* ----- LOAD SIGNUP PAGE -----
****************************/

function signupPage() {

  $user     = new stdClass();
  $user->id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;

  if( !$user->id ):
    require('view/auth/signupView.php');
  else:
    require('view/homeView.php');
  endif;

}

/***************************
* ----- SIGNUP FUNCTION -----
***************************/
function Signup()
{
  if (isset($_POST["email"]) && isset($_POST["password_confirm"]) && isset($_POST["password"])) {
    if(preg_match("/^\S+@\S+\.\S+$/", $_POST["email"]) && $_POST["password_confirm"] == $_POST["password"]) {
      $data     = new stdClass();
      $data->email = $_POST["email"];
      $data->password = $_POST["password"];

      $user = new User($data);
      $user->createUser();

    }
  }
  signupPage();
}