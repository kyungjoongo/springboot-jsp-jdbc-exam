<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello grid!!!!!!!!</title>

<#include "/common/common.ftl">


    <script>



        $(function () {

            $( "#modifyDialog" ).dialog({
                autoOpen: false,
                title: '수정',
                modal: false,
                resizable: true,
                width: 900,
                maxHeight: 400,
                closeText: 'fechar',
                draggable: true

            });

            $("#btnImport").on("click", function () {

                var fileName = $("#file")[0].value;
                // alert(fileName);

                if (fileName == '') {
                    alert("파일을 선택하세여");
                    return false;
                } else {
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


        });


        function hasExtension(inputID, exts) {
            var fileName = document.getElementById(inputID).value;
            return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
        }

        function modifyButtonMaker(cellvalue, options, rowObject) {
            return "<button class='btnRowModify' id=" + rowObject.id + ">" + "수정" + "</button>"
        };

        function deleteButtonMaker(cellvalue, options, rowObject) {
            return "<button class='btnRowDelete' id=" + rowObject.id + ">" + "삭제" + "</button>"
        };


        function loadGrid() {

            $("#list2").jqGrid({
                url: '/tinkerbell/getDataList',
                datatype: "json",
                colNames: ['id', 'name', 'query_answer', '삭제', "수정"],
                colModel: [
                    {name: 'id', width: 50, sortable: true, sorttype: "number"},
                    {name: 'name', width: 500, sortable: true, sorttype: "text"},
                    {name: 'query_answer', width: 500, sortable: true, sorttype: "text"},
                    {name: 'btnDelete', width: 50, index: status, editable: false, formatter: deleteButtonMaker},
                    {name: 'btnModify', width: 50, index: status, editable: false, formatter: modifyButtonMaker}
                ],
                ondblClickRow: function () {
                    var row_id = $("#list2").getGridParam('selrow');
                    $('#list2').editRow(row_id, true);
                },
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


                    $(".btnRowDelete").on("click", function () {

                        if (confirm("삭제하시겠습니까?")) {
                            var selRowIds = $(this).attr("id")

                            //  alert(selRowIds.toString());
                            $.ajax({
                                url: '/tinkerbell/delete',
                                type: 'post',
                                async: false,
                                data: {rowIds: selRowIds.toString()},
                                success: function (data) {

                                    //alert("삭제성공")
                                    //location.href = "/tinkerbell/list";
                                    $('#list2').setGridParam({page: 1, datatype: "json"}).trigger('reloadGrid');
                                }
                            })
                        }
                    });


                    $(".btnRowModify").on("click", function () {

                        var rowid = $(this).attr("id");

                        $("#rowId").val(rowid);
                      //  alert(rowid);

                        var rowData = $('#list2').jqGrid ('getRowData', rowid);

                        var query= rowData.name;
                        var query_answer= rowData.query_answer;


                        $("#modifyDialog").dialog( "open" );

                        $("#query").val(query);
                        $("#query_answer").val(query_answer);




                    });


                },
                multiselect: 1
                //editable : 1
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


            /*

            팝업 수정 ev
             */
            //btnPopupSubmit
            $("#btnPopupSubmit").on("click", function () {

                $.ajax({
                    url: '/tinkerbell/update',
                    type: 'post',
                    async: false,
                    data: {
                        rowid: $("#rowId").val(),
                        query : $("#query").val(),
                        query_answer : $("#query_answer").val()


                    },
                    success: function (data) {

                       // alert("수정성공");

                        $('#modifyDialog').dialog('close');

                        $('#list2').setGridParam({page: 1, datatype: "json"}).trigger('reloadGrid');
                    }
                })

            });

        }



    </script>
<style>

    .ui-dialog-title{
        font-size: 10pt;
    }
    .ui-state-default{
        font-size:10pt;
    }

</style>
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

        <input type="hidden" id="rowId" value=""/>
        <div class="row">
            <button type="button" class="ui-state-default" id="btnDelete">선택삭제</button>
        </div>
        <div class="row">
            &nbsp;
        </div>

        <div class="row">

            <form id="form1" method="POST" action="/tinkerbell/upload" enctype="multipart/form-data">
                <input type="file" value="파일선택" id="file" name="file" class="ui-state-default" style="font-size: 9pt;"/>
                <input type="button" class="ui-state-default" value="Import" id="btnImport"/>
                <input type="submit" class="ui-state-default" value="Export"/>
            </form>
        </div>
        <div class="row">
        <#if message??>
        ${message}


        </#if>
            <#if RequestParameters.message??>
        ${RequestParameters.message}
        </#if>

        </div>


    </div>

    <div id ="modifyDialog" class="small" title = "Dialog Title goes here...">
        <table>
            <colgroup>
                <col width="100px;">
                <col width="400px;">
            </colgroup>
            <tr>
                <td>
                    <label>query&nbsp;&nbsp;  </label>
                </td>
                <td>
                    <input type="text" width="500px" size="80" id="query" style="font-size: 9pt;">
                </td>

            </tr>
            <tr>
                <td>
                    <label>query_answer&nbsp;&nbsp;  </label>
                </td>
                <td>
                    <input type="text" width="500px" size="80" id="query_answer" style="font-size: 9pt;">

                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" id="btnPopupSubmit" value="저장"  class="ui-state-default">
                </td>

            </tr>
        </table>







    </div>


</div>
</body>
</html>