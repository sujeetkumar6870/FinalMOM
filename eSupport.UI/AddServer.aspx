<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddServer.aspx.cs" Inherits="eSupport.UI.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
      <!-- page content -->
            <div class="right_col" role="main">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Add Server</h2>  
                            <input type="button" id="btnSaveServerToDB" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" style="width:75px;"/>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">   
                            <div class="container">                                
                                    <form role="form" id="SaveServerForm" class="form-horizontal" method="post">
                                        <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtServerName">Name</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" class="form-control" id="txtServerName" placeholder="Server Name"/>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtServerIP">System IP</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <input type="text" id="txtServerIP" class="form-control" placeholder="System IP"/>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtServerOS">Operating System</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" class="form-control" id="txtServerOS" placeholder="Operating System"/>
                                            </div>
                                        </div>
                                         <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="ddlCPUCount">Number Of CPU's</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <select id="ddlCPUCount" class="form-control">
                                                <option value="" selected disabled hidden>Number of CPU's</option>
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
                                        </div>
                                    </div>
                                         <div class="row">
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="txtStorage">Storage</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                                <input type="text" class="form-control" id="txtStorage" placeholder="Storage in GB"/>
                                            </div>
                                        </div>
                                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                            <label class="control-label col-xs-12 col-sm-4" for="ddlServerType">Server Type</label>
                                            <div class="form-group col-xs-12 col-sm-8">
                                             <select id="ddlServerType" class="form-control">
                                                <option value="" selected disabled hidden>Type of Server</option>
                                                <option value="Application">Application Server</option>
                                                <option value="Database">Database Server</option>                                                
                                            </select>
                                            </div>
                                        </div>
                                        </div>

                                    </form>                               
                            </div>
                           
                            <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>                            
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
                    
            
        });
    </script>
</asp:Content>
