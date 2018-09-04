<?php

class OrderController{

    public function httpGetMethod(Http $http, array $queryFields)
    {
         session_start();
         $mealModel = new MealModel();
    	 $results = $mealModel->findAll();
        
        // j'envoie le résultat du findAll() à la vue
        return ["results"=>$results];
    

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        session_start();
        $mealModel = new MealModel();        
        $mealModel->$results = $mealModel->findOne($formFields["Id"]);
        return ["results"=>$results];
        

   
    }


}
?>


