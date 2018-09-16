<?php

$i = 0;
$linhas = "";
  if ($res = $mysqli->query($query)) {

    while ($dados = $res->fetch_row()) { 

      if ($i > 0) $linhas .= ",";
      $linhas .= "
        [\"Copper\", 8.94, \"#b87333\"]
      ";

      $i += 1;
    }
  }

$html = "

google.charts.load(\"current\", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        [\"Element\", \"Density\", { role: \"style\" } ],
        " . $linhas . "]); 
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: \"stringify\",
                         sourceColumn: 1,
                         type: \"string\",
                         role: \"annotation\" },
                       2]);

      var options = {
        title: \"Density of Precious Metals, in g/cm^3\",
        width: 600,
        height: 400,
        bar: {groupWidth: \"95%\"},
        legend: { position: \"none\" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById(\"chart_div\"));
      chart.draw(view, options);
  }

";

echo $html;
?>