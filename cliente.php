<?php

$mysqli = new mysqli('localhost','root','','test');
$mes = array('', 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');


if (isset($_POST['id_cliente'])) {
	$valor = explode(' - ',$_POST["id_cliente"]);
	$id_cliente = $valor[0];
}

$query = "SELECT * FROM tb_dados WHERE cliente_id_cliente = '". $id_cliente ."';";

?>
<a href="index.php"><- Voltar</a>

<h1><?php $valor ?></h1>

<table>
	<tr>
		<th>Mês</th>
		<th>Visitas</th>
		<th>Leads</th>
		<th>Oportunidades</th>
		<th>Vendas</th>
	</tr>
<?php
	if ($res = $mysqli->query($query)) {

		while ($dados = $res->fetch_row()) { ?>
	<tr>
		<td><?php echo $mes[$dados[2]] ?></td>
		<td><?php echo $dados[4] ?></td>
		<td><?php echo $dados[5] ?></td>
		<td><?php echo $dados[6] ?></td>
		<td><?php echo $dados[7] ?></td>
	</tr>
<?php 
		}
	}
?>


</table>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script><?php include("gcoluna.php"); ?></script>
<div id="chart_div"></div>