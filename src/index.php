<?php
require 'modules/connect.php';
$title = ['SMKN 420 Bumi Timur ( MitiM )', 'SMKn 420 MitiM'];
$menus = [$_SESSION['loged_in'] ? 'user' : 'login', 'fasilitas', 'kelas', 'prestasi'];
$achievements = $sql->query('SELECT * FROM `achievements`');
$classes = $sql->query('
SELECT
	`class`, `short_name`, `long_name`, `total`
FROM `classes`
JOIN `list_majors`
ON `classes`.`major_id` = `list_majors`.`id`;
');
$fasilities = $sql->query('SELECT * FROM `fasilities`');
unset($sql);
?>
<!DOCTYPE html>
<html>
<head>
	<title><?=$title[0]?></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Angrypin aka _Reduce">
	<meta name="description" content="website sekolah made with hand by Angrypin aka _Reduce">
	<meta name="robots" content="all,index,follow">
	<meta name="copyright" content="&copy; <?=date('Y')?> Angrypin aka _Reduce">
	<meta name="creator" content="Angrypin aka _Reduce">
	<meta property="og:type" content="website">
	<meta property="og:image" content="assets/images/logo.png">
	<meta property="og:title" content="<?=$title[0]?>">

	<link rel="icon" href="assets/images/logo.ico">
	<link rel="stylesheet" type="text/css" href="assets/css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/light.css">

	<script type="text/javascript" src="assets/js/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/semantic.min.js"></script>
	<script type="text/javascript" src="assets/js/library/jquery.serialize-object.min.js"></script>
	<script type="text/javascript" src="assets/js/library/tablesort.js"></script>
</head>
<body>
<div class="ui sidebar menu right vertical right aligned segment list-menu">
	<a class="item theme-changer">
		<i class="sun icon"></i>
		light theme
	</a>
<?php foreach($menus as $menu) { ?>
	<a href="#<?=$menu?>" class="item"><?=$menu?></a>
<?php } ?>
</div>
<div class="pusher">
	<div class="ui grid">
		<div class="computer only row">
			<div class="column">
				<div class="ui fixed secondary menu custom top">
					<a href="#home" class="header item">
						<img src="assets/images/logo.png">
						<?=$title[1]?>
					</a>
					<div class="ui secondary right menu list-menu">
						<a class="ui item theme-changer">
							<i class="sun icon"></i>
							light theme
						</a>
<?php foreach($menus as $menu) { ?>
						<a href="#<?=$menu?>" class="item"><?=$menu?></a>
<?php } ?>
					</div>
				</div>
			</div>
		</div>
		<div class="tablet mobile only row">
			<div class="column">
				<div class="ui fixed secondary menu custom top">
					<a href="#home" class="header item">
						<img src="assets/images/logo.png">
						<?=$title[1]?>
					</a>
					<div class="ui right secondary menu">
						<div class="item" id="my-btn">
							<i class="content icon"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="home">
		<h1><?=$title[1]?></h1>
	</div>
	<div id="user-page">
<?php include 'user-page.php' ?>
	</div>
	<div class="ui inverted text container">
		<div id="fasilitas">
			<h2>fasilitas</h2>
			<table class="ui very compact celled striped unstackable selectable sortable center aligned table">
				<thead>
					<tr>
						<th>nama</th>
						<th>jumlah</th>
					</tr>
				</thead>
				<tbody>
<?php
$total = 0;
while($row = $fasilities->fetch()) {
	$total += intval($row[3]);
?>
					<tr>
						<td><span data-content="<?=$row[2]?>"><?=$row[1]?></span></td>
						<td><?=$row[3]?></td>
					</tr>
<?php } ?>
				</tbody>
				<tfoot>
					<tr>
						<th>Total</th>
						<th><?=$total?></th>
					</tr>
				</tfoot>
			</table>
		</div>
		<div id="kelas">
			<h2>kelas</h2>
			<table class="ui very compact celled striped unstackable selectable sortable center aligned table">
				<thead>
					<tr>
						<th>kelas</th>
						<th class="sorted ascending">jurusan</th>
						<th>jumlah</th>
					</tr>
				</thead>
				<tbody>
<?php
$total = 0;
while($row = $classes->fetch()) {
	$total += intval($row[3]);
?>
					<tr>
						<td><?=$row[0]?></td>
						<td><span data-content="<?=$row[2]?>"><?=$row[1]?></span></td>
						<td><?=$row[3]?></td>
					</tr>
<?php } ?>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">Total</th>
						<th><?=$total?></th>
					</tr>
				</tfoot>
			</table>
		</div>
		<div id="prestasi">
			<h2>prestasi</h2>
			<table class="ui very compact celled striped selectable sortable center aligned table">
				<thead>
					<tr>
						<th>tahun</th>
						<th>nama</th>
						<th>penghargaan</th>
						<th>peringkat</th>
						<th>jenis</th>
						<th>tingkat</th>
					</tr>
				</thead>
				<tbody>
<?php while($row = $achievements->fetch()) { ?>
					<tr>
						<td><?=$row[1]?></td>
						<td><?=$row[2]?></td>
						<td><?=$row[3]?></td>
						<td><?=$row[4]?></td>
						<td><?=$row[5]?></td>
						<td><?=$row[6]?></td>
					</tr>
<?php } ?>
				</tbody>
				<tfoot>
					<tr>
						<th>tahun</th>
						<th>nama</th>
						<th>penghargaan</th>
						<th>peringkat</th>
						<th>jenis</th>
						<th>tingkat</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<div class="ui inverted vertical footer segment">
	<div class="ui inverted section divider"></div>
	<div class="ui center aligned container">
		<div class="ui stackable inverted divided equal width grid">
			<div class="column">
				<h4 class="ui inverted header">
					Profile
				</h4>
				<div class="ui inverted link list">
<?php foreach(array_slice($menus, 1) as $menu) { ?>
					<a href="#<?=$menu?>" class="item"><?=$menu?></a>
<?php } ?>
				</div>
			</div>
			<div class="column">
				<h4 class="ui inverted header">
					Author
				</h4>
				<div class="ui inverted list">
					<span class="item">M. Arifin Ilham</span>
					<span class="item">XI RPL 1</span>
				</div>
			</div>
		</div>
	</div>
	<div class="ui center aligned container">
		<div class="ui inverted section divider"></div>
		<img src="assets/images/logo.png" class="ui centered mini image">
		<div class="ui horizontal inverted small divided link list">
<?php foreach(array_slice($menus, 1) as $menu) { ?>
			<a href="#<?=$menu?>" class="item"><?=$menu?></a>
<?php } ?>
		</div>
	</div>
</div>
<script type="text/javascript">
	let userPage = '#<?=$menus[0]?>', dark;
	const nameRegex = /<?=$name_regex?>/;
</script>
<script type="text/javascript" src="assets/js/custom.js"></script>
</body>
</html>