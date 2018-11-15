<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddMOM.aspx.cs" Inherits="eSupport.UI.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>

    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <link href="Libs/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <%--<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    
    <script type="text/javascript">

        function SaveMOMTransaction() {

            if ($("#txtMOMTitle").val().length == 0 || $("#txtMeetingdate").val() == 0 || $("#txtAutoCompleteFacilitator").val() == -1 || $("#txtAutoCompleteRecorder").val() == -1 || $("#txtLocation").val() == 0) {
                alert("Please fill in all the fields before submitting!!");
            }
            else
            {
                var MomBO = {};
                MomBO.Title = $.trim($('#txtMOMTitle').val());
                MomBO.Date = $.trim($('#txtMeetingdate').val());
                MomBO.Facilitator = $.trim($('#txtAutoCompleteFacilitator').val());
                MomBO.Recorder = $.trim($('#txtAutoCompleteRecorder').val());
                MomBO.LocationDetails = $.trim($('#txtLocation').val());

                //--------------------------------------------------------------------------------------------------


                var rows = $("#tblAttendee tr").length;
                var ParticipantsBO = [];

                for (var rowOn = 1; rowOn < rows; rowOn++) {
                    AttendeeID = $("#tblAttendee").find("tr").eq(rowOn).find("td").eq(0).text();
                    AttendeeStatus = $("#tblAttendee").find("tr").eq(rowOn).find("td").eq(2).find("input").eq(0).prop('checked');
                    var rowData = { UserID: AttendeeID, Availability: AttendeeStatus };
                    ParticipantsBO.push(rowData);
                }


                //----------------------------------------------------------------------------------------------------


                var tblAgendasRows = $("#tbladdAgenda tr").length;
                var AgendaBO = [];
                for (var rowOn = 1; rowOn < tblAgendasRows; rowOn++) {
                    AgendaTime = $("#tbladdAgenda").find("tr").eq(rowOn).find("td").eq(0).text();
                    Topic = $("#tbladdAgenda").find("tr").eq(rowOn).find("td").eq(1).text();
                    AgendaResponsible = $("#tbladdAgenda").find("tr").eq(rowOn).find("td").eq(2).text();
                    AgendaPurpose = $("#tbladdAgenda").find("tr").eq(rowOn).find("td").eq(3).text();
                    AgendaDiscussion = $("#tbladdAgenda").find("tr").eq(rowOn).find("td").eq(4).text();

                    var rowData = { Time: AgendaTime, DiscussionTopic: Topic, Responsible: AgendaResponsible, Purpose: AgendaPurpose, Discussion: AgendaDiscussion };
                    AgendaBO.push(rowData);
                }

                //------------------------------------------------------------------------------------------------------

                var tblActionItemRow = $("#tbladdActionItems tr").length;
                var ActionItemsBO = [];
                for (var rowOn = 1; rowOn < tblActionItemRow; rowOn++) {
                    ActionItemName = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(0).text();
                    ActionResponsible = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(1).text();
                    ActionDueDate = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(2).text();
                    ActionStatus = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(3).text();
                    ActionDiscussion = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(4).text();
                    ActionCloseDate = $("#tbladdActionItems").find("tr").eq(rowOn).find("td").eq(5).text();
                    var rowData = { ActionItem: ActionItemName, Responsible: ActionResponsible, DueDate: ActionDueDate, Status: ActionStatus, Discussion: ActionDiscussion, CloseDate: ActionCloseDate };

                    ActionItemsBO.push(rowData);
                }
                var jSonData = JSON.stringify({ MomBO: MomBO, ParticipantsBO: ParticipantsBO, AgendaBO: AgendaBO, ActionItemsBO: ActionItemsBO });
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    url: 'AddMOM.aspx/AddMOMTransaction',
                    data: jSonData,
                    datatype: "json",
                    success: function (Record) {
                        alert("data has been added successfully");
                        $("#frmMOM")[0].reset();
                        $("#tbladdAgenda tbody tr").remove();
                        $("#tbladdActionItems tbody tr").remove();
                    }
                });
            }
        }



        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: 'AddMOM.aspx/BindUsers',
                data: "{}",
                dataType: 'json',
                dataSrc: "",
                success: function (data) {

                    var result = JSON.parse(data.d)
                    //alert(data.d);

                    $('#txtAutoCompleteFacilitator').empty();
                    $('#dlAutoCompleteRecorder').empty();
                    $("#txtAutoCompleteFacilitator").append($("<option/>", { value: -1, text: "--Please Select Facilitator--" }));
                    $("#txtAutoCompleteRecorder").append($("<option/>", { value: -1, text: "--Please Select Recorder--" }));
                    $("#txtAgendaRequestor").append($("<option/>", { value: -1, text: "--Please Select Requestor--" }));
                    $("#txtAutoCompleteResponsible").append($("<option/>", { value: -1, text: "--Please Select Responsible--" }));
                    for (var i = 0; i < result.length; i++) {
                        $("#txtAutoCompleteFacilitator").append($("<option/>", { value: result[i].Id, text: result[i].FacilitatorName }));
                        //$("#dlAutoCompleteFacilitator").append("<option value=" + result[i].Id + ">" + result[i].FacilitatorName + "</option>");
                        //alert(result[i].Id);
                        $("#txtAutoCompleteRecorder").append($("<option/>", { value: result[i].Id, text: result[i].RecorderName }));
                        //$("#dlAutoCompleteRecorder").append("<option value=" + result[i].Id + ">" + result[i].RecorderName + "</option>");
                        $("#txtAgendaRequestor").append($("<option/>", { value: result[i].Id, text: result[i].RecorderName }));
                        //$("#dlAutoCompleteRequestor").append("<option value=" + result[i].Id + ">" + result[i].RecorderName + "</option>");
                        $("#txtAutoCompleteResponsible").append($("<option/>", { value: result[i].Id, text: result[i].RecorderName }));
                        //$("#dlAutoCompleteResponsible").append("<option value=" + result[i].Id + ">" + result[i].RecorderName + "</option>");
                    }
                }
            })


            // Bind user list#Attendees
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: 'AddMOM.aspx/BindUsers',
                data: "{}",
                dataType: 'json',
                dataSrc: "",
                success: function (data) {

                    var result = JSON.parse(data.d);
                    //alert('hi');
                    for (var i = 0; i < result.length; i++) {
                        $("#tblAttendee").append('<tr><td hidden>' + result[i].Id + '</td><td>' + result[i].FacilitatorName + '</td><td><input id="chkAttendees" type="checkbox" data-on="Yes" data-off="No" checked data-toggle="toggle" ></input></td></tr>');

                    }
                    $("[data-toggle='toggle']").bootstrapToggle();
                }



            });
        });

    </script>


    <style type="text/css">
        .modal-footer {
            max-height: calc(100vh - 210px);
            overflow-y: auto;
        }
    </style>


    <!-- page content -->
    <div class="right_col" role="main">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Add Minutes Of Meeting</h2>
                    <input type="button" id="btnSaveMOMToDB" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" style="width: 75px;" onclick="SaveMOMTransaction();" />
                    <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="container">
                        <form role="form" id="frmMOM" class="form-horizontal" method="post">
                            <div class="row">
                                <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                    <label class="control-label col-xs-12 col-sm-4" for="txtMeetingdate">Meeting Date</label>
                                    <div class="form-group col-xs-12 col-sm-8">
                                        <input class="form-control" id="txtMeetingdate" name="date" placeholder="MM/DD/YYY" type="text" />
                                        <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
                                    </div>
                                </div>
                                <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                    <label class="control-label col-xs-12 col-sm-4" for="txtMOMTitle">Title</label>
                                    <div class="form-group col-xs-12 col-sm-8">
                                        <input type="text" id="txtMOMTitle" class="form-control" maxlength="100" placeholder="Meeting Title" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                    <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteFacilitator">Facilitator</label>
                                    <div class="form-group col-xs-12 col-sm-8">
                                        <%--<input type="text" id="txtAutoCompleteFacilitator" list="dlAutoCompleteFacilitator" class="form-control" placeholder="Facilitator Name" />
                                        <datalist id="dlAutoCompleteFacilitator">
                                            <option value="" id="" selected disabled hidden></option>
                                        </datalist>--%>
                                        <select class="form-control" id="txtAutoCompleteFacilitator" name="txtAutoCompleteFacilitator" >
                                        </select>
                                        
                                    </div>
                                </div>
                                <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                    <span id='remaininglocationChars'></span>
                                    <label class="control-label col-xs-12 col-sm-4" for="ddlCPUCount">Location</label>
                                    <div class="form-group col-xs-12 col-sm-8">
                                        <textarea class="form-control" id="txtLocation" rows="5" maxlength="1000" placeholder="Meeting Location"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                    <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteRecorder">Recorder</label>
                                    <div class="form-group col-xs-12 col-sm-8">
                                        <select id="txtAutoCompleteRecorder"  class="form-control"></select>
                                        <%--<input type="text" id="txtAutoCompleteRecorder" list="dlAutoCompleteRecorder" class="form-control" placeholder="Recorder Name" />
                                        <datalist id="dlAutoCompleteRecorder">
                                            <option value="" selected disabled hidden></option>
                                        </datalist>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group form-horizontal col-xs-8 col-sm-3">
                                    <button class="btn btn-primary" data-target="#attendeeModal" data-toggle="modal" style="width: 130px;" type="button" id="btnAttendeeModal">
                                        Attendee
                                                <i class="fa fa-plus-square-o fa-lg"></i>
                                    </button>
                                </div>
                                <div class="form-group form-horizontal col-xs-8 col-sm-3">
                                    <button class="btn btn-primary" data-target="#agendaModal" data-toggle="modal" style="width: 130px;" type="button">
                                        Agenda
                                                <i class="fa fa-plus-square-o fa-lg"></i>
                                    </button>
                                </div>
                                <div class="form-group form-horizontal col-xs-8 col-sm-3">
                                    <button class="btn btn-primary" data-target="#actionitemsModal" data-toggle="modal" style="width: 130px;" type="button">
                                        Action Items
                                                <i class="fa fa-plus-square-o fa-lg"></i>
                                    </button>
                                </div>
                            </div>


                        </form>

                    </div>

                    <div class="modal fade" id="attendeeModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close pull-right" data-dismiss="modal" aria-hidden="true" style="width: 5px;">&times;</button>
                                    <h4 class="modal-title">Attendance</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="addAttendeeInfo" class="form-horizontal" method="post">
                                        <table class="table table-striped" id="tblAttendee">
                                            <tr>
                                                <th hidden></th>
                                                <th>
                                                    <label>Attendee Name</label>
                                                </th>

                                                <th>
                                                    <label>Attendance Status</label>
                                                </th>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary btn-sm" data-dismiss="modal" id="btnOK">OK</button>
                                    <button class="btn btn-primary btn-sm" data-dismiss="modal" id="btnCancel">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal" id="agendaModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close pull-right" data-dismiss="modal" style="width: 5px;">&times;</button>
                                    <h4 class="modal-title">Agenda</h4>
                                </div>
                                <div class="modal-body">

                                    <form role="form" id="formaddAgendaInfo" class="form-horizontal" method="post">
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="agendaTime">Time</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input type="number" class="form-control" id="agendaTime" placeholder="Time in minutes" />
                                                </div>
                                            </div>
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="agendaTopic">Topic</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input type="text" class="form-control" id="agendaTopic" maxlength="100" placeholder="Topic of the meeting" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteRequestor">Requestor</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <div class="ui-widget">
                                                        <select id="txtAgendaRequestor" class="form-control"></select>
                                                        <%--<input type="text" id="txtAgendaRequestor" list="dlAutoCompleteRequestor" class="form-control" placeholder="Requestor Name" />
                                                        <datalist id="dlAutoCompleteRequestor">
                                                            <option value="" selected disabled hidden></option>
                                                        </datalist>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="agendaPurpose">Purpose</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input type="text" class="form-control" id="agendaPurpose" placeholder="Purpose of meeting" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="txtAgendaDiscussion">Discussion</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <textarea class="form-control col-xs-12" id="txtAgendaDiscussion" rows="5" maxlength="1000"></textarea>
                                                </div>
                                                <span id="remainingAgendaChars"></span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <div class="table-responsive col-xs-12">
                                        <table id="tbladdAgenda" class="table table-responsive table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Time</th>
                                                    <th>Topic</th>
                                                    <th>Responsible</th>
                                                    <th hidden></th>
                                                    <th hidden></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-sm" type="button" id="AgendaAdd">Add</button>
                                    <button class="btn btn-primary btn-sm" type="button" data-dismiss="modal" id="AgendaOK">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal" id="actionitemsModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button class="close pull-right" data-dismiss="modal" style="width: 5px;">&times;</button>
                                    <h4 class="modal-title">Action Items</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" id="tbladdActionItemsInfo" class="form-horizontal" method="post">
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="actionitemName">Action Item</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input type="text" class="form-control" id="actionitemName" placeholder="Action Item" />
                                                </div>
                                            </div>
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteResponsible">Responsible</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <div class="ui-widget">
                                                        <select id="txtAutoCompleteResponsible" class="form-control"></select>
                                                        <%--<input type="text" id="txtAutoCompleteResponsible" list="dlAutoCompleteResponsible" class="form-control" placeholder="Responsible Team/Member" />
                                                        <datalist id="dlAutoCompleteResponsible">
                                                        </datalist>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="duedate">Due Date</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input class="form-control" id="duedate" name="date" placeholder="MM/DD/YYY" type="text" />
                                                    <i class="glyphicon glyphicon-calendar form-control-feedback"></i>

                                                </div>
                                            </div>
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteStatus">Status</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <div class="ui-widget">
                                                        <input type="text" id="txtAutoCompleteStatus" list="dlAutoCompleteStatus" class="form-control" />
                                                        <datalist id="dlAutoCompleteStatus">
                                                            <option value="" selected disabled hidden></option>
                                                            <option value="Open">Open</option>
                                                            <option value="Close">Close</option>
                                                            <option value="Re-Assigned">Re-Assigned</option>
                                                            <option value="Deferred">Deferred</option>
                                                        </datalist>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="txtActionDiscussion">Discussion</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <textarea class="form-control col-xs-12" id="txtActionDiscussion" rows="5" maxlength="1000"></textarea>
                                                </div>
                                                <span id="remainingActionChars"></span>
                                            </div>
                                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                                <label class="control-label col-xs-12 col-sm-4" for="ClosedDate">Closed Date</label>
                                                <div class="form-group col-xs-12 col-sm-8">
                                                    <input class="form-control" id="ClosedDate" name="date" placeholder="MM/DD/YYY" type="text" />
                                                    <i class="glyphicon glyphicon-calendar form-control-feedback"></i>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <div class="table-responsive col-xs-12">
                                        <table id="tbladdActionItems" class="table table-responsive table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Action Item</th>
                                                    <th>Responsible</th>
                                                    <th>Due Date</th>
                                                    <th>Status</th>
                                                    <th hidden></th>
                                                    <th hidden></th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-primary btn-sm" id="Addaction">Add</button>
                                    <button class="btn btn-primary btn-sm" data-dismiss="modal" id="CancellationOK">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



        </div>
    </div>
    <!-- /page content -->
    <!-- jQuery -->
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <!-- Bootstrap -->
    <script src="Scripts/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="Scripts/fastclick.js"></script>
    <!-- NProgress -->
    <script src="Scripts/nprogress.js"></script>

    <script src="Libs/Chart.js/dist/Chart.min.js"></script>

    <script src="Libs/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <script src="Libs/iCheck/icheck.min.js"></script>

    <script src="Scripts/moment.min.js"></script>

    <script src="Scripts/daterangepicker.js"></script>

    <script src="Scripts/respond.min.js"></script>

    <!-- EChart-->
    <script src="Libs/echarts/dist/echarts.min.js"></script>

    <script src="Libs/Gentelella/js/custom.js"></script>
    <!--DataTable-->
    <script src="Libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>

    <%-- Bootstrap Toggle --%>
    <script src="Libs/bootstrap-toggle-master/js/bootstrap-toggle.min.js"></script>

    <%-- Datepicker --%>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <%-- Bootbox --%>
    <%--<script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>--%>

    <script>

        //$.extend({
        //    alert: function (message, title) {
        //        $("<div></div>").dialog({
        //            buttons: { "OK": function () { $(this).dialog("close"); } },
        //            close: function (event, ui) { $(this).remove(); },
        //            resizable: false,
        //            title: title,
        //            modal: true
        //        }).text(message);
        //    }
        //});





        $(document).ready(function () {
            var theme = {
                color: [
                    '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
                    '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
                ],

                title: {
                    itemGap: 8,
                    textStyle: {
                        fontWeight: 'normal',
                        color: '#408829'
                    }
                },

                dataRange: {
                    color: ['#1f610a', '#97b58d']
                },

                toolbox: {
                    color: ['#408829', '#408829', '#408829', '#408829']
                },

                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.5)',
                    axisPointer: {
                        type: 'line',
                        lineStyle: {
                            color: '#408829',
                            type: 'dashed'
                        },
                        crossStyle: {
                            color: '#408829'
                        },
                        shadowStyle: {
                            color: 'rgba(200,200,200,0.3)'
                        }
                    }
                },

                dataZoom: {
                    dataBackgroundColor: '#eee',
                    fillerColor: 'rgba(64,136,41,0.2)',
                    handleColor: '#408829'
                },
                grid: {
                    borderWidth: 0
                },

                categoryAxis: {
                    axisLine: {
                        lineStyle: {
                            color: '#408829'
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: ['#eee']
                        }
                    }
                },

                valueAxis: {
                    axisLine: {
                        lineStyle: {
                            color: '#408829'
                        }
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: ['#eee']
                        }
                    }
                },
                timeline: {
                    lineStyle: {
                        color: '#408829'
                    },
                    controlStyle: {
                        normal: { color: '#408829' },
                        emphasis: { color: '#408829' }
                    }
                },

                k: {
                    itemStyle: {
                        normal: {
                            color: '#68a54a',
                            color0: '#a9cba2',
                            lineStyle: {
                                width: 1,
                                color: '#408829',
                                color0: '#86b379'
                            }
                        }
                    }
                },
                map: {
                    itemStyle: {
                        normal: {
                            areaStyle: {
                                color: '#ddd'
                            },
                            label: {
                                textStyle: {
                                    color: '#c12e34'
                                }
                            }
                        },
                        emphasis: {
                            areaStyle: {
                                color: '#99d2dd'
                            },
                            label: {
                                textStyle: {
                                    color: '#c12e34'
                                }
                            }
                        }
                    }
                },
                force: {
                    itemStyle: {
                        normal: {
                            linkStyle: {
                                strokeColor: '#408829'
                            }
                        }
                    }
                },
                chord: {
                    padding: 4,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: 'rgba(128, 128, 128, 0.5)'
                            },
                            chordStyle: {
                                lineStyle: {
                                    width: 1,
                                    color: 'rgba(128, 128, 128, 0.5)'
                                }
                            }
                        },
                        emphasis: {
                            lineStyle: {
                                width: 1,
                                color: 'rgba(128, 128, 128, 0.5)'
                            },
                            chordStyle: {
                                lineStyle: {
                                    width: 1,
                                    color: 'rgba(128, 128, 128, 0.5)'
                                }
                            }
                        }
                    }
                },
                gauge: {
                    startAngle: 225,
                    endAngle: -45,
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
                            width: 8
                        }
                    },
                    axisTick: {
                        splitNumber: 10,
                        length: 12,
                        lineStyle: {
                            color: 'auto'
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            color: 'auto'
                        }
                    },
                    splitLine: {
                        length: 18,
                        lineStyle: {
                            color: 'auto'
                        }
                    },
                    pointer: {
                        length: '90%',
                        color: 'auto'
                    },
                    title: {
                        textStyle: {
                            color: '#333'
                        }
                    },
                    detail: {
                        textStyle: {
                            color: 'auto'
                        }
                    }
                },
                textStyle: {
                    fontFamily: 'Arial, Verdana, sans-serif'
                }
            };
            $(document).ready(function () {
                var date_input = $('input[name="date"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                var options = {
                    format: 'mm/dd/yyyy',
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                };
                date_input.datepicker(options);
            })

            var len = 0;
            var maxchar = 1000;

            $('#txtLocation').keyup(function () {
                len = this.value.length
                if (len > maxchar) {
                    return false;
                }
                else if (len > 0) {
                    $("#remaininglocationChars").html("Remaining characters: " + (maxchar - len));
                }
                else {
                    $("#remaininglocationChars").html("Remaining characters: " + (maxchar));
                }
            })

            var len1 = 0;
            var maxchar1 = 1000;

            $('#txtAgendaDiscussion').keyup(function () {
                len1 = this.value.length
                if (len1 > maxchar) {
                    return false;
                }
                else if (len1 > 0) {
                    $("#remainingAgendaChars").html("Remaining characters: " + (maxchar1 - len1));
                }
                else {
                    $("#remainingAgendaChars").html("Remaining characters: " + (maxchar1));
                }
            })

            var len2 = 0;
            var maxchar2 = 1000;

            $('#txtActionDiscussion').keyup(function () {
                len2 = this.value.length
                if (len2 > maxchar) {
                    return false;
                }
                else if (len2 > 0) {
                    $("#remainingActionChars").html("Remaining characters: " + (maxchar2 - len2));
                }
                else {
                    $("#remainingActionChars").html("Remaining characters: " + (maxchar2));
                }
            })



            

            //for Agenda

            $('#AgendaAdd').on('click', function () {

                if ($("#agendaTime").val() <= 0 || $("#agendaTopic").val().length == 0 || $("#txtAgendaRequestor").val() == -1 || $("#agendaPurpose").val().length == 0 || $("#txtAgendaDiscussion").val().length == 0) {
                    alert("Please fill in all the fields before submitting!!","error");
                }
                else {
                    $('#tbladdAgenda').append("<tr><td>" + $("#agendaTime").val() + "</td><td>" + $("#agendaTopic").val() + "</td><td>" + $("#txtAgendaRequestor").val() + "</td><td>" + $("#agendaPurpose").val() + "</td><td>" + $("#txtAgendaDiscussion").val() + "</td></tr>");
                    var tblAgenda = document.getElementById("tbladdAgenda");
                    for (var j = 0; j < tblAgenda.rows.length; j++) {
                        tblAgenda.rows[j].cells[3].style.display = "none";
                        tblAgenda.rows[j].cells[4].style.display = "none";
                    }
                    $("#formaddAgendaInfo")[0].reset();
                }
            });

            //for Action Item

            $('#Addaction').on('click', function () {

                if ($("#actionitemName").val().length == 0 || $("#txtAutoCompleteResponsible").val() == -1 || $("#duedate").val().length == 0 || $("#txtAutoCompleteStatus").val().length == 0 || $("#txtActionDiscussion").val().length == 0 || $("#ClosedDate").val().length == 0) {
                    alert("Please fill in all the fields before submitting!!");
                    
                }
                else {
                    $('#tbladdActionItems').append("<tr><td>" + $("#actionitemName").val() + "</td><td>" + $("#txtAutoCompleteResponsible").val() + "</td><td>" + $("#duedate").val() + "</td><td>" + $("#txtAutoCompleteStatus").val() + "</td></td>" + "</td><td>" + $("#txtActionDiscussion").val() + "</td><td>" + $("#ClosedDate").val() + "</td></tr>");
                    var tbl = document.getElementById("tbladdActionItems");
                    for (var i = 0; i < tbl.rows.length; i++) {
                        tbl.rows[i].cells[4].style.display = "none";
                        tbl.rows[i].cells[5].style.display = "none";
                    }
                    $("#tbladdActionItemsInfo")[0].reset();
                }
            });
        });
    </script>
</asp:Content>
