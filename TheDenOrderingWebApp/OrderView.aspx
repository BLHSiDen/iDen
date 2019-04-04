<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="False" EnableSessionState="True" CodeBehind="OrderView.aspx.cs" Inherits="TheDenOrderingWebApp.OrderView" %>

<!DOCTYPE html>
<!-- UC: Uncomplete Orders
     WO: Working On Orders
     OB: Outbound Orders -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>iDen | OrderView</title>

    <link rel="shortcut icon" href="TheDen/img/theDenPaw.png"/>

    <!-- Bootstrap core CSS-->
    <link href="ViewOrdersBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom fonts for this template--\>
    <link href="ViewOrdersBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>

    <!-- Custom styles for this template-->
    <link href="ViewOrdersBootstrap/css/sb-admin.css" rel="stylesheet" />
</head>
<body style="background-image: url('TheDen/img/iDenBackground.jpg');">
    <form id="form1" runat="server">
     <div class="container" runat="server" id="loginModal" visible="true" style="padding-top:275px">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login - Order View</div>
        <div class="card-body">
           <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Email</label>
                    <input class="form-control" id="enteredEmail" type="text" runat="server" placeholder="Enter Email" />
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Password</label>
                    <input class="form-control" id="enteredPass" type="password" runat="server" placeholder="Enter Password" />
                    <p class="help-block text-danger"></p>
                </div>
            </div>
             <h3 class="alert-warning" runat="server" visible="false" id="errorLogin">Error</h3>
            <a class="btn btn-primary btn-block" id="loginBtn" runat="server" onserverclick="loginBtn_ServerClick">Login</a>
        </div>
      </div>
    </div>
    <!-- Buttons -->
    <div class="card card-login mx-auto mt-5" style="width:90%; max-width:1200px;" id="buttons" runat="server" visible="false"> 
        <div class="card-body">
        <div class="container"> 
            <div class="container" style="text-align:center;" >
                <input class="btn btn-primary btn-lg" type="button" value="Start Day" runat="server" id="btnStartDay" visible="true" onserverclick="btnStartDay_ServerClick"/>
                <input class="btn btn-primary" type="button" value="End Day" runat="server" id="btnEndDay" visible="false" onserverclick="btnEndDay_ServerClick"/>
            </div>
            <div runat="server" class="text-center m-auto" id="orderBTNs" visible="false" style="padding-top:25px">
                <a class="btn btn-primary btn-lg" id="unCompleteOrdersbtn" runat="server" onserverclick="unCompleteOrdersbtn_ServerClick">View Uncomplete Orders</a>
                <a class="btn btn-primary btn-lg" id="workOnOrdersbtn" runat="server" onserverclick="workOnOrdersbtn_ServerClick">View Working-on Orders</a>
                <a class="btn btn-primary btn-lg" id="outBoundOrdersbtn" runat="server" onserverclick="outBoundOrdersbtn_ServerClick">View Completed Orders</a>
            </div>
        </div>
        </div>
    </div>
    <!-- Uncomplete Orders -->
    <div class="container" runat="server" id="unCompleteOrders" visible="false" style="text-align:center">
        <div style="padding-top:100px;" id="UCtable">
        <label style="color:white;"> Uncomplete Orders  </label>
        <div class="container" style="text-align:center; width:800px; margin:0 auto; align-content:center">
                <a class="btn btn-primary btn-block" id="refreshBtnUC" runat="server" onserverclick="unCompleteOrdersbtn_ServerClick">Refresh</a>
                <asp:GridView ID="unCompleteOrdersTable" runat="server" AutoGenerateColumns="false" BackColor="White" HorizontalAlign="Center" >
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                    <asp:BoundField DataField="OrderItems" HeaderText="OrderItems" />
                    <asp:BoundField DataField="OrderSpecialties" HeaderText="OrderSpecialties" />
                    <asp:BoundField DataField="OrderType" HeaderText="OrderType" />
                    <asp:BoundField DataField="OrderDetails" HeaderText="OrderDetails" />
                    <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" />
                    <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" />
                </Columns>
            </asp:GridView>
         <div class="control-group" style="padding-top:25px">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label style="color: white; text-align:left">Order ID Number</label>
                    <input class="form-control" id="txtbxUCtoWO" type="text" runat="server" placeholder="Enter ID you're working on" />
                    <div style="align-content:center">
                        <button class="btn btn-primary" type="button" style="align-content:center" id="btnSendToWObefore" runat="server" onserverclick="btnSendToWObefore_ServerClick" >Send to Working On</button>
                    </div>
                    <p class="help-block text-danger"></p>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- Working On Orders -->
     <div class="container" runat="server" id="workingOnOrders" visible="false" style="text-align:center">
        <div style="padding-top:100px;" id="WOtable">
        <label style="color:white;"> Working On </label>
        <div class="container" style="text-align:center; width:800px; margin:0 auto; align-content:center">
                <a class="btn btn-primary btn-block" id="refreshBtnWO" runat="server" onserverclick="workOnOrdersbtn_ServerClick">Refresh</a>
                <asp:GridView ID="workingOnTable" runat="server" AutoGenerateColumns="false" BackColor="White" HorizontalAlign="Center" >
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                    <asp:BoundField DataField="OrderItems" HeaderText="OrderItems" />
                    <asp:BoundField DataField="OrderSpecialties" HeaderText="OrderSpecialties" />
                    <asp:BoundField DataField="OrderType" HeaderText="OrderType" />
                    <asp:BoundField DataField="OrderDetails" HeaderText="OrderDetails" />
                    <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" />
                    <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" />
                </Columns>
            </asp:GridView>
         <div class="control-group" style="padding-top:25px">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label style="color: white; text-align:left">Order ID Number</label>
                    <input class="form-control" id="inputWOtoOB" type="text" runat="server" placeholder="Enter ID that is done" />
                    <div style="align-content:center">
                        <button class="btn btn-primary" type="button" style="align-content:center" id="btnSendToOBbefore" runat="server" onserverclick="btnSendToOBbefore_ServerClick" >Send to Outbound Orders</button>
                    </div>
                    <p class="help-block text-danger"></p>
                </div>
            </div>
        </div>
        </div>
    </div>
    <!-- Outbound Orders -->
    <div class="container" runat="server" id="outboundOrders" visible="false" style="text-align:center">
        <div style="padding-top:100px;" id="OBtable">
        <label style="color:white;"> Complete Orders </label>
            <div class="container" style="text-align:center; width:800px; margin:0 auto; align-content:center">
                <a class="btn btn-primary btn-block" id="btnRefreshOB" runat="server" onserverclick="outBoundOrdersbtn_ServerClick">Refresh</a>
                <asp:GridView ID="outboundTable" runat="server" AutoGenerateColumns="false" BackColor="White" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" />
                    <asp:BoundField DataField="OrderItems" HeaderText="OrderItems" />
                    <asp:BoundField DataField="OrderSpecialties" HeaderText="OrderSpecialties" />
                    <asp:BoundField DataField="OrderType" HeaderText="OrderType" />
                    <asp:BoundField DataField="OrderDetails" HeaderText="OrderDetails" />
                    <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" />
                    <asp:BoundField DataField="CustomerPhone" HeaderText="CustomerPhone" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" />
                </Columns>
            </asp:GridView>
         <div class="control-group" style="padding-top:25px">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label style="color: white; text-align:left">Order ID Number</label>
                    <input class="form-control" id="inputDone" type="text" runat="server" placeholder="Enter ID that was delivered" />
                    <div style="align-content:center">
                        <button class="btn btn-primary" type="button" style="align-content:center" id="btnItemDelivered" runat="server" onserverclick=" btnOrderDoneBefore_ServerClick" >Order Delivered</button>
                    </div>
                    <p class="help-block text-danger"></p>
                </div>
            </div>
        </div>
        </div>
    </div>
     <!-- Confirm Move to WO from UC -->
     <div class="modal fade" id="confirmMoveUCtoWO" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Are You Sure?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="bodyconfirmMoveUCtoWO" runat="server" > Text </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" runat="server" onserverclick="btnSendToWO_ServerClick">Confirm</button>
          </div>
        </div>
        </div>
      </div>
    </div>
     <!-- Confirm Move to OB from WO -->
     <div class="modal fade" id="confirmWOtoOB" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Are You Sure?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="bodyconfirmWOtoOB" runat="server" > Text </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" runat="server" id="btnSendToOB" onserverclick="btnSendToOB_ServerClick">Confirm</button>
          </div>
        </div>
        </div>
      </div>
    </div>
    <!-- Confirm Item Delivered --> 
    <div class="modal fade" id="confirmOBtoDel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Are You Sure?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="bodyconfirmOBtoDel" runat="server" > Text </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" runat="server" id="btnOrderDone" onserverclick="btnOrderDone_ServerClick">Confirm</button>
          </div>
        </div>
        </div>
      </div>
    </div>
     <!-- Move Successful -->
     <div class="modal fade" id="moveSuccessful" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Done</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="moveSuccessfulBody" runat="server" > Order Successfully Moved! </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        </div>
      </div>
    </div>
        <!-- Move Error -->
         <div class="modal fade" id="moveError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Error</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="Label1" runat="server" > Error moving order! Try again... </label>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
            </div>
          </div>
        </div>
    <!-- Email Sent -->
     <div class="modal fade" id="emailSent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Done</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="Label2" runat="server" > An email with the day's report has been sent to "blhsTheDen@gmail.com" </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="ViewOrdersBootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="ViewOrdersBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="ViewOrdersBootstrapvendor/jquery-easing/jquery.easing.min.js"></script>

    </form>
</body>
</html>
