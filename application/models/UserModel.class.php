<?php
class UserModel{

	function insertUser($formFields){

		$database = new Database();

		$query = "INSERT INTO user (firstName, lastName, email, password, birthDate, address, city, zipCod, country, phone, creationTimeStamp, lastLoginTimeStamp) VALUES (?,?,?,?,?,?,?,?,?,?,NOW(),NOW())";


		return $database->executeSql($query,[$formFields["firstName"],$formFields["lastName"],$formFields["email"],$formFields["password"],$formFields["birthDate"],$formFields["address"],$formFields["city"],$formFields["zipCod"],$formFields["country"],$formFields["phone"]]
			);

	}

	function loginUser($email, $password){
		$database = new Database();

		$query = "SELECT * FROM user WHERE email = ? and password = ?";


		return $database->queryOne($query, [$email, $password]);
	}



	
} 

?>