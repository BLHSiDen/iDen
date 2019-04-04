<%@ Page Language="C#" EnableViewState="False" EnableSessionState="True" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="TheDenOrderingWebApp.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>iDen</title>
    <!-- Bootstrap core CSS -->
    <link href="TheDen/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <!-- Custom fonts for this template -->
    <link href="TheDen/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

    <!-- Plugin CSS -->
    <link href="TheDen/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" />

    <!-- Custom styles for this template -->
    <link href="TheDen/css/freelancer.css" rel="stylesheet" />

    <link rel="shortcut icon" href="TheDen/img/theDenPaw.png"/>

</head>
<body id="page-top">
    <form id="form1" runat="server">
<!--HEADER----------------------------------------------------------------------------------->
         <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger text-lowercase" runat="server" id="lbliDen" href="#page-top">iDen  | </a>
        <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <!-- Login -->
         <a class="navbar-brand js-scroll-trigger" runat="server" id="WelcomeLabel" visible="false" onmouseover="this.style.color='#fad94e';" onmouseout="this.style.color='#fff';" onserverclick="WelcomeLabel_ServerClick">Welcome</a>
        <button type="button" class="btn btn-primary btn-xl nav-link py-3 px-0 px-lg-3 masthead bg-secondary text-white text-center text-uppercase mb-0 border-0 py-3 px-0 px-lg-3 font-weight-bold"  runat="server" id="LoginButtonMain" data-toggle="modal" onserverclick="LoginButtonMain_ServerClick">Login</button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <!-- Nav Menu -->
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Menu</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">Membership</a>
            </li>
            <li class="nav-item mx-0 mx-lg-1">
              <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Order</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Header -->
    <header class="masthead bg-primary text-white text-center">
      <div class="container">
        <img class="img-fluid mb-5 d-block mx-auto" src="TheDen/img/theDenPaw.png" alt="" />
        <h1 class="text-uppercase mb-0">What Is iDen?</h1>
        <hr class="star-light" />
        <h2 class="font-weight-light mb-0">iDen is the Den On The Go's Webapp that allows you to skip the long line at The Den. Order your favorite drink for a pickup or delivery</h2>
      </div>
    </header>
<!--MENU----------------------------------------------------------------------------------->
    <!-- Menu Grid Section -->
    <section class="portfolio" id="portfolio">
      <div class="container">
        <h2 class="text-center text-uppercase text-secondary mb-0">Menu</h2>
        <hr class="star-dark mb-5" />
        <div class="row">
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-1">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/TheBobcat.png" alt="" />
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/Coffee.png" alt="" />
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/Coffee.png" alt="" />
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-4">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/Lemonade.png" alt="" />
            </a>
          </div>
          <div class="col-md-6 col-lg-4">
            <%--<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-5">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/comingsoon.png" alt=""/>
            </a>--%>
          </div>
          <div class="col-md-6 col-lg-4">
            <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-6">
              <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
                <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                  <i class="fa fa-search-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="TheDen/img/portfolioPics/comingsoon.png" alt="" />
            </a>
          </div>
        </div>
      </div>
    </section>
<!-- MEMBERSHIP------------------------------------------------------------------------------>    
    <!-- Membership Section -->
    <section class="bg-primary text-white mb-0" id="about">
      <div class="container">
        <h2 class="text-center text-uppercase text-white">30-day Memberships</h2>
        <hr class="star-light mb-5" />
        <div class="row">
            <div id="membershipLeft" style="width:550px">
                <label style="font-size:50px; color:#79f5a0; font-weight:bold""><u class="text-uppercase">Green Membership</u></label><br />
                <label style="padding-left:110px">Benefits a GREEN membership | $5.00 </label> <br />
                <ul style="font-weight:bold; padding-left:100px; font-size:25px">
                    <li>Access To Den On The Go</li>
                    <li>Monthly Coupon</li>
                    <!--<li>$.25 Off The Bobcat</li> -->
                    <li>Recognition In iDen Commercials</li>
                </ul>
            </div>
            <label style="padding-left:25px"></label>
            <div id="membershipRight" style="width:550px">
                <label style="font-size:50px; color:#fad94e; font-weight:bold""><u class="text-uppercase">Gold Membership</u></label><br />
                <label style="padding-left:110px">Benefits a GOLD membership | $10.00</label> <br />
                <ul style="font-weight:bold; padding-left:100px; font-size:25px">
                    <li>Access To Den On The Go</li>
                    <li>Delivery System</li>
                    <li>Weekly Coupon</li>
                    <li>$.50 Off The Bobcat</li>
                </ul>
            </div>
        </div>
      </div>
    </section>
