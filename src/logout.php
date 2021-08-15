<?php
session_start();
if(isset($_SESSION['loged_in']) && $_SESSION['loged_in'])
	$_SESSION['loged_in'] = false;
?>