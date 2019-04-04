<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Work.aspx.cs" Inherits="TheDenOrderingWebApp.Work" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title runat="server" id="title123">Workers Tool</title>

    <!-- Bootstrap core CSS-->
    <link href="ViewOrdersBootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom fonts for this template-->
    <link href="ViewOrdersBootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>

    <!-- Custom styles for this template-->
    <link href="ViewOrdersBootstrap/css/sb-admin.css" rel="stylesheet" />

    <link rel="shortcut icon" href="TheDen/img/theDenPaw.png"/>

</head>
<body style="background-image: url('TheDen/img/iDenBackground.jpg');">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <!-- Login -->
     <div class="container" runat="server" id="loginModal" visible="true">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login - Workers Tool</div>
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
    <div class="card card-login mx-auto mt-5" id="buttons" runat="server" visible="false"> 
        <div class="card-body">
        <div class="container"> 
            <div runat="server" id="orderBTNs">
                <a class="btn btn-primary btn-block text-uppercase" style="font-weight:bold" id="addBalance" runat="server" onserverclick="addBalance_ServerClick">Add Money To Account</a>
                <a class="btn btn-primary btn-block text-uppercase" style="font-weight:bold" id="setMembership" runat="server" onserverclick="setMembership_ServerClick">Membership</a>
                <a class="btn btn-primary btn-block text-uppercase" style="font-weight:bold" id="drinks" runat="server" onserverclick="drinks_ServerClick">Drinks</a>
            </div>
        </div>
        </div>
    </div>
   <!-- Update Progress -->
         <div class="modal fade" id="updateProgressModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Deal Update Progress</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="labelProgressBody" runat="server" > Error moving order! Try again... </label>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
            </div>
          </div>
        </div>
    <!-- Add Money -->
         <div class="modal fade" id="addMoneyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Add Money To Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label runat="server" id="test"> Select Account Look-Up Option: </label>
                       <select class="custom-select" id="accountLookup" onchange="showInfo()" runat="server">
                              <option> </option>
                              <option value="Username">Username</option>
                              <option value="Email">Email</option>
                          </select>
                   <div id="usernameInfo" style="visibility:hidden; display:none; padding-top: 10px" runat="server">
                      <label id="username">Username: </label>
                      <input class="form-control" id="txtbxUsername" type="text" runat="server" placeholder="Enter Username"/>
                  </div>
                  <div id="emailInfo" style="visibility:hidden; display:none; padding-top: 10px" runat="server">
                      <label id="email">Email: </label>
                      <input class="form-control" id="txtbxEmail" type="text" runat="server" placeholder="Enter Email"/>
                  </div>
                  <div style="padding-top:15px; padding-bottom:15px">
                    <div style="padding-bottom: 20px">
                   <select class="custom-select" id="selectAddSet" onchange="showSelectedMoney()" runat="server">
                       <option> </option> 
                       <option value="addMoney"> Add Money To Account </option>
                        <option value="setMoney"> Set Account Balance </option>
                    </select>
                    </div>
                    <div id="setAmountSection" style="visibility:hidden; display:none;">
                        <label id="lblSetMoney">Set Account Balance: </label>
                        <input class="form-control" id="txtbxAddAmount" type="text" runat="server" placeholder="$Amount"/>
                    </div>
                    <div id="addAmountSection"  style="visibility:hidden; display:none">
                        <label id="lblAddMoney">Add Amount To Account: </label>
                        <input class="form-control" id="txtbxAmountAdded" type="text" runat="server" placeholder="$Amount"/>
                    </div>
                  </div>
              <div class="modal-footer">
                 <h3 class="alert-warning" runat="server" visible="false" id="error">Account not found</h3>
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" id="addMoney" class="btn btn-success" data-dismiss="modal" runat="server" onserverclick="addMoney_ServerClick">Add Money</button>
              </div>
            </div>
            </div>
          </div>
        </div>
   <!-- Add Successful -->
         <div class="modal fade" id="addSuccessful" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Money Added</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="label1" runat="server" >Money was added to the account!</label>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
            </div>
          </div>
        </div>
    <!-- Add Failed -->
         <div class="modal fade" id="addError" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Error</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="label2" runat="server" >There was an error. Either user doesn't exist, or something went wrong</label>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
            </div>
          </div>
        </div>
    <!-- Confirm -->
         <div class="modal fade" id="confirmAddMoney" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Please Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="" style="visibility:hidden; display:none"></label>
                <label id="confirmationMessage" runat="server">Please confirm the addition of $_.__ to _'s account </label>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="addMoneyToAccount" runat="server" onserverclick="addMoneyToAccount_ServerClick">Confirm</button>
              </div>
            </div>
            </div>
          </div>
