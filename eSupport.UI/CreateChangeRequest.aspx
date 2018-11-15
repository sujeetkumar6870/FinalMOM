<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreateChangeRequest.aspx.cs" Inherits="eSupport.UI.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <link href="Libs/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" />

     <!-- page content -->
            <div class="right_col" role="main">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Add new Change Request</h2>  
                            <input type="button" id="btnSaveChangeRequest" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" style="width:75px;"/>
                            <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>                            
                            <div class="clearfix"></div>
                        </div>                        
                        <div class="x_content"> 
                            <form role="form" id="SaveChangeRequestForm" class="form-horizontal" method="post">
                                        <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtChangeRequestId">Change RequestID</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" id="txtChangeRequestId" class="form-control" placeholder="Change RequestID"/>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="ddlChangeCategory">Category</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <select id="ddlChangeCategory" class="form-control">
                                                <option value="" selected disabled hidden>Change Category</option>
                                                <option value="normal">Normal</option>
                                                <option value="emergency">Emergency</option>
                                            </select>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="ddlChangePriority">Priority</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <select class="form-control" id="ddlChangePriority">
                                                    <option value="" selected disabled hidden>Change Priority</option>
                                                    <option value="1">1-Critical</option>
                                                    <option value="2">2-High</option>
                                                    <option value="3">3-Average</option>
                                                    <option value="4">4-Low</option>                                        
                                                 </select>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtChangeConfiguration">Configuration Item</label>                                        
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <input type="text" id="txtChangeConfiguration" list="dlAutoCompleteChangeConfiguration" class="form-control" placeholder="Change Configuration"/>
                                                <datalist id="dlAutoCompleteChangeConfiguration">                                           
                                                    <option value="iismagrey37">http://reports:iis:magrey37.boral.com.au</option>
                                                    <option value="online forms maintenance">online-forms(payroll,vendor-maintenance,network-account-creation) (bora)</option>
                                                    <option value="mwbndc11">ctx:mwbndc11.boral.com.au ctx:mwbndc50.boral.com.au ctx:mwbndc58.boral.com.au ctx:mwbndc70.boral.com.au</option>
                                                    <option value="hyperion">hyperion (bora)</option>
                                                </datalist>
                                            </div>
                                        </div>
                                    </div>  
                                        
                                <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="PlannedStartDate">Planned Start</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input class="form-control" id="PlannedStartDate" name="date" placeholder="MM/DD/YYY" type="text"/> 
                                                  <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="PlannedEndDate">Planned End</label>                                       
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <input class="form-control" id="PlannedEndDate" name="date" placeholder="MM/DD/YYY" type="text"/> 
                                                  <i class="glyphicon glyphicon-calendar form-control-feedback"></i>
                                            </div>
                                        </div>
                                    </div> 
                                <div class="row">
                                    <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="changeTitle">Title</label>                                        
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <input type="text" class="form-control" id="changeTitle" placeholder="Change Title" />
                                            </div>
                                        </div>
                                    <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="ddlChangePhase">Phase</label>                                        
                                           <div class="form-group col-xs-12 col-sm-8">
                                                <select class="form-control" id="ddlChangePhase">
                                                    <option value="" selected disabled hidden>Change Phase</option>
                                                    <option value="Approval">Approval Phase</option>
                                                    <option value="Implementation">Implementation Phase</option>                                                                                        
                                                 </select>
                                            </div>
                                        </div>
                                </div>

                                <div class="row">
                                     <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="txtAutoCompleteAffectedCI">Affected CI</label>
                                            <div class="form-group col-xs-12 col-sm-6">
                                                <input type="text" id="txtAutoCompleteAffectedCI" list="dlAutoCompleteAffectedCI" class="form-control" placeholder="Affected CI" />
                                                    <datalist id="dlAutoCompleteAffectedCI">
                                                        <option value="" selected disabled hidden></option>
                                                        <option></option>
                                                        <option value="Online Forms">Online Forms</option>
                                                        <option value="Credit Works Interface">Credit Works Interface</option>
                                                        <option value="CRM">CRM</option>
                                                        <option value="QRS">QRS</option>
                                                        <option value="ARS">ARS</option>
                                                        <option value="QIRS">QIRS</option>
                                                        <option value="SPP">SPP</option>
                                                        <option value="Online Plant Banking">Online Plant Banking</option>
                                                        <option value="Pacman">Pacman</option>
                                                        <option value="QRRT">QRRT</option>
                                                        <option value="Price Validation">Price Validation</option>
                                                        <option value="Purchasing Hub Portal">Purchasing Hub Portal</option>
                                                    </datalist>
                                            </div>
                                        </div>
                                    <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtAutoCompleteChangeAssignee">Assignee</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" id="txtAutoCompleteChangeAssignee" list="dlAutoCompleteChangeAssignee" class="form-control" placeholder="Assignee Name"/>
                                                <datalist id="dlAutoCompleteChangeAssignee">
                                                    <option></option>
                                                    <option value="Rajendra Rathod">Rajendra Rathod</option>
                                                    <option value="Pratheek Sehgal">Pratheek Sehgal</option>
                                                    <option value="Felvin Verghese">Felvin Verghese</option>
                                                    <option value="Pradeep Somani">Pradeep Somani</option>
                                                    <option value="Sabia Perveen">Sabia Perveen</option>
                                                    <option value="Rehan Shaik">Rehan Shaik</option>
                                                    <option value="Pallavi Bhatt">Pallavi Bhatt</option>
                                                    <option value="Sandeep Adode">Sandeep Adode</option>                                                    
                                                </datalist>
                                            </div>
                                        </div>
                                </div>
                                </form>                                                                                                                                                                                                                                                 
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

           
        });
    </script>
</asp:Content>
