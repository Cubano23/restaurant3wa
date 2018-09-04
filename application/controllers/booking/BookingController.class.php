<?php

class BookingController {

    public function httpGetMethod(Http $http, array $queryFields)
    {



    }

    public function httpPostMethod(Http $http, array $formFields)
    {

        
        $BookingModel = new BookingModel();

        $BookingModel->booktable($formFields["BookingDate"], $formFields["BookingTime"], $formFields["NumberOfSeats"]);
       
     
        $http->redirectTo("/");
    }


}
?>