<!-- Membership --------------------------------------->
         <div class="modal fade" id="membershipModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Membership</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label> What Do You Want To Do? </label>
                <select id="selectDoWhat" onchange="membShow()">
                    <option></option>
                    <option value="set">Set Account Membership</option>
                    <option value="default">Default Register Membership</option>
                </select> 
              <div id="setMemb" style="visibility:hidden; display:none">
                <label runat="server" id="selectLookupSect"> Select Account Look-Up Option: </label>
                       <select class="custom-select" id="selectLookup" onchange="membershipShowInfo()" runat="server">
                              <option> </option>
                              <option value="All"> All </option>
                              <option value="Username">Username</option>
                              <option value="Email">Email</option>
                          </select>
                   <div id="usernameSect" style="visibility:hidden; display:none; padding-top: 10px" runat="server">
                      <label>Username: </label>
                      <input class="form-control" id="txtbxMembUsername" type="text" runat="server" placeholder="Enter Username" />
                  </div>
                  <div id="emailSect" style="visibility:hidden; display:none; padding-top: 10px" runat="server">
                      <label>Email: </label>
                      <input class="form-control" id="txtbxMembEmail" type="text" runat="server" placeholder="Enter Email"/>
                  </div>
                  <div style="padding-top:15px; padding-bottom:15px">
                    <div style="padding-bottom: 20px">
                   <select class="custom-select" id="selectMembershipType" onchange="totalChange()" runat="server">
                       <option> </option> 
                       <option value="None"> None </option>
                       <option value="Green"> Green </option>
                       <option value="Gold"> Gold </option>
                    </select>
                    </div>
                      <label id="membTotal" runat="server"> Total:  </label>
                      <div id="sendEmailSect">
                          <div style="padding-left:175px">
                            <input type="checkbox" id="checkSendEmail" runat="server" onclick="checkClicked()" />
                            <label> Send Email </label>
                          </div>
                          <textarea style="visibility:hidden; display:none" runat="server" class="form-control" rows="5" id="emailContent"></textarea>
                      </div>
                  </div>
               </div>
               
              <div class="modal-footer">
                 <h3 class="alert-warning" runat="server" visible="false" id="H1">Account not found</h3>
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
                <button type="button" id="Button1" class="btn btn-success" data-dismiss="modal" runat="server" onserverclick="Button1_ServerClick">Set Membership</button>
              </div>
            </div>
            </div>
          </div>
        </div>
<!-- Update Drinks ------------------------------------------->
         <div class="modal fade" id="drinksModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Update Drinks</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div style="padding-left:20px">
                    <label runat="server" > Item 1: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemOne')" id="itemOneCheck" />
                    <label runat="server" > Item 2: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemTwo')" id="itemTwoCheck" />
                    <label runat="server" > Item 3: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemThree')" id="itemThreeCheck" />
                    <label runat="server" > Item 4: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemFour')" id="itemFourCheck" />
                    <label runat="server" > Item 5: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemFive')" id="itemFiveCheck" />
                    <label runat="server" > Item 6: </label> <input type="checkbox" runat="server" onclick="setDrinks('itemSix')" id="itemSixCheck" />
                </div>
                <div style="visibility:hidden; display:none" id="itemOne">
                    <label><u style="padding-left: 195px">Item One</u></label> <br />
                    <label> Enter Name: </label>
                    <input runat="server" type="text" id="itemOneName" /> <br />
                    <label style="padding-top: 10px"> Enter Description: </label><br />
                    <textarea runat="server" id="itemOneDesc" rows="5" cols="32"></textarea><br />
                    <label style="padding-top: 15px"> Enter Total: </label>
                    <input runat="server" type="text" id="itemOneTotal" />
                </div>
                <div style="visibility:hidden; display:none" id="itemTwo">
                    <label><u style="padding-left: 195px">Item Two</u></label> <br />
                    <label> Enter Name: </label>
                    <input runat="server" type="text" id="itemTwoName" /> <br />
                    <label style="padding-top: 10px"> Enter Description: </label><br />
                    <textarea runat="server" id="itemTwoDesc" rows="5" cols="32"></textarea><br />
                    <label style="padding-top: 15px"> Enter Total: </label>
                    <input runat="server" type="text" id="itemTwoTotal" />
                </div>
                <div style="visibility:hidden; display:none" id="itemThree">
                    <label><u style="padding-left: 195px">Item Three</u></label> <br />
                    <label> Enter Name: </label>
                    <input runat="server" type="text" id="itemThreeName" /> <br />
                    <label style="padding-top: 10px"> Enter Description: </label><br />
                    <textarea runat="server" id="itemThreeDesc" rows="5" cols="32"></textarea><br />
                    <label style="padding-top: 15px"> Enter Total: </label>
                    <input runat="server" type="text" id="itemThreeTotal" />
                </div>
                <div style="visibility:hidden; display:none" id="itemFour">
                    <label><u style="padding-left: 195px">Item Four</u></label> <br />
                    <label> Enter Name: </label>
                    <input runat="server" type="text" id="itemFourName" /> <br />
                    <label style="padding-top: 10px"> Enter Description: </label><br />
                    <textarea runat="server" id="itemFourDesc" rows="5" cols="32"></textarea><br />
                    <label style="padding-top: 15px"> Enter Total: </label>
                    <input runat="server" type="text" id="itemFourTotal" />
                </div>
                <div style="visibility:hidden; display:none" id="itemFive">
                    <label><u style="padding-left: 195px">Item One</u></label> <br />
                    <label> Enter Name: </label>
                    <input runat="server" type="text" id="itemFiveName" /> <br />
                    <label style="padding-top: 10px"> Enter Description: </label><br />
                    <textarea runat="server" id="itemFiveDesc" rows="5" cols="32"></textarea><br />
                    <label style="padding-top: 15px"> Enter Total: </label>
                    <input runat="server" type="text" id="itemFiveTotal" />
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Set</button>
              </div>
            </div>
            </div>
          </div>
        </div>
    <!-- Drinks Set -->
         <div class="modal fade" id="progressSetDrinks" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" runat="server">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Set Drinks</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <label id="label3" runat="server" >Drinks updated</label>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
              </div>
            </div>
            </div>
          </div>
        </div>
