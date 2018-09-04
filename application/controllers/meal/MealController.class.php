<?php

class MealController{
	 public function httpGetMethod(Http $http, array $queryFields)
    {
    	$id = $queryFields["id"];
    	// new MealModel
    	$mealModel = new MealModel();
    	// appelle la fonction findOne
    	$results = $mealModel->findOne($id);

    	 $http->sendJsonResponse($results);
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}

?>