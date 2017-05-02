<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Hello grid!!!!!!!!</title>

<link href="/jquery-ui-1.12.1.custom/jquery-ui.theme.css" rel="stylesheet" />
<link href="/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
<!-- jqGrid-4.6.0 -->
<link href="/jquery.jqGrid-4.6.0/css/ui.jqgrid.css" rel="stylesheet" />
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/jquery.jqGrid-4.6.0/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
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
		
		loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
		
	});
	
	
	$("#changeTheme2").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.green2/jquery-ui.theme.css", "css") ////dy
		loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
	});
	

	$("#changeTheme3").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.custom/jquery-ui.theme.css", "css") 
		loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
	});
	
	$("#changeTheme4").on( "click", function() {

		loadjscssfile("/jquery-ui-1.12.1.red/jquery-ui.theme.css", "css") ////dy
		loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
	});
	
	
	 
	 
	
	$("#list2").jqGrid({
	   	url:'/getGridData',
		datatype: "json",
	   	colNames:['id','content'],
	   	colModel:[
	   		{name:'id',index:'id', width:500,sortable:true, sorttype: "number"},
	   		{name:'content', width:500,sortable:true, sorttype: "text"},
	   	],
	   	rowNum:30,
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
	
	
	$("#list2").jqGrid('navGrid','#pager2',
			{edit:false,add:false,del:false,search: true},{},{},{},
			{
				
				multipleSearch:false, multipleGroup:false, showQuery: false,
				sopt: ['cn'],
                defaultSearch: 'cn',
                caption: "Search",
                //closeAfterSearch: true,
                //closeOnEscape: true,
                modal :false,
                left: 400,
                top: 400,
                searchOnEnter : true
			
			
			} 
			
			
			
			
			);
	
	
	/* $('#selectLang').on( "change", function() {
		
        var lang = $('#selectLang option:selected').val() ;
        
        if ( lang =='ko'){
	       	 loadjscssfile("/jquery.jqGrid-4.6.0/js/i18n/grid.locale-kr.js", "js") ////dy
        }
        
        if ( lang =='en'){
	       	 loadjscssfile("/jquery.jqGrid-4.6.0/js/i18n/grid.locale-en.js", "js") ////dy
        }
        $("#list2").trigger("reloadGrid", [{current: true}]);
        
       
	});
	  */

});




</script>

<script>
   
</script>

</head>
<body>
 <div class="container">
	진짜로 장난하냐3333333333333333333333333
	<table id="list2"></table>
	<div id=pager2></div>


	<input class="btn btn-outline-info btn-sm" type="button" value="green2" id="changeTheme2">
	<input class="btn btn-outline-info btn-sm" type="button" value="green" id="changeTheme">
	<input class="btn btn-outline-info btn-sm" type="button" value="gray" id="changeTheme3">
	<input class="btn btn-outline-info btn-sm" type="button" value="red" id="changeTheme4">
    <!-- <button type="button" class="btn btn-primary">Primary</button> -->

	
	<!-- <select id="selectLang">
		<option id="ko">ko</option>
		<option id="en">en</option>
		
		
	</select> -->
	
	
	
	
</div>
</body>
</html>