<!--ORDER----------------------------------------------------------------------------------->
            <!-- Order Section -->
            <section id="contact">
              <div class="container">
                <h2 class="text-center text-uppercase text-secondary mb-0">Place Your Order</h2>
                <hr class="star-dark mb-5" />
                <div class="row">
                  <div class="col-lg-8 mx-auto">
               <!--Enter Order Type-->
               <div class="control-group">
                    <div class="input-group mb-3">
                        <label class="input-group-text" for="orderType">Enter Order Type: </label>
                        <select class="custom-select" id="orderingType" onchange="whatType(this)" runat="server">
                            <option></option>
                            <option>Delivery</option>
                            <option>Pick-up</option>
                        </select>
                    </div>
                </div>
                <!-- Order Type Specifics -->
                <div class="container" id="selectTypeContainer" runat="server" style="visibility:hidden; display:none">
                  <!--Enter Pick-Up Time-->
                  <div class="control-group" style="display:none; padding-top:25px; padding-bottom:25px" id="pickupTimeDiv">
                      <div class="input-group mb-3">
                          <label class="input-group-text" id="pickupLbl" for="pickUpTime" style="visibility:hidden">Enter Pick-up Time: </label>
                          <input id="pickUpTime" runat="server" /> 
                      </div>
                  </div>
                  <!--Enter Delivery Location-->
                  <div class="control-group"  style="display:none; padding-top:25px; padding-bottom:25px" id="deliveryDiv">
                      <div class="input-group mb-3">
                          <label class="input-group-text" id="deliverylbl" for="deliveryLocation" style="visibility:hidden">Enter Delivery Location: </label>
                          <select class="custom-select" id="deliveryLocation" style="visibility:hidden" runat="server">
                              <option></option>
                              <option>CTE Learning Stairs</option>
                              <option>CTE Flex Area</option>
                              <option>Cafateria</option>
                          </select>
                      </div>
                  </div>
                </div>
                  <!--Enter Order-->
                  <div class="control-group">
                      <div class="input-group mb-3">
                          <label class="input-group-text" id="orderItemlbl" for="orderItem" style="visibility:visible" runat="server">Select Item: </label>
                          <select class="custom-select" id="orderItem" style="visibility:visible" runat="server" onchange="Total()">
                              <option></option>
                              <option runat="server" value="The Bobcat" >The Bobcat</option>
                              <option runat="server" value="Black Coffee"> Black Coffee</option>
                              <option runat="server" value="Hot Chocolate">Hot Chocolate</option>
                              <option runat="server" value="Lemonade">Lemonade</option>
                              <option runat="server" value="FruitBoost">Fruit Boost</option>
                              <option runat="server" style="visibility:hidden; display:none" > </option>
                          </select>
                        </div>
                  </div>  
                  <div class="control-group" style="padding-left:20px; visibility:hidden" id="selectTypeOrder" runat="server">
                      <div class="input-group mb-3">
                          <label class="input-group-text" id="specialItemlbl" for="orderItem" style="visibility:hidden" runat="server">Select Type: </label>
                          <select class="custom-select" id="orderSpecialty" style="visibility:hidden" onchange="Total()" runat="server">
                              <option id="optionReg" value="optionReg">Regular</option>
                              <option id="option1" value="option1" style="visibility:hidden">1</option>
                              <option id="option2" value="option2" style="visibility:hidden">2</option>
                              <option id="option3" value="option3" style="visibility:hidden">3</option>
                              <option id="option4" value="option4" style="visibility:hidden">4</option>
                          </select>
                        </div>
                  </div>    
                  <br />
                    <!--Total Label-->
                   <div>
                        <label class="text-uppercase mb-0" id="totalLabel" runat="server" >Total: </label>
                   </div>
                  <asp:Label ID="lblTotal" runat="server" Font-Size="24pt" Text="Total:" Visible="false"></asp:Label>
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-xl" id="submitOrder1" runat="server" onserverclick="submitOrder_ServerClick1">Place Order</button>
                  </div>
                  <!--Confirmation -->
                      <div class="modal bs-example-modal-lg" id="confirmationPopup" runat="server">
                      <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                              <div class="modal-header">
                                <h3 class="modal-title">Confirmation</h3>
                              </div>
                              <div class="modal-body" runat="server" id="confirmOrderBody">
                                  Please confirm your order!
                              </div>
                              <div class="modal-footer">
                                  <button class="btn btn-primary btn-xl"> Cancel </button>
                                  <button class="btn btn-primary btn-xl" runat="server" onserverclick="submitOrder_ServerClick" data-toggle="modal" data-target="#thankYou">  Confirm </button>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!--Thank You Popup-->
                   <div class="modal bs-example-modal-lg" id="thankYou">
                      <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                              <div class="modal-header">
                                <h3 class="modal-title">Thank You!</h3>
                              </div>
                              <div class="modal-body">
                                  Thank you for your order! We will notify you when your order is ready!
                              </div>
                              <div class="modal-footer">
                                  <button class="btn btn-primary btn-xl" data-dismiss="modal"> Done </button>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!-- Please Login Popup-->
                   <div class="modal bs-example-modal-lg" id="notLoggedInError" runat="server">
                      <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                              <div class="modal-header">
                                <h3 class="modal-title">Not Logged In</h3>
                              </div>
                              <div class="modal-body">
                                  To be able to order, please login!
                              </div>
                              <div class="modal-footer">
                                  <button class="btn btn-primary btn-xl" data-dismiss="modal"> Close </button>
                              </div>
                          </div>
                      </div>
                    </div>
                  </div>
             </div>
         </div>
    </section>
