<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Hello grid!!!!!!!!</title>



<link href="/jquery-ui-1.12.1.custom/jquery-ui.theme.css" rel="stylesheet" />
<link href="/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />
<link href="/jqGrid-4.4.3/css/ui.jqgrid.css" rel="stylesheet" />
<script type="text/javascript" src="/jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jquery-ui-1.12.1.custom/jquery-ui.js"></script>


<script>


$(function() {
	
	$("#list2").jqGrid({
	   	url:'/getGridData',
		datatype: "json",
	   	colNames:['id','content'],
	   	colModel:[
	   		{name:'id',index:'id', width:500,sortable:true, sorttype: "number"},
	   		{name:'content', width:500,sortable:true},
	   	],
	   	rowNum:10,
	   	height:'auto',
	   	rowList:[10,20,30],
	   	pager: '#pager2',
	   	sortname: 'id',
	    viewrecords: true,
	    sortorder: "desc",
	    caption:"JSON Example",
        jsonReader: {
            repeatitems: false,
            root: "rows"
        }, //Required for client side sorting
        loadonce: true,
        gridComplete: function(){ 
          $("#list2").setGridParam({datatype: 'local'}); 
        }
	});
	
	$('#list2').jqGrid('setGridParam', {sortorder: 'desc'});
	$('#list2').jqGrid('sortGrid', 'id');


});

$("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});

</script>

<script>
   
</script>

</head>
<body>

	dfasfasdfasdfasdfp---------------------------jkjkjkjkjkjkjkj
	<table id="list2"></table>
	<div id=pager2></div>
</body>
</html>