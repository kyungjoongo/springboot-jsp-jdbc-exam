<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Hello grid!!!!!!!!</title>



<!-- <link href="/jquery-ui-1.12.1.custom/jquery-ui.theme.css" rel="stylesheet" />
<link href="/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" /> -->


<link href="/jquery-ui-1.12.1.green2/jquery-ui.theme.css" rel="stylesheet" />
<link href="/jquery-ui-1.12.1.green2/jquery-ui.css" rel="stylesheet" />

<link href="/jqGrid-4.4.3/css/ui.jqgrid.css" rel="stylesheet" />
<script type="text/javascript" src="/jqGrid-4.4.3/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/jqGrid-4.4.3/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/jqGrid-4.4.3/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jquery-ui-1.12.1.green2/jquery-ui.js"></script>


<script>


function loadjscssfile(filename, filetype){
    if (filetype=="js"){ //if filename is a external JavaScript file
        var fileref=document.createElement('script')
        fileref.setAttribute("type","text/javascript")
        fileref.setAttribute("src", filename)
    }
    else if (filetype=="css"){ //if filename is an external CSS file
        var fileref=document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
    if (typeof fileref!="undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref)
}
 




$(function() {
	
	$("#changeTheme").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.green/jquery-ui.theme.css", "css") ////dy
	});
	
	
	$("#changeTheme2").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.green2/jquery-ui.theme.css", "css") ////dy
	});
	

	$("#changeTheme3").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.custom/jquery-ui.theme.css", "css") ////dy
	});
	
	$("#changeTheme4").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.red/jquery-ui.theme.css", "css") ////dy
	});
	
	$('#selectTheme').change(function(){
		
	         var themeName = $('#selectTheme option:selected').val() ;
	         
	         if ( themeName =='green'){
	        	 loadjscssfile("/jquery-ui-1.12.1.green/jquery-ui.theme.css", "css") ////dy
	         }
	         
	         if ( themeName =='green2'){
	        	 loadjscssfile("/jquery-ui-1.12.1.green2/jquery-ui.theme.css", "css") ////dy
	         }
	         
	         if ( themeName =='gray'){
	        	 loadjscssfile("/jquery-ui-1.12.1.custom/jquery-ui.theme.css", "css") ////dy
	         }
	         
	         if ( themeName =='red'){
	        	 loadjscssfile("/jquery-ui-1.12.1.red/jquery-ui.theme.css", "css") ////dy
	         }
	});
	
	
	
	
	
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
	<input type="button" value="green2" id="changeTheme2">
	<input type="button" value="green" id="changeTheme">
	<input type="button" value="gray" id="changeTheme3">
	<input type="button" value="red" id="changeTheme4">
	
	<select id="selectTheme">
		<option id="green2">green2</option>
		<option id="green">green</option>
		<option id="gray">gray</option>
		<option id="red">red</option>
	</select>
	
</body>
</html>