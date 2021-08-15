<?php
session_start();
$_SESSION['loged_in'] = isset($_SESSION['loged_in']) ? $_SESSION['loged_in'] : false;
$config = array(
  'host' => 'localhost',
  'username' => 'root',
  'password' => '',
  'database' => 'smkn420mitim'
);

$sql = new PDO(
	"mysql:host=$config[host]; dbname=$config[database]",
	$config['username'],
	$config['password']
);

$rows = [];
$name_regex = '^[A-Za-z0-9_\-]+$';


function valid_username($name) {
  global $name_regex;
  return (
    strlen($name) > 0 &&
    strlen($name) <= 20 &&
    preg_match("/$name_regex/", $name) === 1
  );
}
?>