<!-- Scripts -->
<script>
    function showInfo() {
        var selected = document.getElementById("accountLookup");
        var usernameSect = document.getElementById("usernameInfo");
        var emailSect = document.getElementById("emailInfo");
        if (selected.value == "Username") {
            usernameSect.style.visibility = "visible";
            usernameSect.style.display = "block";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        }
        else if (selected.value == "Email") {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "visible";
            emailSect.style.display = "block";
        }
        else if (selected.value == "Phonenumber") {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        } else {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        }
    }
    function showSelectedMoney()
    {
        var select = document.getElementById('selectAddSet');
        var addMoney = document.getElementById('addAmountSection');
        var setMoney = document.getElementById('setAmountSection');

        if (select.value == "addMoney") {
            addMoney.style.visibility = "visible";
            addMoney.style.display = "block";
            setMoney.style.visibility = "hidden";
            setMoney.style.display = "none";
        }
        else if (select.value == "setMoney") {
            addMoney.style.visibility = "hidden";
            addMoney.style.display = "none";
            setMoney.style.visibility = "visible";
            setMoney.style.display = "block";
        }
        else {
            addMoney.style.visibility = "hidden";
            addMoney.style.display = "none";
            setMoney.style.visibility = "hidden";
            setMoney.style.display = "none";
        }
    }
    function membershipShowInfo() {
        var selected = document.getElementById("selectLookup");
        var usernameSect = document.getElementById("usernameSect");
        var emailSect = document.getElementById("emailSect");
        if (selected.value == "Username") {
            usernameSect.style.visibility = "visible";
            usernameSect.style.display = "block";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        }
        else if (selected.value == "Email") {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "visible";
            emailSect.style.display = "block";
        }
        else if (selected.value == "Phonenumber") {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        } else {
            usernameSect.style.visibility = "hidden";
            usernameSect.style.display = "none";
            emailSect.style.visibility = "hidden";
            emailSect.style.display = "none";
        }
    }
    function totalChange()
    {
        var select = document.getElementById('selectMembershipType');
        var total = document.getElementById('membTotal');
        if (select.value == "None") {
            total.innerText = "Total: $0.00 Per 30 days"; 
        }
        else if (select.value == "Green") {
            total.innerText = "Total: $5.00 Per 30 days"; 
        }
        else if (select.value == "Gold") {
            total.innerText = "Total: $10.00 Per 30 days"; 
        }
    }
    function checkClicked()
    {
        var text = document.getElementById('emailContent');
        if (text.style.visibility == 'visible')
        {
            text.style.visibility = 'hidden';
            text.style.display = 'none';
        }
        else if (text.style.visibility == 'hidden')
        {
            text.style.visibility = 'visible';
            text.style.display = 'block';
        }
    }
    function setDrinks(current)
    {
        clicked = document.getElementById(current); 
        if (clicked.style.visibility == 'hidden') {
            clicked.style.visibility = 'visible';
            clicked.style.display = 'block';
        }
        else {
            clicked.style.visibility = 'hidden';
            clicked.style.display = 'none';
        }
    }
    function membShow() {
        select = document.getElementById("selectDoWhat");
        accountMemb = document.getElementById("setMemb");
        if (select.value == "set") {
            accountMemb.style.visibility = "visible";
            accountMemb.style.display = "block";
        }
        else {
            accountMemb.style.visibility = "hidden";
            accountMemb.style.display = "none";
        }
    }
</script>

    <!-- Bootstrap core JavaScript-->
    <script src="TheDen/vendor/jquery/jquery.min.js"></script>
    <script src="ViewOrdersBootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="TheDen/vendor/jquery-easing/jquery.easing.min.js"></script>

    </form>
</body>
</html>
