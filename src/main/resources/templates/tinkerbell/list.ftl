<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello grid!!!!!!!!</title>

<#include "/common/common.ftl">


    <script>


        function loadjscssfile(filename, filetype) {
            if (filetype == "js") { //if filename is a external JavaScript file
                var fileref = document.createElement('script')
                fileref.setAttribute("type", "text/javascript")
                fileref.setAttribute("src", filename)
            }
            else if (filetype == "css") { //if filename is an external CSS file
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", filename)
            }
            if (typeof fileref != "undefined")
                document.getElementsByTagName("head")[0].appendChild(fileref)
        }


        $(function () {

            /*$(":file").filestyle({input: false});*/
            $(".dropdown-menu li a").click(function () {

                $(".btn:first-child").text($(this).text());
                $(".btn:first-child").val($(this).text());

            });

            $("#changeTheme").on("click", function () {

                loadjscssfile("/jquery-ui-1.12.1.green/jquery-ui.theme.css", "css") ////dy

                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy

            });


            $("#changeTheme2").on("click", function () {

                loadjscssfile("/jquery-ui-1.12.1.green2/jquery-ui.theme.css", "css") ////dy
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
            });


            $("#changeTheme3").on("click", function () {

                loadjscssfile("/jquery-ui-1.12.1.custom/jquery-ui.theme.css", "css")
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
            });

            $("#changeTheme4").on("click", function () {

                loadjscssfile("/jquery-ui-1.12.1.red/jquery-ui.theme.css", "css") ////dy
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
            });


            $("#btnLogout").on("click", function () {

                location.href = "/webapp/logoutAction";
            });

            //

            $("#btnDelete").on("click", function () {

                var selRowIds = $("#list2").jqGrid ('getGridParam', 'selarrrow');

                alert(selRowIds.toString());


                $.ajax({
                    url:'/tinkerbell/delete',
                    type:'post',
                    data:{ rowIds :selRowIds.toString() },
                    success:function(data){


                        alert("삭제성공")

                        location.href="/tinkerbell/list";
                    }
                })

            });



            $("#list2").jqGrid({
                url: '/tinkerbell/getDataList',
                datatype: "json",
                colNames: ['id','name', 'query_answer'],
                colModel: [
                    {name: 'id',  width: 50, sortable: true, sorttype: "number"},
                    {name: 'name',  width: 500, sortable: true, sorttype: "text"},
                    {name: 'query_answer', width: 500, sortable: true, sorttype: "text"},
                ],
                rowNum: 30,
                height: 'auto',
                rowList: [10, 20, 30],
                pager: '#pager2',
                sortname: 'id',
                viewrecords: true,
                sortorder: "desc",
                caption: "JSON Example",
                jsonReader: {
                    repeatitems: false,
                    root: "rows"
                }, //Required for client side sorting
                loadonce: true,
                gridComplete: function () {
                    $("#list2").setGridParam({datatype: 'local'});
                },
                multiselect: true
            });

            $('#list2').jqGrid('setGridParam', {sortorder: 'desc'});
            $('#list2').jqGrid('sortGrid', 'id');


            $("#list2").jqGrid('navGrid', '#pager2',
                    {edit: false, add: false, del: false, search: true}, {}, {}, {},
                    {

                        multipleSearch: false, multipleGroup: false, showQuery: false,
                        sopt: ['cn'],
                        defaultSearch: 'cn',
                        caption: "Search",
                        //closeAfterSearch: true,
                        //closeOnEscape: true,
                        modal: false,
                        left: 400,
                        top: 400,
                        searchOnEnter: true


                    }
            );

            $("#uploadbutton").click(function(){
                var form = $('form')[0];
                var formData = new FormData(form);
                $.ajax({
                    url: '/fileupload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert("업로드 성공!!");
                    }
                });
            });

            $("#file1").change(function (){
                /*var fileName = $(this).val();

                alert(fileName);*/


                var form = $('form')[0];
                var formData = new FormData(form);
                $.ajax({
                    url: '/tinkerbell/fileupload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert("업로드 성공!!");
                    }
                });

                //$(".filename").html(fileName);
            });







        });


    </script>

</head>
<body>

<div class="container">


    <#--<input type="file" id="file1" class="filestyle" data-input="false" style="border: 1">-->
    <table id="list2"></table>
    <div id=pager2></div>

        <input class="btn btn-outline-info btn-sm" type="button" value="green2" id="changeTheme2">
        <input class="btn btn-outline-info btn-sm" type="button" value="green" id="changeTheme">
        <input class="btn btn-outline-info btn-sm" type="button" value="gray" id="changeTheme3">
        <input class="btn btn-outline-info btn-sm" type="button" value="red" id="changeTheme4">

<#--


<input cvlass="btn btn-outline-info btn-sm arrow-button" type="button" value="logout" id="btnLogout">-->


        <input cvlass="btn btn-outline-info btn-sm arrow-button" type="button" value="선택삭제" id="btnDelete">


    <form method="POST" action="/tinkerbell/upload" enctype="multipart/form-data">
        <input type="file" name="file" /><br/><br/>
        <input type="submit" value="Submit" />
    </form>
sdfsdfsdfd
    <#if message??>
        ${message}
    </#if>


</div>
</body>
</html>