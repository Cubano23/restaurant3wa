<?php 

class LoginController{
	  public function httpGetMethod(Http $http, array $queryFields)
    {
     
    
    }

    public function httpPostMethod(Http $http, array $formFields)
    {

    	$login = new UserModel();
    	$user = $login->loginUser($formFields["email"], $formFields["password"]);

        if ($user == null){
            echo "<h3>***Identifiants incorrects***</h3>";
        }else{
            session_start();
            $_SESSION["id"] = $user["id"];
            $_SESSION["name"] = $user["firstName"]." ".$user["lastName"];
            $_SESSION["address"] = $user["address"];
            $_SESSION["zipCod"] = $user["zipCod"];
            $_SESSION["country"] = $user["country"];
            $http->redirectTo("/");
        }
    	
    	
    }
}



?>
