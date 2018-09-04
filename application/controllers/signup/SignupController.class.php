<?php 

class SignupController{
	  public function httpGetMethod(Http $http, array $queryFields)
    {
     
    
    }

    public function httpPostMethod(Http $http, array $formFields)
    {

    	$user = new UserModel();
    	$user->insertUser($formFields);
    	$http->redirectTo("/");
    	
    }
}



?>
