<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="eSupport.UI.WebForm17" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="Libs/bootstrap-toggle-master/css/bootstrap-toggle.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript">      

        function SaveUserRecord() {

            var UserBO = {};

            UserBO.EmpID = $.trim($('#numEmployeeID').val());
            //var EmpID = $.trim($('#numEmployeeID').val());
            UserBO.UserName = $.trim($('#txtUsername').val());
            UserBO.EmailID = $.trim($('#txtemailID').val());
            UserBO.Contact = $.trim($('#telContactNo').val());
            UserBO.Location = $.trim($('#txtUserLocation').val());
            UserBO.HP_UserID = $.trim($('#txtHPUserID').val());
            UserBO.HP_EmailID = $.trim($('#txtHPEmailID').val());
            UserBO.HP_Domain = $.trim($('#txtHPDomain').val());
            UserBO.HP_UserName = $.trim($('#txtHPUsername').val());
            UserBO.LaptopMfgSr = $.trim($('#txtLaptopMfrSr').val());

            var jSonData = JSON.stringify({ UserBO: UserBO });

            var Message = "";
            if (UserBO.EmpID == "") {
                Messsage = "ID cannot be blank";
            }
            if (Message.length == 0) {
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    url: 'AddUser.aspx/AddUserDetails',
                    data: jSonData,
                    datatype: "json",
                    success: function (Record) {
                        alert("data has been added successfully");
                        $("#SaveUserForm")[0].reset();
                    }
                });
            }
        }
    </script>
    <!-- page content -->
    <div class="right_col" role="main">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Add User</h2>
                    <input type="button" id="btnAddUserToDB" class="btn btn-primary btn-round btn-sm pull-right" value="Submit" runat="server" style="width: 75px;" onclick="SaveUserRecord(); return false" />
                    <%--<a href="#" class="btn btn-primary btn-round btn-sm pull-right" style="width:75px;">Submit</a>--%>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <form role="form" id="SaveUserForm" class="form-horizontal" method="post">
                        <div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="EmployeeID">Employee ID</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="number" class="form-control" id="numEmployeeID" max="12" />
                                </div>
                            </div>
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="Username">Username</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="text" class="form-control" id="txtUsername" placeholder="Username" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="emailID">Email ID</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="email" class="form-control" id="txtemailID" placeholder="xxxxxx.xxxxxx@mphasis.com" />
                                </div>
                            </div>


                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="ContactNo">Contact Number</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="tel" class="form-control" id="telContactNo" name="telContactNo" placeholder="+91 XXXXX XXXXX" title="telContactNo" required pattern="/^+91(7\d|8\d|9\d)\d{9}$/" size="15" maxlength="15">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="UserLocation">Location</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <textarea id="txtUserLocation" class="form-control" maxlength="4000" rows="5" placeholder="User Location"></textarea>
                                </div>
                                <br />
                                <span id='remainingLocationChars' class="col-xs-offset-1 col-sm-offset-5"></span>
                            </div>
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="hpUserID">HP UserID</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="number" class="form-control" id="txtHPUserID">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="HPEmailID">HP EmailID</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="email" class="form-control" title="txtHPEmailID" id="txtHPEmailID" placeholder="xxxxxxx.xxxxxxx@hpe.com" />
                                </div>
                            </div>
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="HPDomain">HP Domain</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="text" class="form-control" id="txtHPDomain" placeholder="Domain Name. Ex:ASIAPACIFIC">
                                </div>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="txtHPSMName">HP Name</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="text" class="form-control" id="txtHPSMName" placeholder="HPSM Name" />
                                </div>
                            </div>
                        </div>--%>

                        <div class="row">
                            <div class="form-group form-horizontal col-xs-12 col-sm-6">
                                <label class="control-label col-xs-12 col-sm-4" for="HPUsername">HP Username</label>
                                <div class="form-group col-xs-12 col-sm-8">
                                    <input type="text" class="form-control" id="txtHPUsername" placeholder="HP Username" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-horizontal col-xs-12 col-sm-6">
                            <label class="control-label col-xs-12 col-sm-4" for="LaptopMfrSr">Laptop SrNo</label>
                            <div class="form-group col-xs-12 col-sm-8">
                                <input type="text" class="form-control" id="txtLaptopMfrSr" placeholder="xxxxxxxxxx">
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

            $('#txtUserLocation').keyup(function () {
                len = this.value.length
                if (len > maxchar) {
                    return false;
                }
                else if (len > 0) {
                    $("#remainingLocationChars").html("Remaining characters: " + (maxchar - len));
                }
                else {
                    $("#remainingLocationChars").html("Remaining characters: " + (maxchar));
                }
            })


        });
    </script>
</asp:Content>
