<?php

require_once( 'model/user.php' );


function changeMail(  ) {

    $data           = new stdClass();
    $data->email    = $_SESSION['user_email'];
    $data->password    = $_SESSION['user_email'];

    $user           = new User( $data );
    $userData       = $user->changeMail();

  
    require('view/profile.php');
  }

  function changePassword(  ) {

    $data           = new stdClass();
    $data->email    = $_SESSION['user_email'];
    $data->password    = $_SESSION['user_email'];

    $user           = new User( $data );
    //$userData       = $user->changePassword();

    }

  function DeleteUser(  ) {

    $data           = new stdClass();
    $data->email    = $_SESSION['user_email'];
    
    $user           = new User( $data );
    $userData       = $user->Delete();

    session_destroy();
    require('view/auth/loginView.php');
  }