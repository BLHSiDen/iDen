<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherPortal.aspx.cs" Inherits="TheDenOrderingWebApp.TeacherPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>iDen | Teacher Portal</title>
    <!-- Bootstrap core CSS -->
    <link href="TheDen/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Custom fonts for this template -->
    <link href="TheDen/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- Plugin CSS -->
    <link href="TheDen/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image: url('TheDen/img/iDenBackground.jpg');">
    <form id="form1" runat="server">
<!--Teacher Login ------------------------------------------------------------------------------->
    <div class="container align-content-center" style="padding-top:200px" runat="server" id="loginModal" visible="true">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header text-center">Login - Teacher Portal</div>
        <div class="card-body">
           <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Email</label>
                    <input class="form-control text-center" id="enteredEmail" type="text" runat="server" placeholder="Enter Email" />
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Password</label>
                    <input class="form-control text-center" id="enteredPass" type="password" runat="server" placeholder="Enter Password" />
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="text-center align-content-center">
                <h3 class="alert-warning" runat="server" visible="false" id="errorLogin">Error</h3>
                <a class="btn btn-primary text-center align-content-center font-weight-bold" style="padding-bottom: 10px; color:#fff" id="loginBtn" runat="server">Login</a>
            </div>
        </div>
      </div>
    </div>
    </form>
</body>
</html>
