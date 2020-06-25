<?php

require_once( 'database.php' );

class User {

  protected $id;
  protected $email;
  protected $password;

  public function __construct( $user = null ) {

    if( $user != null ):
      $this->setId( isset( $user->id ) ? $user->id : null );
      $this->setEmail( $user->email );
      $this->setPassword( $user->password, isset( $user->password_confirm ) ? $user->password_confirm : false );
    endif;
  }

  /***************************
  * -------- SETTERS ---------
  ***************************/

  public function setId( $id ) {
    $this->id = $id;
  }

  public function setEmail( $email ) {

    if ( !filter_var($email, FILTER_VALIDATE_EMAIL)):
      throw new Exception( 'Email incorrect' );
    endif;

    $this->email = $email;

  }

  public function setPassword( $password, $password_confirm = false ) {

    $this->password = $password;
  }

  /***************************
  * -------- GETTERS ---------
  ***************************/

  public function getId() {
    return $this->id;
  }

  public function getEmail() {
    return $this->email;
  }

  public function getPassword() {
    return $this->password;
  }

  /***********************************
  * -------- CREATE NEW USER ---------
  ************************************/

  public function createUser() {

    // Open database connection
    $db   = init_db();

    // Check if email already exist
    $req  = $db->prepare( "SELECT * FROM user WHERE email = ?" );
    $req->execute( array( $this->getEmail() ) );

    if( $req->rowCount() > 0 ) throw new Exception( "Email ou mot de passe incorrect" );

    // Insert new user
    $req->closeCursor();

    $req  = $db->prepare( "INSERT INTO user ( email, password ) VALUES ( :email, :password )" );
    return $req->execute( array(
      'email'     => $this->getEmail(),
      'password'  => $this->getPassword()
    ));

    // Close databse connection

  }

  /**************************************
  * -------- GET USER DATA BY ID --------
  ***************************************/

  public  function getUserById( $id ) {

    // Open database connection
    $db   = init_db();

    $req  = $db->prepare( "SELECT * FROM user WHERE id = ?" );
    $req->execute( array( $id ));

    // Close databse connection
    $db   = null;

    return $req->fetch();
  }

  /***************************************
  * ------- GET USER DATA BY EMAIL -------
  ****************************************/

  public function getUserByEmail() {

    // Open database connection
    $db   = init_db();

    $req  = $db->prepare( "SELECT * FROM user WHERE email = ?" );
    $req->execute( array( $this->getEmail() ));

    // Close databse connection
    $db   = null;

    return $req->fetch();
  }
  public function changeMail()
{
  $db   = init_db();

    $req  = $db->prepare( "UPDATE user SET email = :newemail WHERE email = :email" );
    $req->execute( array( ":email" => $this->getEmail(), ":newemail" => $_POST["newemail"] ));

    // Close databse connection
    $db   = null;
    $_SESSION["user_email"] = $_POST["newemail"];
    return $req->fetch();
}

public function changePassword()
{
  $db   = init_db();

    $req  = $db->prepare( "UPDATE user SET password = :password WHERE email = :email" );
    $req->execute( array( ":email" => $this->getEmail(), ":password" => $_POST["newpassword"] ));

    // Close databse connection
    $db   = null;

    return $req->fetch();
}

public function Delete()
{
  $db   = init_db();

    $req  = $db->prepare( "DELETE FROM user WHERE email = :email" );
    $req->execute( array( ":email" => $this->getEmail()));

    // Close databse connection
    $db   = null;

    return $req->fetch();
}

}


