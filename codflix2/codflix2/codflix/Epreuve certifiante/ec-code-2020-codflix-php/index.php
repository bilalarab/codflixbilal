<?php

require_once( 'controller/homeController.php' );
require_once( 'controller/loginController.php' );
require_once( 'controller/signupController.php' );
require_once( 'controller/mediaController.php' );
require_once( 'controller/userController.php' );

/**************************
* ----- HANDLE ACTION -----
***************************/

if ( isset( $_GET['action'] ) ):

  switch( $_GET['action']):

    case 'login':

      if ( !empty( $_POST ) ) login( $_POST );
      else loginPage();

    break;

    case 'signup':

      Signup();

    break;

    case 'logout':

      logout();

    break;

    case 'getapi':

      getapi();

    break;

    case 'infomedia':

      infomedia();

    break;

    case 'contact':

      contact();

    break;

    case 'profile':

      profile();

    break;

    case 'changemail':

      changeMail();

    break;

    case 'changepassword':

      changePassword();

    break;
    
    case 'delete':

      deleteUser();

    break;


  endswitch;

else:

  $user_id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;

  if( $user_id ):
    mediaPage();
  else:
    homePage();
  endif;

endif;
