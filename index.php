<?php

	include 'database.inc';

	$search = '';
	if (isset($_GET['s']) && !empty($_GET['s']))  $search = $_GET['s'];
	$data = search($search);
?>

<!doctype html>
<html class="no-js" lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Wazausky Store - A sua loja de livros</title>
		<link rel="stylesheet" href="css/normalize.css" />
		<link rel="stylesheet" href="css/foundation.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link href='https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700|PT+Serif:400,700|Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/main.css" />

		<script src="js/vendor/modernizr.js"></script>
	</head>
	<body>

		<div class="row" id="content">
			<div class="large-12 columns">
				<header>
					<i class="fa fa-book"></i>
					<h2 class="lobster">Wazausky Store</h2>
					<h5 class="opensans">A sua loja de livros</h5>
				</header>
			</div>
		</div>

		<div class="search_form">
			<div class="row">
				<div class="large-12 columns">
					<form action="index.php" method="GET">
						<div class="row collapse">
							<div class="small-11 columns">
								<input type="text" name="s" placeholder="O que você está procurando hoje?" />
							</div>
							<div class="small-1 columns">
								<a href="#" class="button postfix" id="search"><i class="fa fa-search"></i></a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<p></p>

		<div class="row">
			<div class="large-12 columns">
				<table>
					<thead>
						<tr>
							<td>Nome</td>
							<td>ISBN</td>
							<td>Páginas</td>
							<td>Autor</td>
						</tr>
					</thead>
					<tbody>
						<?php
						if (!empty($data))
						{
							foreach ($data as $book)
							{
								echo '<tr>';
								echo "<td>{$book['nome']}</td>";
								echo "<td>{$book['isbn']}</td>";
								echo "<td>{$book['paginas']}</td>";
								echo "<td>{$book['autor']}</td>";
								echo '</tr>';
							}
						}
						?>
					</tbody>
				</table>
			</div>
		</div>

		<script src="js/vendor/jquery.js"></script>
		<script src="js/foundation.min.js"></script>
		<script>
			$(document).foundation();
			$(function ()
			{
				$('#search').on('click', function (e)
				{
					$('form:eq(0)').submit();
					e.preventDefault();
					e.stopImmediatePropagation();
				});
			});
		</script>
	</body>
</html>
