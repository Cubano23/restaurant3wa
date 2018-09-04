<?php 

class MealModel{

		function findAll(){
    		// des que vous voulez faire une action sur la BDD, new Database();
    		$database = new Database();
	        // j'écris la requete SQL en chaine de caractères
	        $query = "SELECT * FROM meal";
	        // j'appelle la fonction query contenu dans l'objet database, cette fonction est l'équivalent de Fetch_All
	        return $database->query($query);
	    }

	    function findOne($id){
	    	// requete SQL qui va chercher le repas WHERE id = ?
	    	// return le résultat
	    	$database = new Database();

	    	$query = "SELECT * FROM meal WHERE id = ?";

	    	return $database->queryOne($query,[$id]);


	    }
}



?>