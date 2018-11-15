<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eSupport.UI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>e-Support</title>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <link href="Content/nprogress.css" rel="stylesheet" />

    <link href="Libs/Gentelella/css/custom.css" rel="stylesheet" />

    <link href="Libs/iCheck/skins/flat/green.css" rel="stylesheet" />

    <link href="Libs/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" />

    <link href="Libs/animate.css/animate.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">                
                    <section class="">
                        <h1>e-Support</h1>
                        <div>
                            <input type="text" class="form-control" placeholder="Username" required="" /><br />
                        </div>
                        <div>
                            <input type="password" class="form-control" placeholder="Password" required="" /><br />
                        </div>
                        <br />
                        <div>
                            <a class="btn btn-default submit" href="WebForm1.aspx">Log in</a>
                            <a class="reset_pass" href="#">Lost your password?</a>
                        </div>

                        <div class="clearfix"></div>

                        <div class="separator">
                        
                            <div class="clearfix"></div>
                            <br />

                            <div>                                
                                <p>©2017 All Rights Reserved. Designed and developed by Boral App Support Team</p>
                            </div>
                        </div>
                    </section>
                

                
            </div>
        </div>
    </form>
</body>
</html>
