'use strict';

/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////

$("#selected-meal").on('change', selectedMeal);
	$.getJSON(getRequestUrl()+"/meal?id=1", onReturnMealAjax);

function selectedMeal(){

	var mealId = $("#selected-meal option:selected").val();

	$.getJSON(getRequestUrl()+"/meal?id="+mealId, onReturnMealAjax);
}

var currentMealId;

function onReturnMealAjax(data){
	var description = $("#description");
	var image = $("#image");
	var prix = $("#prix");
	currentMealId = data.id;
	description.text(data.description);
	prix.text(data.salePrice);
	console.log(image);
	image.attr("src",getWwwUrl()+"/images/meals/"+data.photo);

}

// ctte ligne va chopper dans le localStorage le panier enregistré
var tableauAdd = JSON.parse(localStorage.getItem("meals"));

// si c'est null, je crée un tableau vide
if (tableauAdd == null){
	tableauAdd = [];
}

display();
	

 function display(){
 	$("#tableauCommande").empty();
 	for(var product of tableauAdd){
 		var tr = $("<tr>");
		var td1 = $("<td>");
		var td2 = $("<td>");
		var td3 = $("<td>");
		var td4 = $("<td>");
		$("#tableauCommande").append(tr);


		tr.append(td1);
		tr.append(td2);
		tr.append(td3);
		tr.append(td4);

		td1.text(product.product);
		td2.text(parseFloat(product.quantite));
		td3.text(product.prixU);
		td4.text(product.prixT);
 	}
 }

function  displayOrder(){

	var product = $('#selected-meal option:selected').text();
	var quantite = $("#quantite").val();
	var prixU = $("#prix").text();	
	var prixT = prixU * quantite;


	var tableau = new Object(); 
	tableau.product = product;
	tableau.quantite = quantite;
	tableau.prixU = prixU;
	tableau.prixT = prixT;
	tableau.id = currentMealId;
	var tr = $("<tr>");
	var td1 = $("<td>");
	var td2 = $("<td>");
	var td3 = $("<td>");
	var td4 = $("<td>");

	
	$("#tableauCommande").append(tr);


	tr.append(td1);
	tr.append(td2);
	tr.append(td3);
	tr.append(td4);

	td1.text(product);
	td2.text(parseFloat(quantite));
	td3.text(prixU);
	td4.text(prixT);


	 // j'ajoute a mon tableau des repas, le repas selectionné par l'option
	  tableauAdd.push(tableau);
	  // je stocke dans mon localStorage mon tableau du repas, me permettra de recharger mon panier
	  // localStorage n'accepte que JSON, je stringify (je transforme en chaine de caractere le tableau) 
	  window.localStorage.setItem("meals", JSON.stringify(tableauAdd));
}

function clearStorage(){
	// tableauAdd = [];
	// 	  window.localStorage.setItem("meals", JSON.stringify(tableauAdd));

	localStorage.clear();	
}	

// cette fonction doit envoyer tout nos repas (le contenu de la commande) vers un controlleur php
// pour que le controlleur l'enregistre sur la BDD
function validateOrder(){
	

	var data = {"meals" : JSON.stringify(tableauAdd)};
	// ca envoie le contenu du tableau mealTab a un controller qui s'appelle validate
	$.post(getRequestUrl()+"/validate", data, onReturnValidation);
	console.log(tableauAdd);
	
}


function onReturnValidation(order_id){
	window.location.assign(getRequestUrl()+"/recap?order_id="+JSON.parse(order_id));
}
function onPayment(){
	window.location.assign(getRequestUrl()+"/payment");

}






  
  
  

/////////////////////////////////////////////////////////////////////////////////////////
// CODE PRINCIPAL                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////
   
   $('#validate').on('click', validateOrder);
   $('#ajouter').on('click', displayOrder);
   $('#cancel').on('click', clearStorage);
   $('#logout').on('click', clearStorage);
   $('#payer').on('click', onPayment);





   /////////////////////////////////////////////////////////********************************/////////////////////////////////



