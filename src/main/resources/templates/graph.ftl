<html>
<head>

<#include "/common/common.ftl">

    <script>
        var s2 = [];
        var tickResult = [];

        function getGraphData() {

            $.ajax({
                // have to use synchronous here, else the function
                // will return before the data is fetched
                async: false,
                url: "/getGraphData",
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {

                        s2.push(data[i].percentage);
                        tickResult.push(data[i].name);
                    }


                }
            });
        }

        //뱃살이 왜이리 안빠지는거냐sdlfksldkflsdkflk주글래lkslfkdslfksfdl

        $(document).ready(function () {

            getGraphData();


            $.jqplot.config.enablePlugins = true;
            //var s1 = [2, 6, 7, 10];
            var s1 = s2;
            var ticks = tickResult;

            plot1 = $.jqplot('chart1', [s1], {
                // Only animate if we're not using excanvas (not in IE 7 or IE 8)..
                animate: !$.jqplot.use_excanvas,
                seriesDefaults: {
                    renderer: $.jqplot.BarRenderer,
                    pointLabels: {show: true}
                },
                axes: {
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                        ticks: ticks
                    }
                },
                highlighter: {show: true}
            });

            $('#chart1').bind('jqplotDataClick',
                    function (ev, seriesIndex, pointIndex, data) {
                        $('#info1').html('series: ' + seriesIndex + ', point: ' + pointIndex + ', data: ' + data);
                    }
            );
        });


        $(document).ready(function () {

            /*   var chart_data = {"oranges": "30", "apples": "20", "bananas": "6"};
              var line1 = [];
              for (var prop_name in chart_data) {
                  line1.push([prop_name, chart_data[prop_name]])
              }
              // line1 should be [["oranges", 10], ["apples", 20], ["bananas", 6]] */

        });


    </script>

</head>
<body>
<div id="chart1" style="width: 600px;"></div>
<div id="info1"></div>


</body>

</html>