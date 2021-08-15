<?php
header('Content-Type: application/json');
require 'modules/connect.php';
if($_SESSION['loged_in']) die();
if(isset($_POST['username']) && (valid_username($_POST['username'])) && isset($_POST['password']) && strlen($_POST['password'])) {
	$login = $sql->prepare('SELECT `username`, `password` FROM `users` where `username` = ?');
	$login->bindParam(1, $_POST['username']);
	$login->execute();
	$login = $login->fetch();

	if($login && password_verify($_POST['password'], $login[1])) {
		$_SESSION['loged_in'] = true;
		$_SESSION['username'] = $login[0];
		$resp['message'] = 'login berhasil';
	} else {
		$resp['message'] = 'username atau password salah';
	}
	$resp['success'] = $_SESSION['loged_in'];
	echo json_encode($resp);
}
?>