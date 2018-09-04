<?php 

class OrderModel{




function saveOrderLine($Orders_id, $QuantityOrdered, $salePrice, $Meal_id){
			// sauvegardera les lignes de commande

		

		$database = new Database();

		$query = "INSERT INTO orderLine (quantityOrdered, meal_id, order_id, priceEach)
			VALUES (?,?,?,?)";


		return $database->executeSql($query, [intval($QuantityOrdered), $Meal_id,$Orders_id,  $salePrice ] );
	}



	function saveOrder($User_id, $TotalAmount){
			// sauvegarde la commande

			

			$database = new Database();

			$query = "INSERT INTO orders 
				  ( user_id, totalAmount, creationTimeStamp, completeTimeStamp)
				  VALUES (?,?,NOW(),NOW())";


		// le fait de return un executeSql de la derniere chose insérée sur la base
		return $database->executeSql($query, [$User_id, $TotalAmount]);
	}


	function findOneOrder($order_id)
	{

		$database = new Database();
		$query = "SELECT * FROM orders 
				 WHERE id=?";

		return  $database->queryOne($query, [$order_id]);
		 

	}



	function findOrderMeals($order_id)
	{

		$database = new Database();

		$query = "SELECT photo, description, quantityOrdered, salePrice FROM orderLine
				 INNER JOIN meal ON meal.id = orderLine.meal_id  
				 WHERE order_id=?";


		return  $database->query($query,[$order_id]);
		// requete pour trouver TOUT les repas de UNE commande (celle spécifiée par l'id)
		// query pqe tu veux TOUT les repas
		// renvoie le resultat
	}




}



?>