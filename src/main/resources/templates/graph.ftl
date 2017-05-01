<html>
<head>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.jqplot.1.0.9/jquery.jqplot.js"></script>
<script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.json2.js"></script>
<script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.pieRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.jqplot.1.0.9/jquery.jqplot.css" />





<script>



$(document).ready(function(){
    var plot1 = $.jqplot('pie1', [[['a',6],['b',1],['c',1]]], {
        gridPadding: {top:0, bottom:38, left:0, right:0},
        seriesDefaults:{
            renderer:$.jqplot.PieRenderer, 
            trendline:{ show:false }, 
            rendererOptions: { padding: 8, showDataLabels: true }
        },
        legend:{
            show:true, 
            placement: 'outside', 
            rendererOptions: {
                numberRows: 1
            }, 
            location:'s',
            marginTop: '15px'
        }       
    });
});
</script>

</head>
<body>
<div id="pie1"></div>




</body>

</html>