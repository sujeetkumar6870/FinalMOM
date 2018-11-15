<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="eSupport.UI.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <link href="Libs/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" />

     <!-- page content -->
            <div class="right_col" role="main">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Add Minutes Of Meeting</h2>  
                            <input type="button" id="btnSaveMOMToDB" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" style="width:75px;"/>
                            <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>                            
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content"> 
                            <div class="container">
                                <div class="row">
                                    <form role="form" id="SaveMOMForm" method="post">
                                        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
                                            <label for="txtMeetingdate">Meeting Date</label>
                                            
                                              <div class="form-group"> <!-- Date input -->                                                
                                                <input class="form-control" id="txtMeetingdate" name="date" placeholder="MM/DD/YYY" type="text"/> 
                                                  <i class="fa fa-calendar form-control-feedback"></i>
                                              </div>                                              
                                       
                                        </div>

                                        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4 pull-right">
                                            <label for="txtMOMTitle">Title</label>
                                            <input type="text" id="txtMOMTitle" class="form-control" maxlength="100"/>
                                        </div>

                                        <div class="clearfix"></div>

                                        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
                                            <label for="txtServerOS">Operating System</label>
                                            <input type="text" id="txtServerOS" class="form-control"/>
                                        </div>                                      
                                        
                                        <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4 pull-right">
                                            <label for="ddlCPUCount">Number Of CPU's</label>
                                            <select id="ddlCPUCount" class="form-control">
                                                <option value="" selected disabled hidden>Select Value</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="3">6</option>
                                                <option value="4">7</option>
                                                <option value="5">8</option>
                                            </select>
                                        </div>

                                        <div class="clearfix"></div>

                                           <div class="form-group col-xs-10 col-sm-4 col-md-4 col-lg-4">
                                            <label for="txtStorage">Storage in GigaBytes</label>
                                            <input type="text" id="txtStorage" class="form-control"/>
                                            </div>

                                        <div class="clearfix"></div>

                                    </form>
                                </div>
                            </div>





                            <table id="SaveMOMTable" class="table table-striped">
                                                                                                                    
                                <tr>                                    
                                    <td><button class="btn btn-primary pull-left" data-target="#attendeeModal" data-toggle="modal" style="width:130px;">Attendee
                                <i class="fa fa-plus-square-o fa-lg"></i></button></td>
                                    <td></td>
                                </tr>                                
                                <tr>                                    
                                    <td><button class="btn btn-primary pull-left" data-target="#agendaModal" data-toggle="modal" style="width:130px;">Agenda
                                <i class="fa fa-plus-square-o fa-lg"></i></button></td>
                                    <td></td>
                                </tr>
                                <tr>                                    
                                    <td><button class="btn btn-primary pull-left" data-target="#actionitemsModal" data-toggle="modal" style="width:130px;">Action Items
                                <i class="fa fa-plus-square-o fa-lg"></i></button></td>
                                    <td></td>
                                </tr>
                            </table>                                                        
                        </div> 
                        <div class="modal" id="attendeeModal" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button class="close pull-right" data-dismiss="modal" style="width:5px;">&times;</button>
                                            <h4 class="modal-title">Attendance</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="table-responsive">
                                                <table id="addAttendeeInfo" class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr>                                                            
                                                            <th>Attendee Name</th>
                                                            <th>Attendee Present</th>                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>                                                            
                                                            <td>Rajendra Rathod</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Pratheek Sehgal</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Felvin Verghese</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Pradeep Somani</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Sabia Perveen</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Rehan Shaik</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Pallavi Bhatt</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                        <tr>                                                            
                                                            <td>Sandeep Adode</td>
                                                            <td><input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini"/></td>                                                            
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>                                            
                                        </div>
                                        <div class="modal-footer">                                            
                                            <button class="btn btn-primary btn-sm" id="OK1">OK</button>
                                            <button class="btn btn-primary btn-sm" data-dismiss="modal" id="Cancel1">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="modal" id="agendaModal" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width:800px;height:550px;overflow-y:scroll;overflow-x:scroll;">
                                            <div class="modal-header">
                                                <button class="close pull-right" data-dismiss="modal" style="width:5px;">&times;</button>
                                                <h4 class="modal-title">Agenda</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="table-responsive">
                                                
                                                    <table id="tbladdAgendaInfo" class="table table-bordered table-striped">
                                                        <tr>
                                                            <td>Time in minutes</td>
                                                            <td><input type="text" class="form-control" id="agendaTime" /></td>
                                                        </tr>   
                                                        <tr>
                                                            <td>Topic</td>
                                                            <td><input type="text" class="form-control" id="agendaTopic" /></td>
                                                        </tr>   
                                                        <tr>
                                                            <td>Requestor</td>
                                                            <td><div class="ui-widget">                                            
                                                <input type="text" id="txtAutoCompleteRequestor" list="dlAutoCompleteRequestor" class="form-control"/>
                                                    <datalist id="dlAutoCompleteRequestor">
                                                        <option value="" selected disabled hidden></option>
                                                        <option value="Rajendra Rathod">Rajendra Rathod</option>
                                                        <option value="Pratheek Sehgal">Pratheek Sehgal</option>
                                                        <option value="Felvin Verghese">Felvin Verghese</option>
                                                        <option value="Pradeep Somani">Pradeep Somani</option>
                                                        <option value="Sabia Perveen">Sabia Perveen</option>
                                                        <option value="Rehan Shaik">Rehan Shaik</option>
                                                        <option value="Pallavi Bhatt">Pallavi Bhatt</option>
                                                        <option value="Sandeep Adode">Sandeep Adode</option>                                                    
                                                    </datalist>                                              
                                             </div></td>
                                                        </tr>   
                                                        <tr>
                                                            <td>Purpose</td>
                                                            <td><input type="text" class="form-control" id="agendaPurpose" /></td>
                                                        </tr>   
                                                        <tr>
                                                            <td>Discussion</td>
                                                            <td><textarea class="form-control" id="txtDiscussion" rows="5" maxlength="1000"></textarea></td>
                                                        </tr>   
                                                    </table>
                                                </div>                                            
                                            </div>
                                            <div class="modal-footer">
                                                <table id="tbladdAgenda" class="table table-bordered table-striped">
                                                    <thead>
                                                       <tr>
                                                           <th style="width:50px;">Time</th>
                                                           <th style="width:auto;">Topic</th>
                                                           <th style="width:150px;">Responsible</th>                                                                                                                      
                                                       </tr>                                                
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                        <tr>
                                                            <td>5</td>
                                                            <td>Hello World</td>
                                                            <td>Pratheek Sehgal</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <button class="btn btn-primary btn-sm" id="OK">OK</button>
                                                <button class="btn btn-primary btn-sm" data-dismiss="modal" id="Cancel">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <div class="modal" id="actionitemsModal" tabindex="-1">
                                    <div class="modal-dialog" >
                                        <div class="modal-content" style="width:800px;height:550px;overflow-y:scroll;overflow-x:scroll;">
                                            <div class="modal-header">
                                                <button class="close pull-right" data-dismiss="modal" style="width:5px;">&times;</button>
                                                <h4 class="modal-title">Action Items</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="table-responsive">
                                                
                                                    <table id="tbladdActionItemsInfo" class="table table-bordered table-striped">
                                                        <tr>
                                                            <td>Action Item</td>
                                                            <td><input type="text" class="form-control" id="actionitemName" /></td>
                                                        </tr>   
                                                        <tr>
                                                            <td>Responsible</td>
                                                            <td><div class="ui-widget">                                            
                                                                    <input type="text" id="txtAutoCompleteResponsible" list="dlAutoCompleteResponsible" class="form-control"/>
                                                                        <datalist id="dlAutoCompleteResponsible">
                                                                            <option value="" selected disabled hidden></option>
                                                                            <option value="Project Manager">Project Manager</option>
                                                                            <option value="Support Team">Support Team</option>                                                                                                                                                                                                      
                                                                        </datalist>                                              
                                                                 </div>
                                                            </td>
                                                        </tr> 
                                                        <tr>
                                                            <td>Due Date</td>
                                                            <td><form method="post" class="form-group has-feedback">
                                                                      <div class="form-group"> <!-- Date input -->                                                
                                                                        <input class="form-control" id="duedate" name="date" placeholder="MM/DD/YYY" type="text"/> 
                                                                          <i class="fa fa-calendar form-control-feedback"></i>
                                                                      </div>                                              
                                                                </form> 
                                                           </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Status</td>
                                                            <td><div class="ui-widget">                                            
                                                                    <input type="text" id="txtAutoCompleteStatus" list="dlAutoCompleteStatus" class="form-control"/>
                                                                        <datalist id="dlAutoCompleteStatus">
                                                                            <option value="" selected disabled hidden></option>
                                                                            <option value="Open">Open</option>
                                                                            <option value="Close">Close</option>                                                                                                                          
                                                                            <option value="Re-Assigned">Re-Assigned</option>
                                                                            <option value="Deferred">Deferred</option>
                                                                        </datalist>                                              
                                                                 </div>
                                                            </td>
                                                        </tr>                                                         
                                                    </table>
                                                </div>                                            
                                            </div>
                                            <div class="modal-footer">
                                                 <table id="tbladdActionItems" class="table table-bordered table-striped">
                                                    <thead>
                                                       <tr>
                                                           <th>Action Item</th>
                                                           <th>Responsible</th>
                                                           <th>Due Date</th>
                                                           <th>Status</th>
                                                       </tr>                                                
                                                    </thead>
                                                </table>
                                                <button class="btn btn-primary btn-sm" id="OKaction">OK</button>
                                                <button class="btn btn-primary btn-sm" data-dismiss="modal" id="Cancelaction">Cancel</button>
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
    <script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>

    <script>
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

        });
    </script>
</asp:Content>
