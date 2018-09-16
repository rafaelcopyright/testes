<?php

$mysqli = new mysqli('localhost','root','','test');


?>


<form method="POST" action="cliente.php">

<?php

if ($res = $mysqli->query("SELECT id_cliente, nome_cliente FROM tb_cliente")) {
	
	while ($clientes = $res->fetch_row()) {
		echo "<input type=\"submit\" id=\"btn$clientes[0]\" name=\"id_cliente\" value=\"$clientes[0] - $clientes[1]\" class=\"btn\"/>";
	}
}

?>

</form>