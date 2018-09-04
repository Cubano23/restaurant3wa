<?php 


class RecapController{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        session_start();
        $RecapId = $queryFields["order_id"];
        $RecapModel = new OrderModel();

        $RecapFoundOne = $RecapModel->findOneOrder($RecapId);

        $RecapFoundMeals = $RecapModel->findOrderMeals($RecapId);


       

        return ["RecapFoundOne"=>$RecapFoundOne,"RecapFoundMeals"=>$RecapFoundMeals];




        

    }
}
