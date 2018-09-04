<?php


class BookingModel{


    function booktable($bookingdate, $bookingtime, $numberofseats) {

        session_start();

        $database = new Database();

        $query = "INSERT INTO booking (user_id,bookingDate,bookingTime,numberOfSeats, creationTimeStamp)
               VALUES (?,?,?,?,NOW())";

        $database->executeSql($query, [$_SESSION["id"],$bookingdate, $bookingtime, $numberofseats]);

    }
}