<!--FOOTER----------------------------------------------------------------------------------->
    <footer class="footer text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">Basehor-Linwood High School
              <br /> Basehor, Kansas </p>
          </div>       
          <div class="col-md-4">
            <h4 class="text-uppercase mb-4">Our Social Media</h4>
            <p class="lead mb-0">Follow our social media accounts to keep informed about The Den! @blhsTheDen</p>
            </div>
        </div>
      </div>
    </footer>
    <div class="copyright py-4 text-center text-white">
      <div class="container">
        <small>Copyright &copy; The Den 2018 - Created By: Alex Bailey</small>
      </div>
    </div>
    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-to-top d-lg-none position-fixed ">
      <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
      </a>
    </div>
<!--LOGIN----------------------------------------------------------------------------------->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <!-- Username -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Username</label>
                          <input class="form-control" id="username" type="text" runat="server" placeholder="Username" />
                          <p class="help-block text-danger"></p>
                      </div>
              </div>
               <!-- Password -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Username</label>
                          <input class="form-control" id="password" type="password" runat="server" placeholder="Password" />
                          <p class="help-block text-danger"></p>
                      </div>
            </div>
              <!-- Link to Register -->
              <div class="container" style="padding-left: 135px; padding-top: 25px">
                  <button type="button" class="btn btn-info" style="font-weight:bold; font-family:'Lato'" data-toggle="modal" data-target="#registerModal"> Don't Have An Account?</button>
              </div>
          </div>
            <!-- Login Footer -->
          <div class="modal-footer">
            <h3 class="alert-warning" runat="server" visible="false" id="errorLoginLabel">Username or Password incorrect!</h3>
              <div class="container" style="padding-left:25px">
                  <button type="button" class="btn btn-success" style="font-weight:bold" id="btnForgotLogin" runat="server" onserverclick="btnForgotLogin_ServerClick">Forgot Login?</button>
              </div>
            <button type="button" class="btn btn-success" style="font-weight:bold" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-success" id="loginbtn" style="font-weight:bold" runat="server" onserverclick="loginClicked">Login</button>
          </div>
        </div>
      </div>
    </div>
