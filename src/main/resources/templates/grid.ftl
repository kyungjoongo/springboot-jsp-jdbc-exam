<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Hello grid!!!!!!!!</title>

<link href="/jquery-ui-1.12.1.green2/jquery-ui.theme.css" rel="stylesheet" />
<link href="/jquery-ui-1.12.1.green2/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<!-- jqGrid-4.6.0 -->
<link href="/jquery.jqGrid-4.6.0/css/ui.jqgrid.css" rel="stylesheet" />
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jquery-ui-1.12.1.green2/jquery-ui.js"></script>
<!-- bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

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
	
	 $(".dropdown-menu li a").click(function(){

	      $(".btn:first-child").text($(this).text());
	      $(".btn:first-child").val($(this).text());

	   });
	
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
 <div class="container">
	dfasfasdfasdfasdfp---------------------------jkjkjkjkjkjkjkj
	<table id="list2"></table>
	<div id=pager2></div>
	<input class="btn btn-outline-info btn-sm" type="button" value="green2" id="changeTheme2">
	<input class="btn btn-outline-info btn-sm" type="button" value="green" id="changeTheme">
	<input class="btn btn-outline-info btn-sm" type="button" value="gray" id="changeTheme3">
	<input class="btn btn-outline-info btn-sm" type="button" value="red" id="changeTheme4">
    <!-- <button type="button" class="btn btn-primary">Primary</button> -->

	
	<select id="selectTheme">
		<option id="green2">green2</option>
		<option id="green">green</option>
		<option id="gray">gray</option>
		<option id="red">red</option>
	</select>
	
	<!-- <div class="dropdown">
	  <button class="btn btn-default dropdown-toggle btn-sm" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	    selectTheme
	    <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	    <li><a href="#" class="dropdownItem" data-value="green2">green2</a></li>
	    <li><a href="#" class="dropdownItem" data-value="green">green</a></li>
	    <li><a href="#" class="dropdownItem" data-value="gray">gray</a></li>
	    <li><a href="#" class="dropdownItem" data-value="red">red</a></li>
	    
	  </ul>
	</div>
	 -->
	
</div>
</body>
</html>