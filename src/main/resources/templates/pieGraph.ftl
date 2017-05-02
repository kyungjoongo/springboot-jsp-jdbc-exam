<html>
<head>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/jquery.jqplot.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.json2.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.pieRenderer.js"></script>

    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.barRenderer.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.pieRenderer.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.categoryAxisRenderer.js"></script>
    <script type="text/javascript" src="jquery.jqplot.1.0.9/plugins/jqplot.pointLabels.js"></script>


    <link rel="stylesheet" type="text/css" href="jquery.jqplot.1.0.9/jquery.jqplot.css"/>

    <script>
        var s2 = [];
        var jsonResult = [];

        $(document).ready(function () {

               var chart_data = {"oranges": "30", "apples": "20", "bananas": "6"};
              var line1 = [];
              for (var prop_name in chart_data) {
                  line1.push([prop_name, chart_data[prop_name]])
              }
              // line1 should be [["oranges", 10], ["apples", 20], ["bananas", 6]]

        });


        function getGraphData() {

            $.ajax({
                // have to use synchronous here, else the function
                // will return before the data is fetched
                async: false,
                url: "/getGraphData",
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {

                        jsonResult.push([data[i].name, data[i].percentage])
                    }


                }
            });
        }


        $(document).ready(function(){

            getGraphData();
            var data = jsonResult;
                /*    [
                ['Heavy Industry', 12],['Retail', 9], ['Light Industry', 14],
                ['Out of home', 16],['Commuting', 7], ['Orientation', 9]
            ];*/
            var plot1 = jQuery.jqplot ('chart1', [data],
                    {
                        seriesDefaults: {
                            // Make this a pie chart.
                            renderer: jQuery.jqplot.PieRenderer,
                            rendererOptions: {
                                // Put data labels on the pie slices.
                                // By default, labels show the percentage of the slice.
                                showDataLabels: true
                            }
                        },
                        legend: { show:true, location: 'e' }
                    }
            );
        });




    </script>

</head>
<body>
<div id="chart1" style="width: 600px;"></div>
<div id="info1"></div>


</body>

</html>