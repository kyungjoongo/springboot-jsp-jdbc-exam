<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello grid!!!!!!!!</title>

<#include "/common/common.ftl">


    <script>

        function hasExtension(inputID, exts) {
            var fileName = document.getElementById(inputID).value;
            return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
        }


        function loadGrid() {


            $("#list2").jqGrid({
                url: '/tinkerbell/getDataList',
                datatype: "json",
                colNames: ['id', 'name', 'query_answer'],
                colModel: [
                    {name: 'id', width: 50, sortable: true, sorttype: "number"},
                    {name: 'name', width: 500, sortable: true, sorttype: "text"},
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

            /*  $('#list2').jqGrid('setGridParam', {sortorder: 'desc'});
              $('#list2').jqGrid('sortGrid', 'id');
  */

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
        }


        $(function () {

             $("#btnImport").on("click", function () {

                 var fileName = $("#file")[0].value;
                // alert(fileName);

                 if ( fileName ==''){
                     alert("파일을 선택하세여");
                     return false;
                 }else{
                     $("#form1").submit();
                 }

             });



        //그리드 로딩..
        loadGrid();

        /*$(":file").filestyle({input: false});*/
        $(".dropdown-menu li a").click(function () {

            $(".btn:first-child").text($(this).text());
            $(".btn:first-child").val($(this).text());

        });

        //btnChangeTheme
        $("#btnChangeTheme").on("change", function () {

            //alert($(this).attr("id"));

            var selectId = $("#btnChangeTheme option:selected").attr("id");

            if (selectId == 'green2') {
                loadjscssfile("/jquery-ui-1.12.1.green2/jquery-ui.theme.css", "css")
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css")
            } else if (selectId == 'green') {
                loadjscssfile("/jquery-ui-1.12.1.green/jquery-ui.theme.css", "css") ////dy
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy

            } else if (selectId == 'red') {

                loadjscssfile("/jquery-ui-1.12.1.red/jquery-ui.theme.css", "css") ////dy
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
            } else {

                loadjscssfile("/jquery-ui-1.12.1.custom/jquery-ui.theme.css", "css")
                loadjscssfile("/jquery.jqGrid-4.6.0/css/ui.jqgrid.css", "css") ////dy
            }


        });


        $("#btnLogout").on("click", function () {
            location.href = "/webapp/logoutAction";
        });

        $("#btnDelete").on("click", function () {

            if (confirm("삭제하시겠습니까?")) {
                var selRowIds = $("#list2").jqGrid('getGridParam', 'selarrrow');

                //  alert(selRowIds.toString());
                $.ajax({
                    url: '/tinkerbell/delete',
                    type: 'post',
                    async: false,
                    data: {rowIds: selRowIds.toString()},
                    success: function (data) {

                        alert("삭제성공")
                        //location.href = "/tinkerbell/list";
                        $('#list2').setGridParam({page: 1, datatype: "json"}).trigger('reloadGrid');
                    }
                })
            }


        });


        $("#uploadbutton").click(function () {
            var form = $('form')[0];
            var formData = new FormData(form);
            $.ajax({
                url: '/fileupload',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function (result) {
                    alert("업로드 성공!!");
                }
            });
        });

        $("#file1").change(function () {
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
                success: function (result) {
                    alert("업로드 성공!!");
                }
            });

            //$(".filename").html(fileName);
        });


        })
        ;


    </script>

</head>
<body>

<div class="container">

    Theme:
    <select id="btnChangeTheme">
        <option id="green2">green2</option>
        <option id="green">green</option>
        <option id="gray">gray</option>
        <option id="red">red</option>
    </select>
    <table id="list2"></table>
    <div id=pager2></div>


    <br/>
<#--<input cvlass="btn btn-outline-info btn-sm arrow-button" type="button" value="logout" id="btnLogout">-->

    <!--선택삭제-->
    <div class="container-fluid">

        <div class="row">
            <button type="button" class="btn btn-warning btn-sm" id="btnDelete">선택삭제</button>
        </div>
        <div class="row">
            &nbsp;
        </div>

        <div class="row">

            <form id="form1" method="POST" action="/tinkerbell/upload" enctype="multipart/form-data">
                <input type="file" id="file" name="file" class="btn btn-primary btn-sm"/>
                <input type="button" class="btn btn-primary btn-sm" value="Import" id="btnImport"/>
                <input type="submit" class="btn btn-primary btn-sm" value="Export"/>
            </form>
        </div>
        <div class="row">
        <#if message??>
                ${message}
            </#if>
        </div>


    </div>


</div>
</body>
</html>