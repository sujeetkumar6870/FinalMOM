<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddApplication.aspx.cs" Inherits="eSupport.UI.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <link href="Libs/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" />
        <!-- page content -->
            <div class="right_col" role="main">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Add Application</h2> 
                            <input type="button" id="btnSaveApplicationToDB" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" style="width:75px;"/>
                            <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">                                                
                            <div class="container">
                                <form role="form" id="SaveApplicationForm" class="form-horizontal" method="post">
                                    <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="txtApplicationName">Name</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" class="form-control" id="txtApplicationName" placeholder="Application Name"/>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="ddlTechnology">Technology</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <select id="ddlTechnology" class="form-control">
                                                <option value="" selected disabled hidden>Application Technology</option>
                                                <option value="DotNet">DotNet</option>
                                                <option value="Oracle">Oracle</option>
                                                <option value="Javascript">Javascript</option>
                                                <option value="Ajax">Ajax</option>
                                                <option value="C#">C#</option>
                                            </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="ddlApplicationType">Type</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                               <select id="ddlApplicationType" class="form-control">
                                                <option value="" selected disabled hidden>Application Type</option>
                                                <option value="Console Application">Console Application</option>
                                                <option value="Web Service">Web Service</option>
                                                <option value="Web Application">Web Application</option>                                            
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="checkIsCritical">Is Critical</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-size="mini" id="checkIsCritical"/> 
                                            </div>
                                        </div>
                                    </div>

                                     <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="txtApplicationDescription">Description</label><span id="remainingChars"></span>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <textarea class="form-control" id="txtApplicationDescription" rows="5" maxlength="4000" placeholder="Application Description"></textarea>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-4" for="txtAutoCompleteParentApplication">Parent Application</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" id="txtAutoCompleteParentApplication" list="dlAutoCompleteParentApplications" class="form-control" placeholder="Parent Application"/>
                                                    <datalist id="dlAutoCompleteParentApplications">
                                                        <option value="" selected disabled hidden></option>
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
                                            <label class="control-label col-xs-4" for="txtApplicationURL">Application URL</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" id="txtApplicationURL" class="form-control" placeholder="Application URL" />
                                            </div>
                                        </div>                                       
                                    </div>
                                </form>
                                <div class="clearfix"></div>
                                <hr />
                                
                                <div class="row">
                                <label class="control-label col-xs-6 col-sm-8 col-md-8 col-lg-8" for="envTable">Environment Details</label>
                                  <button class="btn btn-primary col-xs-offset-3 col-xs-2 col-sm-2 col-md-2 col-lg-2" data-target="#envModal" data-toggle="modal" style="width:45px;">
                                <i class="fa fa-plus-square-o fa-lg"></i></button>
                                    </div>
                                <div class="table-responsive">                                    
                                    <table id="envTable" class="table table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>S.No</th>
                                                <th>Environment Type</th>
                                                <th>Server Type</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>gdsffhdsbjdhvbhvbbffvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbfvdfbsbjkbjvbjbjhvfjvvbvjbvbvbvjbvjbvjkbjvbbvvjjbvjbvbvjvjvbv</td>
                                                <td>dsbfjbdsbdsbfbkvbkfvkfvjbfvjbsjbbssbvkvkjnvslsbvlbslblbisdfkhifbifbvkbfbvb</td>
                                            </tr>
                                        </tbody>
                                    </table>                                
                                    </div> 
                                </div>                                                                                  
                        </div>
                        </div>
                            <div class="modal" id="envModal" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button class="close pull-right" data-dismiss="modal" style="width:5px;">&times;</button>
                                            <h4 class="modal-title">Environment Details</h4>
                                        </div>
                                        <div class="modal-body">
                                            <form role="form" class="form-horizontal">
                                                <div class="form-group">
                                                    <label for="ddlenvType" id="envType">Environment Type</label>                                                    
                                                    <select id="ddlenvType" class="form-control">
                                                        <option value="" selected disabled hidden>Environment Type</option>
                                                        <option value="Production">Production</option>
                                                        <option value="Test/UAT">Test/UAT</option>
                                                        <option value="Development">Development</option>                                                        
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtServerType" id="serverType">Server Type</label>
                                                    <input class="form-control" placeholder="Server Type" list="dlAuto" type="text" id="txtServerType" />
                                                    <datalist id="dlAuto">
                                                        <option value="" selected disabled hidden></option>
                                                        <option value="MAGREY36">MAGREY36</option>
                                                        <option value="MAGREY37">MAGREY37</option>
                                                        <option value="VAGREY36">VAGREY36</option>
                                                        <option value="VAGREY37">VAGREY37</option>                                                        
                                                    </datalist>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-primary btn-sm" id="OK">OK</button>
                                            <button class="btn btn-primary btn-sm" data-dismiss="modal" id="Cancel">Cancel</button>
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

            var len = 0;
            var maxchar = 4000;

            $('#txtApplicationDescription').keyup(function () {
                len = this.value.length
                if (len > maxchar) {
                    return false;
                }
                else if (len > 0) {
                    $("#remainingChars").html("Remaining characters: " + (maxchar - len));
                }
                else {
                    $("#remainingChars").html("Remaining characters: " + (maxchar));
                }
            })
                    
            
        });
    </script>
</asp:Content>