<!--REGISTER----------------------------------------------------------------------------------->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="registerModalLabel">Register</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
             <!-- Name -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Full Name</label>
                          <input class="form-control" id="regName" type="text" runat="server" placeholder="Full Name" />
                          <p class="help-block text-danger"></p>
                      </div>
              </div>
             <!-- Phonenumber -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Phonenumber</label>
                          <input class="form-control" id="regPhonenum" type="text" runat="server" placeholder="Phonenumber" />
                          <p class="help-block text-danger"></p>
                      </div>
              </div>
               <!-- Email -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Email</label>
                          <input class="form-control" id="regEmail" type="text" runat="server" placeholder="Email" />
                          <p class="help-block text-danger"></p>
                      </div>
              </div>
             <!-- Username -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Username</label>
                          <input class="form-control" id="regUser" type="text" runat="server" placeholder="Username" />
                          <p class="help-block text-danger"></p>
                      </div>
              </div>
             <!-- Password -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Password</label>
                          <input class="form-control" id="regPass" type="text" runat="server" placeholder="Password" />
                          <p class="help-block text-danger"></p>
                      </div>
            </div>
            <!-- Confirm Password -->
             <div class="control-group">
                      <div class="form-group floating-label-form-group controls mb-0 pb-2">
                          <label>Confirm Password</label>
                          <input class="form-control" id="regConfirmPass" type="text" runat="server" placeholder="Confirm Password" />
                          <p class="help-block text-danger"></p>
                      </div>
            </div>
              <!-- Link to Login -->
              <div class="container" style="padding-top:20px">
                <label id="alreadyHaveAccount" runat="server"  data-toggel="modal">Already Have An Account? Click Here To Login</label>  <button type="button" class="btn btn-info" data-dismiss="modal" data-target="#loginModal">Login</button>
              </div>
          </div>
              <!-- Register Footer -->
          <div class="modal-footer">
            <h3 class="alert-warning" runat="server" visible="false" id="registerErrorLabel">Error</h3>
            <button type="button" class="btn btn-success" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-success" id="registerButton" runat="server" data-toggel="modal" data-target="#youareRegisteredModal" onserverclick="registerButton_ServerClick">Register</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Error Registering Modal -->
     <div class="modal fade" id="errorRegistering" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="errorwhileRegistering">Error!</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label runat="server" id="errorLabel" > Sorry! There was an error while registering, try again! </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        </div>
      </div>
    </div>
    <!-- You Are Registered Modal -->
     <div class="modal fade" id="youareRegisteredModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="youAreRegisteredTitle">Register</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label > You are now registered, please Login! </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        </div>
      </div>
    </div>
     <!-- Confirm Email Code -->
     <div class="modal fade" id="confirmEmail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"> Enter Confirmation Code </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="confirmBody" runat="server"> We sent you a confirmation code to your email</label>
            <div class="control-group">
                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                    <label>Confirmation Code:</label>
                    <input class="form-control" id="confirmationNumInput" type="text" runat="server" placeholder="Enter Confirmation Code" />
                    <p class="help-block text-danger"></p>
                </div>
            </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="btnConfirmation" runat="server" data-toggel="modal" onserverclick="btnConfirmation_ServerClick">Confirm</button>
          </div>
        </div>
        </div>
      </div>
    </div>
    <!-- Forgot Login Modal  -->
     <div class="modal fade" id="forgotLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="forgotLoginTitle">Forgot Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label > Enter Email: </label>
             <input class="form-control" id="forgotLoginEmail" type="text" runat="server" placeholder="Email" />
          <div class="modal-footer">
             <h3 class="alert-warning" runat="server" visible="false" id="errorForgotLogin">Email left blank</h3>
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="btnSendEmailForgot" runat="server" data-toggel="modal" onserverclick="btnSendEmailForgot_ServerClick">Send Email</button>
          </div>
        </div>
        </div>
      </div>
    </div>
