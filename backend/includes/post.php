<?php require_once "class.php";
if(!empty($_POST)){
	$user = new demo;
	$user->insert($_POST['cutname'],$_POST['summary'],$_POST['review'],$_POST['satisfication']);
}
