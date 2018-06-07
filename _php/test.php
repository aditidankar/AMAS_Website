<?php

    require('phpDBConnect.php');
    
    //if($_POST['generatecode']){
    ini_set( 'display_errors', 1 );
    error_reporting( E_ALL );
    $from = "test@hostinger-tutorials.com";
    $email="aditidankar@gmail.com";   //$_Post['emailIDstud'];
    //$subject = "OTP Verification";
    $subject = "Registration Process";
    $otp = rand(100000,999999);
    $_SESSION['otp'] = $otp;
    //$url= " https://document-manager.000webhostapp.com/register.php";
    $message = "Hi prabhumegha30@gmail.com,
    
    Welcome to Personal Document Manager and thank you for choosing to register with us.
    
    Please click on the following link to confirm your registration.  "  .$otp;  
     
    
    $headers = "From:" . $from;
    
    mail($email,$subject,$message, $headers);
   // echo "The email message was sent.";
   // }
    
    //if($_POST['verifycode']){
    //if($_Post['emailIDVerificationStud']!=$_SESSION['otp']){
     //echo "Incorrect code";
  // }
    //}
?>