<!-- Account Info -->
     <div class="modal fade" id="userInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" runat="server" id="userInfoTitle">Account Info</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label id="lblAccountBalance" runat="server" style="padding-bottom:30px"> Account Balance: $0.00 </label> <br />
            <label id="lblMembership" runat="server"> Membership: </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-success" id="Button1" runat="server">Change Password</button>
          </div>
        </div>
        </div>
      </div>
    </div> 
 <!-- Order Error -->
     <div class="modal fade" id="orderErrorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="orderTitle">Ordering Error</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <label runat="server" id="orderErrorBody" >  </label>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
          </div>
        </div>
        </div>
      </div>
    </div>
<!-- Portfolio Modals -->
    <!-- Portfolio Modal 1 Bobcat -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">The Bobcat</h2>
              <hr class="star-dark mb-5" />
              <img class="img-fluid mb-5" src="TheDen/img/portfolioPics/TheBobcat.png" alt="" />
              <p class="mb-5"> A great twist on the classic iced coffee. A nice blend of sweet cream, vanilla, and coffee to create The Den's signature drink.<strong>Cost: $2.50</strong></p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Portfolio Modal 2 Coffee-->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Black Coffee</h2>
              <hr class="star-dark mb-5" />
              <img class="img-fluid mb-5" src="TheDen/img/portfolioPics/Coffee.png" alt="" />
              <p class="mb-5">Using the Den’s signurature blend makes it the perfect pick me up, can be added with ice, cream and/or flavored syrup! <strong> Cost: $2.00</strong></p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Portfolio Modal 3 Hot Chocolate  -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Hot Chocolate</h2>
              <hr class="star-dark mb-5" />
              <img class="img-fluid" src="TheDen/img/portfolioPics/Coffee.png" alt="" />
              <!-- <img class="img-fluid mb-5" src="TheDen/img/portfolio/Coffee.png" alt="" />-->
              <p class="mb-5"> Our go to cold day remedy, this rich chocolate drink is an all time student favorite. <strong>Cost: $1.00</strong></p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Portfolio Modal 4 -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">Lemonade</h2>
              <hr class="star-dark mb-5" />
              <img class="img-fluid" src="TheDen/img/portfolioPics/Lemonade.png" alt="" />
             <!-- <img class="img-fluid mb-5" src="TheDen/img/portfolio/Lemonade.png" alt="" /> -->
              <p class="mb-5"> You can purchase the original lemonade or add a touch of strawberry or mango. <strong>Cost: $1.00</strong></p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Portfolio Modal 5 -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0"></h2>
              <hr class="star-dark mb-5" />
              <img class="img-fluid mb-5" src="TheDen/img/portfolio/safe.png" alt="" />
              <p class="mb-5">Try our new Italian Sodas. They are soft drink made from carbonated water and come in two flavorered syrup-- Cherry and Strawberry. Cost: $2.00</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Portfolio Modal 6 -->
    <div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
      <div class="portfolio-modal-dialog bg-white">
        <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
          <i class="fa fa-3x fa-times"></i>
        </a>
        <div class="container text-center">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <h2 class="text-secondary text-uppercase mb-0">More Coming Soon!</h2>
              <hr class="star-dark mb-5" />
              <!--<img class="img-fluid mb-5" src="TheDen/img/portfolio/comingsoon.png" alt="" />-->
              <img class="img-fluid" src="TheDen/img/portfolioPics/comingsoon.png" alt="" />
              <p class="mb-5">Keep an eye out for new drinks!</p>
              <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
                <i class="fa fa-close"></i>
                Close </a>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Javascript Functions -->
    <input id="hiddenSpecialty" type="hidden" runat="server" />
    <input id="hiddenTotal" type="hidden" runat="server" />
