<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MOM.aspx.cs" Inherits="eSupport.UI.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: 'MOM.aspx/BindMOMTable',
                data: "{}",
                dataType: 'json',
                dataSrc:"",
                success: function (data) {    
                  
                    var result = JSON.parse(data.d);

                    $('#datatable-meeting').find('tbody').empty();
                     for (var i = 0; i < result.length; i++) {
                         $('#datatable-meeting').append("<tr><td>" + result[i].tempDate + "</td><td>" + result[i].Title + "</td><td>" + result[i].tempFacilitator + "</td><td>" + result[i].tempRecorder + "</td><td>" + result[i].LocationDetails + "</td></tr>");
                    }
                    $('#datatable-meeting').dataTable({
                         dom: 'Bfrtip',
                         buttons: [{
                             extend: 'copy',
                             text: 'Copy',
                             className: 'btn-sm'
                         },
                         {
                             extend: 'csv',
                             text: 'CSV File',
                             className: 'btn-sm'

                         },
                         {
                             extend: 'print',
                             text: 'Print',
                             className:'btn-sm'
                         },
                         {
                             extend: 'excel',
                             text: 'Get Excel',
                             className: 'btn-sm'
                         },
                         {
                             extend: 'pdfHtml5',
                             text: 'PDF',
                             className: 'btn-sm'
                         }
                         ]                  
                    });
                }          
            });  
        });

</script>

    <%--<style type="text/css">
        @media screen and (min-width: 769px) {

            td {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

            table {
                table-layout: fixed;
                width: 100%;
            }
        }
    </style>--%>
    <!-- page content -->
    <div class="right_col" role="main">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>List of MOM's</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li>
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">Settings 1</a>
                                </li>
                                <li>
                                    <a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="table-responsive col-xs-12">
                        <table id="datatable-meeting" class="table table-responsive table-striped table-bordered">
                            <tr>
                                <th colspan="6" style="font-weight: bolder;">1. MEETING AGENDA AND MINUTES</th>
                            </tr>
                            <tr>
                                <th>Meeting Date</th>
                                <td colspan="2"></td>
                                <th>Sample Header</th>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th>Facilitator</th>
                                <td colspan="2"></td>
                                <th>Recorder</th>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <th colspan="2">Location/Teleconference Details</th>
                                <td colspan="4"></td>
                            </tr>
                            <tr style="border-right:hidden;border-left:hidden;"><td colspan="6"></td></tr>
                            <tr>
                                <th colspan="6">2. DISTRIBUTION AND ATTENDEE LIST</th>
                            </tr>
                            <tr>
                                <th colspan="3">
                                    <label>Attendee Name</label>
                                </th>

                                <th colspan="3">
                                    <label>Attendance Status</label>
                                </th>
                            </tr>
                            <tbody id="#rowAttendance"></tbody>
                            
                            <tr style="border-right:hidden;border-left:hidden;"><td colspan="6"></td></tr>
                            <tr>
                                <th colspan="6">3. AGENDA</th>
                            </tr>
                            <tr>
                                <th>No.</th>
                                <th colspan="3">Topic</th>
                                <th colspan="2">Responsible</th>
                            </tr>
                            <tbody id="#rowAgenda"></tbody>
                            
                            <tr style="border-right:hidden;border-left:hidden;"><td colspan="6"></td></tr>
                            <tr>
                                <th colspan="6">4. ANNOTATED AGENDA AND MINUTES</th>
                            </tr>
                            <tbody id="#rowAgendaAnnotation"></tbody>
                            
                            <tr style="border-right:hidden;border-left:hidden;"><td colspan="6"></td></tr>
                            <tr>
                                <th colspan="6">5. ACTION ITEMS</th>
                            </tr>
                            <tr>
                                <th>AI No.</th>
                                <th>Action Item</th>
                                <th>Responsible</th>
                                <th>Due Date</th>
                                <th>Status</th>
                                <th>Date Closed</th>
                            </tr>
                            <tbody id="#rowActionItem"></tbody>
                        </table>
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
    <script src="Libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    
</asp:Content>
