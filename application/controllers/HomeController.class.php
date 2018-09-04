<?php

class HomeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        session_start();
        // j'instancie le modele dont j'ai besoin, ici j'ai besoin de récupérer les repas donc new MealModel();
        $mealModel = new MealModel();
        
        // j'appelle la fonction findAll() sur le mealModel
        $results = $mealModel->findAll();
        
        // j'envoie le résultat du findAll() à la vue
        return ["results"=>$results];
    
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