<script type="text/javascript">
        //Total
        function Total() {
            var hiddenSpecailty = '<%= hiddenSpecialty.ClientID %>';
            var hiddenTotal = '<%= hiddenTotal.ClientID %>';
            var orderItemSelected = document.getElementById("orderItem")
            var orderSpecialty = document.getElementById("orderSpecialty")
            var totaltxt = "Total: $"
            var optionReg = document.getElementById("optionReg")
            var optionOne = document.getElementById("option1")
            var optionTwo = document.getElementById("option2")
            var optionThree = document.getElementById("option3")
            var optionFour = document.getElementById("option4")
            var orderSpecialty = document.getElementById("orderSpecialty")
            if (orderItemSelected.value == "The Bobcat") {
                orderSpecialty.style.visibility = "visible";
                optionOne.style.visibility = "visible";
                optionOne.innerText = "No Ice";
                optionTwo.style.visibility = "visible";
                optionTwo.innerText = "Low Ice";
                optionThree.style.visibility = "visible";
                optionThree.innerText = "Caramel";
                optionFour.style.visibility = "visible";
                optionFour.innerText = "Peppermint";
                if (orderSpecialty.value == "option1") {
                    document.getElementById(hiddenSpecailty).value = "No Ice"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.50"
                    document.getElementById(hiddenTotal).value = "2.50";
                }
                else if (orderSpecialty.value == "option2") {
                    document.getElementById(hiddenSpecailty).value = "Low Ice"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.50"
                    document.getElementById(hiddenTotal).value = "2.50";
                }
                else if (orderSpecialty.value == "option3") {
                    document.getElementById(hiddenSpecailty).value = "Caramel"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.75"
                    document.getElementById(hiddenTotal).value = "2.75";
                }
                else if (orderSpecialty.value == "option4") {
                    document.getElementById(hiddenSpecailty).value = "Peppermint"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.75"
                    document.getElementById(hiddenTotal).value = "2.75";
                }
                else {
                    document.getElementById(hiddenSpecailty).value = "Regular"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.50"
                    document.getElementById(hiddenTotal).value = "2.50";
                }            
            }
            else if (orderItemSelected.value == "Black Coffee") {
                orderSpecialty.style.visibility = "visible";
                //1 = iced
                optionOne.style.visibility = "visible";
                optionOne.innerText = "Iced";
                //2 = peppermint
                optionTwo.style.visibility = "visible";
                optionTwo.innerText = "Peppermint";
                //3 = caramel
                optionThree.style.visibility = "visible";
                optionThree.innerText = "Caramel";
                //4 = hazelnut
                optionFour.style.visibility = "visible";
                optionFour.innerText = "Hazelnut";
                if (orderSpecialty.value == "option1") {
                    document.getElementById(hiddenSpecailty).value = "Iced"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.00";
                    document.getElementById(hiddenTotal).value = "2.00";
                }
                else if (orderSpecialty.value == "option2") {
                    document.getElementById(hiddenSpecailty).value = "Peppermint"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.25";
                    document.getElementById(hiddenTotal).value = "2.25";
                }
                else if (orderSpecialty.value == "option3") {
                    document.getElementById(hiddenSpecailty).value = "Caramel"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.25";
                    document.getElementById(hiddenTotal).value = "2.25";
                }
                else if (orderSpecialty.value == "option4") {
                    document.getElementById(hiddenSpecailty).value = "Hazelnut"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.25";
                }
                else {
                    document.getElementById(hiddenSpecailty).value = "Regular"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "2.00";
                    document.getElementById(hiddenTotal).value = "2.00";
                }            
            }
            else if (orderItemSelected.value == "Hot Chocolate") {
                orderSpecialty.style.visibility = "visible";
                optionOne.style.visibility = "visible";
                optionOne.innerText = "No Ice";
                optionTwo.style.visibility = "visible";
                optionTwo.innerText = "Low Ice";
                optionThree.style.visibility = "visible";
                optionThree.innerText = "Strawberry";
                optionFour.style.visibility = "visible";
                optionFour.innerText = "Mango";
                if (orderSpecialty.value == "option1") {
                    document.getElementById(hiddenSpecailty).value = " No Ice"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else if (orderSpecialty.value == "option2") {
                    document.getElementById(hiddenSpecailty).value = "Low Ice"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else if (orderSpecialty.value == "option3") {
                    document.getElementById(hiddenSpecailty).value = "Strawberry"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.50"
                    document.getElementById(hiddenTotal).value = "1.50";
                }
                else if (orderSpecialty.value == "option4") {
                    document.getElementById(hiddenSpecailty).value = "Mango"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.50"
                    document.getElementById(hiddenTotal).value = "1.50";
                }
                else {
                    document.getElementById("totalLabel").innerText = totaltxt + "1.00"
                    document.getElementById(hiddenTotal).value = "1.00";
                }            
            }
            else if (orderItemSelected.value == "Lemonade") {
                orderSpecialty.style.visibility = "visible";
                optionOne.style.visibility = "visible";
                optionOne.innerText = "Peppermint";
                optionTwo.style.visibility = "visible";
                optionTwo.innerText = "Caramel";
                optionThree.style.visibility = "visible";
                optionThree.innerText = "Hazelnut";
                optionFour.style.visibility = "visible";
                optionFour.innerText = "Vanilla";
                if (orderSpecialty.value == "option1") {
                    document.getElementById(hiddenSpecailty).value = "Peppermint"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else if (orderSpecialty.value == "option2") {
                    document.getElementById(hiddenSpecailty).value = "Caramel"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else if (orderSpecialty.value == "option3") {
                    document.getElementById(hiddenSpecailty).value = "Hazelnut"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else if (orderSpecialty.value == "option4") {
                   document.getElementById(hiddenSpecailty).value = "Vanilla"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.25"
                    document.getElementById(hiddenTotal).value = "1.25";
                }
                else {
                    document.getElementById(hiddenSpecailty).value = "Regular"; 
                    document.getElementById("totalLabel").innerText = totaltxt + "1.00"
                    document.getElementById(hiddenTotal).value = "1.00";
                }
            }
            else if (orderItemSelected.value == "item5") {
                document.getElementById("totalLabel").innerText = totaltxt + "1.50"
                orderSpecialty.style.visibility = "hidden";
                document.getElementById(hiddenTotal).value = "1.50";
            }
            else {
                document.getElementById("totalLabel").innerText = totaltxt + "0.00"
                orderSpecialty.style.visibility = "hidden"
             }
        }
        //Shows correct order info
        function whatType(select) {
            var container = document.getElementById("selectTypeContainer")
            var pickupTime = document.getElementById("pickUpTime")
            var pickuplbl = document.getElementById("pickupLbl")
            var deliveryLoc = document.getElementById("deliveryLocation")
            var deliverylbl = document.getElementById("deliverylbl")
            var deliveryDiv = document.getElementById("deliveryDiv")
            var pickupDiv = document.getElementById("pickupTimeDiv")

            container.style["display"] = "block"

            if (select.value == "Delivery") {
                pickupTime.style.visibility = "hidden"
                pickupDiv.style.display = "none"
                pickuplbl.style.visibility = "hidden"
                deliveryLoc.style.visibility = "visible"
                deliverylbl.style.visibility = "visible"
                deliveryDiv.style.display = "block"
            }
            else if (select.value == "Pick-up") {
                pickupTime.style.visibility = "visible"
                pickuplbl.style.visibility = "visible"
                pickupDiv.style.display = "block"
                deliveryLoc.style.visibility = "hidden"
                deliverylbl.style.visibility = "hidden"
                deliveryDiv.style.display = "none"
            }
            else {
                container.style["display"] = "none"
                pickupTime.style.visibility = "hidden"
                pickuplbl.style.visibility = "hidden"
                deliveryLoc.style.visibility = "hidden"
                deliverylbl.style.visibility = "hidden"
            }
        }
</script>

    <!-- Bootstrap core JavaScript -->
    <script src="TheDen/vendor/jquery/jquery.min.js"></script>
    <script src="TheDen/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="TheDen/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="TheDen/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="TheDen/js/jqBootstrapValidation.js"></script>
    <script src="TheDen/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="TheDen/js/freelancer.min.js"></script>
    </form>
</body>
</html>

