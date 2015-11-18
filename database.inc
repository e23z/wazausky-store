<?php

	function search ($text = '')
	{
		$user = 'root';
		$password = 'senha123';
		$hostname = 'localhost';
		$port = '3036';
		$database = 'wazausky_store';
		$query = "
			SELECT
				L.nome as nome,
				L.ibsn as isbn,
				L.paginas as paginas,
				A.nome as autor
			FROM livros L
			INNER JOIN autores A ON A.id = L.autor
			WHERE '$text' = '' OR L.nome LIKE '%$text%' OR A.nome LIKE '%$text%';
		";

		$file = getcwd().'/queries.txt';
		$prevData = file_get_contents($file);
		file_put_contents($file, $prevData.$query."\n\n------\n\n");

		$conn = mysql_connect("$hostname:$port", $user, $password) or die ("Não conectou ao MySQL");
		$selected = mysql_select_db($database, $conn) or die ("Não achou a tabela" . mysql_error());
		mysql_query("SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'", $conn);
		$result = mysql_query($query);
		$data = array();

		while($row = mysql_fetch_array($result))
			$data[] = $row;

		mysql_close($conn);

		return $data;
	}	

?>
