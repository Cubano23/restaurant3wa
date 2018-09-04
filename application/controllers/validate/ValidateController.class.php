<?php


class ValidateController{ 
	public function httpGetMethod(Http $http, array $queryFields)
		{



		}


		public function httpPostMethod(Http $http, array $formFields)
	{
		// tu crées un orderModel
		// il sauvegarde les lignes de commande
		// il sauvegarde la commande en entier
		// renvoie à AJAX l'id de la commande


		session_start();
		$ValidateModel = new OrderModel();
		$panier = json_decode($formFields["meals"]);
		
		$TotalAmount = 0;
		
		foreach ($panier as $meal) 
		{
			 $TotalAmount += $meal->prixU*$meal->quantite;
		}
		
		
		

		$orderId = $ValidateModel->saveOrder($_SESSION["id"], $TotalAmount);

		// foreach sur panier
		foreach($panier as $meal)
		{
			$ValidateModel->saveOrderLine($orderId, $meal->quantite, $meal->prixU, $meal->id);
		}
		// pour chaque repas du panier
		// faire un saveOrderLine()
      
 		

		$http->sendJsonResponse($orderId);
	

		
	}
}



?>
