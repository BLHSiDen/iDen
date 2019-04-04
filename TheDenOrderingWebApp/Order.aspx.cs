using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.TwiML;
using TheDenOrderingWebApp;
using System.Net.Mail;

namespace TheDenOrderingWebApp
{
    public partial class Order : System.Web.UI.Page
    {
        //bool LoggedIn = false;
        public int numberCode = 0;

        SqlConnection conDeals = new SqlConnection();
        SqlConnection conLogin = new SqlConnection();
        SqlConnection iDenCon = new SqlConnection();
        static string dealsFromData = string.Empty;

        static bool loggedin = false; 

        protected void Page_Load(object sender, EventArgs e)
        {
             Session["welcomeVisible"] = "false";
            //Database connections
            //loggedin = false;

            //string strcon = System.Configuration.ConfigurationManager.ConnectionStrings[""].ConnectionString;
            //SqlConnection DbConnection = new SqlConnection(strcon);
            conLogin.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
            conDeals.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
            iDenCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
            /* Local DB
            conLogin.ConnectionString = (@"Data Source=DESKTOP-OGL7383\SQLEXPRESS;Initial Catalog=WebLogin;Integrated Security=True");
            conDeals.ConnectionString = (@"Data Source=DESKTOP-OGL7383\SQLEXPRESS;Initial Catalog=WebDeals;Integrated Security=True");
            iDenCon.ConnectionString = (@"Data Source=DESKTOP-OGL7383\SQLEXPRESS;Initial Catalog=iDen;Integrated Security=True");
            */
        }
//LOGIN--------------------------------------------------------------------------------------------------------
        //Login System
        protected void loginClicked(object sender, EventArgs e)
        {
            conLogin.Open();
            Session["loggedInUser"] = username.Value;
            string loggedInUser = Session["loggedInUser"].ToString();
            Session["loggedInPass"] = password.Value;
            string loggedInPass = Session["loggedInPass"].ToString();
            //Checks if login values are in table
            SqlCommand cmdLogin = new SqlCommand("SELECT * from iDen_Logins where Username = @username and Password = @password", conLogin);
            cmdLogin.Parameters.AddWithValue("@username", loggedInUser);
            cmdLogin.Parameters.AddWithValue("@password", loggedInPass);

            SqlDataAdapter da = new SqlDataAdapter(cmdLogin);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //Login values exist
            if (dt.Rows.Count > 0)
            {
                Console.WriteLine("Logged In");
                errorLoginLabel.Visible = false;
                WelcomeLabel.InnerText = loggedInUser;
                WelcomeLabel.Visible = true;
                LoginButtonMain.InnerText = "logout";

                string membership = string.Empty;
                string date = string.Empty;

                Session["Welcome"] = WelcomeLabel.InnerText;
                Session["welcomeVisible"] = "true";
                loggedin = true;

                SqlCommand cmdFindName = new SqlCommand("SELECT Membership, MembDate from iDen_Logins WHERE (Username=@username)", conLogin);
                cmdFindName.Parameters.AddWithValue("@username", Session["Welcome"].ToString());

                SqlDataReader read = cmdFindName.ExecuteReader();
                while (read.Read())
                {
                    membership = read["Membership"].ToString();
                    date = read["MembDate"].ToString();
                }
                read.Close();

                bool containsMemb = membership.Contains("none");

                if (containsMemb == false)
                {
                    DateTime expDate = Convert.ToDateTime(date);
                    string now = DateTime.Now.ToString("MM.dd.yyyy");
                    DateTime current = Convert.ToDateTime(now);
                    var verifyDate = (expDate - current).TotalDays;

                    if (verifyDate <= 0)
                    {
                        SqlCommand cmdUpdate = new SqlCommand("UPDATE iDen_Logins SET Membership=@ship WHERE Username=@username", conLogin);
                        cmdUpdate.Parameters.AddWithValue("@ship", "none");
                        cmdUpdate.Parameters.AddWithValue("@username", username.Value);
                        cmdUpdate.ExecuteNonQuery();
                    }
                }
            }
            //Login values are nonexistent 
            else
            {
                string message = "$('#loginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                errorLoginLabel.InnerHtml = "Incorrect Username or Password";
                errorLoginLabel.Visible = true;
                WelcomeLabel.Visible = false;
                LoginButtonMain.InnerText = "login";
            }

            conLogin.Close();
        }
//REGISTER-------------------------------------------------------------------------------------------------------- 
        //Registration System
        protected void registerButton_ServerClick(object sender, EventArgs e)
        {
            Session["registerName"] = regName.Value;
            Session["registerPhone"] = regPhonenum.Value;
            Session["registerEmail"] = regEmail.Value;
            Session["registerUser"] = regUser.Value;
            Session["registerPass"] = regUser.Value;

            string registerName = Session["registerName"].ToString();
            string registerPhone = Session["registerPhone"].ToString();
            string registerEmail = Session["registerEmail"].ToString();
            string registerUser = Session["registerUser"].ToString();
            string registerPass = Session["registerPass"].ToString();

            int numLeftBlank = 0;

            //Name is left empty
            if (registerName == string.Empty)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Please Enter Your Name";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            //Phonenum is left empty
            if (registerPhone == string.Empty)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Please Enter Your Phonenumber";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            //Email is left empty
            if (registerEmail == string.Empty)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Please Enter Your Email";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            //Username is left empty
            if (registerUser == string.Empty)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Please Enter Your Username";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            //Password is left empty
            if (registerPass == string.Empty)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Please Enter Your Password";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            if (numLeftBlank > 1)
            {
                string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                registerErrorLabel.InnerText = "Multiple Items left blank, please enter all information";
                registerErrorLabel.Visible = true;
                numLeftBlank++;
            }
            else
            {
                //Checks if username is already taken
                if (regPass.Value == regConfirmPass.Value)
                {
                    conLogin.Open();
                    SqlCommand cmdExists = new SqlCommand("SELECT COUNT(*) FROM iDen_Logins where Username=@username", conLogin);
                    cmdExists.Parameters.AddWithValue("@username", registerUser);
                    int usernameCount = (int)cmdExists.ExecuteScalar();
                    if (usernameCount != 0)
                    {
                        string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                        registerErrorLabel.InnerText = "Username is already used";
                        registerErrorLabel.Visible = true;
                    }
                    else
                    {
                        //Checks if account with email already exists
                        SqlCommand cmdEmailExists = new SqlCommand("SELECT COUNT(*) FROM iDen_Logins where Email=@email", conLogin);
                        cmdEmailExists.Parameters.AddWithValue("@email", registerEmail);
                        int emailCount = (int)cmdEmailExists.ExecuteScalar();
                        if (emailCount != 0)
                        {
                            string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                            registerErrorLabel.InnerText = "An Account Is Already Registered With This Email!";
                            registerErrorLabel.Visible = true;
                        }
                        else
                        {
                            SendEmailWithCode();
                        }
                        conLogin.Close();
                    }
                }
                else
                {
                    string message = "$('#registerModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    registerErrorLabel.InnerText = "Passwords don't match";
                    registerErrorLabel.Visible = true;
                }
            }
        }
        //Checks Confirmation Number
        protected void btnConfirmation_ServerClick(object sender, EventArgs e)
        {
            Session["confirmationEntered"] = confirmationNumInput.Value;
            string confirmationEntered = Session["confirmationEntered"].ToString();

            if (confirmationEntered == Session["numCode"].ToString())
            {
                conLogin.Open();
                string registerName = regName.Value;
                string registerPhone = regPhonenum.Value;
                string registerEmail = regEmail.Value;
                string registerUser = regUser.Value;
                string registerPass = regPass.Value;

                decimal accountBalance = 0.00m;
                string mostOrdered = string.Empty;
                string membership = "none";

                SqlCommand cmdInsert = new SqlCommand("insert into iDen_Logins(Name, Phonenumber, Email, Username, Password, AccountBalance, MostOrdered, Membership)values(@name, @phonenum, @email, @username, @pass, @accountBal, @mostOrdered, @membership)", conLogin);

                cmdInsert.Parameters.AddWithValue("@name", registerName);
                cmdInsert.Parameters.AddWithValue("@phonenum", registerPhone);
                cmdInsert.Parameters.AddWithValue("@email", registerEmail);
                cmdInsert.Parameters.AddWithValue("@username", registerUser);
                cmdInsert.Parameters.AddWithValue("@pass", registerPass);
                cmdInsert.Parameters.AddWithValue("@accountBal", accountBalance);
                cmdInsert.Parameters.AddWithValue("@mostOrdered", mostOrdered);
                cmdInsert.Parameters.AddWithValue("@membership", membership);

                int j = cmdInsert.ExecuteNonQuery();
                //Successs
                if (j != 0)
                {
                    string message = "$('#youareRegisteredModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                //Error
                else
                {
                    string message = "$('#errorRegistering').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    errorLabel.InnerText = "Error when registereing";
                }

                conLogin.Close();

                regName.Value = string.Empty;
                regPhonenum.Value = string.Empty;
                regEmail.Value = string.Empty;
                regUser.Value = string.Empty;
                regPass.Value = string.Empty;
            }
            else
            {
                string message = "$('#errorRegistering').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                errorLabel.InnerHtml = "Incorrect confirmation number";
            }
        }
        //ORDER--------------------------------------------------------------------------------------------------------
        //First Submit Button that pops up confirmation
        protected void submitOrder_ServerClick1(object sender, EventArgs e)
        {
            //bool loggedIn = WelcomeLabel.Visible;
            //Session["LoggedIn"] = loggedIn;
            bool sessionVal = Convert.ToBoolean(Session["LoggedIn"]);

            string visible = Session["welcomeVisible"].ToString();
            string upper = visible.ToUpper();

            if (loggedin == true)
            {
                string usernamelogged = Session["Welcome"].ToString().ToUpper();
                WelcomeLabel.InnerText = Session["Welcome"].ToString();
                WelcomeLabel.Visible = true;
            }

            if (loggedin == true)
            {

                //Sets string values to order values
                Session["Items"] = orderItem.Value;
                string orderItems = Session["Items"].ToString();
                string orderItemsData = "Order: " + orderItems;
                Session["Type"] = orderingType.Value;
                string orderType = Session["Type"].ToString();
                string orderTypeData = "Type: " + orderType;
                Session["Specialty"] = hiddenSpecialty.Value.ToString();
                string orderSpecialtyItems = Session["Specialty"].ToString();
                Session["PickUpDetails"] = pickUpTime.Value;
                string orderDetailsPickup = Session["PickUpDetails"].ToString();
                string orderDetailsPickupData = "Pickup Time: " + orderDetailsPickup;
                Session["DeliveryDetails"] = deliveryLocation.Value;
                string orderDetailsDelivery = Session["DeliveryDetails"].ToString();
                string orderDetailsDeliveryData = "Delivery Location: " + orderDetailsDelivery;
                Session["hiddenTotal"] = hiddenTotal.Value.ToString();
                string orderTotal = hiddenTotal.Value.ToString();

                string accountTotal = string.Empty;
                string username = Session["Welcome"].ToString();
                string membership = string.Empty;
                string date = string.Empty;

                conLogin.Open();
                SqlCommand cmdFindName = new SqlCommand("SELECT AccountBalance, Membership, MembDate from iDen_Logins WHERE (Username=@username)", conLogin);
                cmdFindName.Parameters.AddWithValue("@username", username);

                SqlDataReader read = cmdFindName.ExecuteReader();
                while (read.Read())
                {
                    accountTotal = read["AccountBalance"].ToString();
                    membership = read["Membership"].ToString();
                    date = read["MembDate"].ToString();
                }
                conLogin.Close();

                decimal accountBalance = Convert.ToDecimal(accountTotal);
                decimal total = Convert.ToDecimal(hiddenTotal.Value);

                bool membIsNone = membership.Contains("none");

                if (membIsNone == false)
                {
                    DateTime expDate = Convert.ToDateTime(date);
                    string now = DateTime.Now.ToString("MM.dd.yyyy");
                    DateTime current = Convert.ToDateTime(now);
                    var verifyDate = (expDate - current).TotalDays;
                }

                if (membership.Contains("Green"))
                {
                    TimeSpan start = new TimeSpan(11, 40, 00);
                    TimeSpan end = new TimeSpan(12, 24, 00);
                    DateTime getEnteredTime = Convert.ToDateTime(orderDetailsPickup);
                    TimeSpan enteredTime = getEnteredTime.TimeOfDay;

                    if (accountBalance >= total)
                    {
                        //Green Membership cannot order delivery
                        if (orderType == "Delivery")
                        {
                            string message = "$('#orderErrorModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                            orderErrorBody.InnerText = "Your current membership cannot order deliveries. Please upgrade your membership status.";
                        }
                        //Confirmation Text
                        if (orderType == "Pick-up")
                        {
                            //Checks Pickup Time
                            if (enteredTime > start && enteredTime < end)
                            {
                                string message = "$('#confirmationPopup').modal({ backdrop: 'static', keyboard: false, show: true });";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                                confirmOrderBody.InnerText = "Please confirm the order of a Pickup at " + orderDetailsPickup + ". Order: " + orderItems + " + " + orderSpecialtyItems + " | " + "total: " + orderTotal; ;
                            }
                            else
                            {
                                string message = "$('#errorRegistering').modal({ backdrop: 'static', keyboard: false, show: true });";
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                                errorLabel.InnerText = "Sorry We Are Closed Right Now... Try Again During 10:50AM and 11:35AM";
                            }
                        }
                    }
                    else
                    {
                        string message = "$('#errorRegistering').modal({ backdrop: 'static', keyboard: false, show: true });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                        errorLabel.InnerText = "You do not have the amount required to complete this order. Add more money at the Den On The Go.";
                    }
                }
                else if (membership.Contains("none"))
                {
                    string message = "$('#errorRegistering').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    errorLabel.InnerText = "You currently do no have a membership. Please upgrade your membership to use iDen";
                }
                else 
                {
                    if (accountBalance >= total)
                    {
                        if (orderType == "Delivery")
                        {
                            string message = "$('#confirmationPopup').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                            confirmOrderBody.InnerText = "Please confirm the order of a Pickup at " + orderDetailsPickup + ". Order: " + orderItems + " + " + orderSpecialtyItems + " | " + "total: " + orderTotal; ;
                        }
                        //Confirmation Text
                        if (orderType == "Pick-up")
                        {
                            string message = "$('#confirmationPopup').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                            confirmOrderBody.InnerText = "Please confirm the order of a Pickup at " + orderDetailsPickup + ". Order: " + orderItems + " + " + orderSpecialtyItems + " | " + "total: " + orderTotal; ;
                        }
                    }
                }
            }
            else
            {
                string message = "$('#notLoggedInError').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
        }

        //Proccesses user order and pushes it to the database
        protected void submitOrder_ServerClick(object sender, EventArgs e)
        {
            Session["orderItems"] = orderItem.Value;
            string orderItems = Session["orderItems"].ToString();
            string orderItemsData = "Order: " + orderItems;
            Session["orderType"] = orderingType.Value;
            string orderType = Session["orderType"].ToString();
            string orderTypeData = "Type: " + orderType;
            Session["hiddenSpec"] = hiddenSpecialty.Value.ToString();
            string orderSpecialtyItems = Session["hiddenSpec"].ToString();
            string orderSpecialtyData = "Specialty: " + orderSpecialtyItems;
            Session["orderPickupDets"] = pickUpTime.Value;
            string orderDetailsPickup = Session["orderPickupDets"].ToString();
            string orderDetailsPickupData = "Pickup Time: " + orderDetailsPickup;
            Session["orderDeliveryDets"] = deliveryLocation.Value;
            string orderDetailsDelivery = Session["orderDeliveryDets"].ToString();
            string orderDetailsDeliveryData = "Delivery Location: " + orderDetailsDelivery;
            Session["hiddenTotal"] = hiddenTotal.Value.ToString();
            string orderTotal = Session["hiddenTotal"].ToString();
            string orderTotalData = "Total: " + orderTotal;
            string phoneNum = string.Empty;
            string name = string.Empty;


            Session["LoggedInUser"] = username.Value;
            string loggedInUser = Session["LoggedInUser"].ToString();
            Session["LoggedInPass"] = password.Value;
            string loggedInPass = Session["LoggedInPass"].ToString();

            string accountTotal = string.Empty;
            string findUsername = Session["Welcome"].ToString();

            conLogin.Open();
            SqlCommand cmdFindUser = new SqlCommand("SELECT AccountBalance from iDen_Logins WHERE (Username=@username)", conLogin);
            cmdFindUser.Parameters.AddWithValue("@username", findUsername);

            SqlDataReader read1 = cmdFindUser.ExecuteReader();
            while (read1.Read())
            {
                accountTotal = (read1["AccountBalance"].ToString());
            }
            conLogin.Close();

            decimal accountBalance = Convert.ToDecimal(accountTotal);
            decimal total = Convert.ToDecimal(Session["hiddenTotal"].ToString());
            decimal newBalance = accountBalance - total;

            SqlCommand cmdUpdate = new SqlCommand("UPDATE iDen_Logins SET AccountBalance=@balance WHERE Username=@username", conLogin);
            conLogin.Open();
            cmdUpdate.Parameters.AddWithValue("@balance", newBalance);
            cmdUpdate.Parameters.AddWithValue("@username", Session["Welcome"].ToString());
            cmdUpdate.ExecuteNonQuery();
            conLogin.Close();

            conLogin.Open();
            SqlCommand cmdFindPhone = new SqlCommand("SELECT Phonenumber from iDen_Logins WHERE (Username=@username)", conLogin);
            cmdFindPhone.Parameters.AddWithValue("@username", loggedInUser);
            //Find Phonenumber
            SqlDataReader read = cmdFindPhone.ExecuteReader();
            while (read.Read())
            {
                phoneNum = (read["Phonenumber"].ToString());
            }
            read.Close();
            //Find Name
            SqlCommand cmdFindName = new SqlCommand("SELECT Name from iDen_Logins WHERE (Username=@username)", conLogin);
            cmdFindName.Parameters.AddWithValue("@username", loggedInUser);

            SqlDataReader readName = cmdFindName.ExecuteReader();
            while (readName.Read())
            {
                name = (readName["Name"].ToString());
            }
            readName.Close();

            string phoneNumber = phoneNum;
            string customerNameData = "Name: " + name;

            string status = "uncomplete";

            SqlCommand cmd = new SqlCommand("insert into orders(OrderStatus, OrderItems, OrderType, OrderDetails, OrderSpecialties, OrderTotal, CustomerPhone, CustomerName)values(@status, @orderItem, @orderType, @orderDetails, @orderSpecialty, @orderTotal, @userPhoneNum, @customerName)", iDenCon);
            iDenCon.Open();
            if (orderType == "Delivery")
            {
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@orderItem", orderItemsData);
                cmd.Parameters.AddWithValue("@orderType", orderTypeData);
                cmd.Parameters.AddWithValue("@orderDetails", orderDetailsDeliveryData);
                cmd.Parameters.AddWithValue("@orderSpecialty", orderSpecialtyData);
                cmd.Parameters.AddWithValue("@orderTotal", orderTotalData);
                cmd.Parameters.AddWithValue("@userPhoneNum", phoneNumber);
                cmd.Parameters.AddWithValue("@customerName", customerNameData);
                cmd.ExecuteNonQuery();
            }

            else if (orderType == "Pick-up")
            {
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@orderItem", orderItemsData);
                cmd.Parameters.AddWithValue("@orderType", orderTypeData);
                cmd.Parameters.AddWithValue("@orderDetails", orderDetailsPickupData);
                cmd.Parameters.AddWithValue("@orderSpecialty", orderSpecialtyData);
                cmd.Parameters.AddWithValue("@orderTotal", orderTotalData);
                cmd.Parameters.AddWithValue("@userPhoneNum", phoneNumber);
                cmd.Parameters.AddWithValue("@customerName", customerNameData);
                cmd.ExecuteNonQuery();
            }

            //Sets All values to empty
            orderItem.Value = string.Empty;
            orderingType.Value = string.Empty;
            pickUpTime.Value = string.Empty;
            deliveryLocation.Value = string.Empty;

            conLogin.Close();
            iDenCon.Close();

            WelcomeLabel.InnerText = Session["Welcome"].ToString();
            WelcomeLabel.Visible = true;
        }
        
        //Resets Login Table 
        private void TRUNCATElogin()
        {
            conLogin.Open();

            SqlCommand truncateLogin = new SqlCommand("TRUNCATE TABLE iDen_Logins", conLogin);
            truncateLogin.ExecuteNonQuery();

            conLogin.Close();
        }
        //Sends Conformation Code
        private void SendEmailWithCode()
        {
            int _max = 9999;
            int _min = 1000;
            Random rdm = new Random();
            numberCode = rdm.Next(_min, _max);
            Session["numCode"] = numberCode;
            WelcomeLabel.Visible = false;

            Session["userEmail"] = regEmail.Value;
            string userEmail = Session["userEmail"].ToString();

            /* LOCAL
            //From, To
            MailMessage mail = new MailMessage("blhsTheDen@gmail.com", userEmail);
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            //From Login
            client.Credentials = new System.Net.NetworkCredential("blhsTheDen@gmail.com", "usd45817");
            mail.Subject = "Confirmation Code";
            mail.Body = "Here is your confirmation code: " + numberCode;
            client.EnableSsl = true;
            //Sends Mail    
            client.Send(mail); */

            SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            smtp.Credentials = new System.Net.NetworkCredential("dotg@iden-order.com", "U$d45817");
            smtp.EnableSsl = false;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("dotg@iden-order.com");
            msg.To.Add(Session["userEmail"].ToString());
            msg.Subject = "Confirmation Code";
            msg.Body = "Here is your confirmation code: " + numberCode;
            msg.IsBodyHtml = true;
            smtp.Send(msg);

            string message = "$('#confirmEmail').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }
        //Forgot login modal
        protected void btnForgotLogin_ServerClick(object sender, EventArgs e)
        {
            string message = "$('#forgotLoginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }
 //FORGOT LOGIN--------------------------------------------------------------------------------------------------------
        //Forgot login system
        private void sendForgotLoginInfo()
        {
            string email = forgotLoginEmail.Value;

            string username = string.Empty;
            string password = string.Empty;
             
            //Checks if account with email exists
                SqlCommand cmdFindInfo = new SqlCommand("SELECT Username, Password FROM iDen_Logins WHERE(Email=@email)", conLogin);
                cmdFindInfo.Parameters.AddWithValue("@email", email);
                SqlDataReader rdr = cmdFindInfo.ExecuteReader();
                while (rdr.Read())
                {
                    username = rdr["Username"].ToString();
                    password = rdr["Password"].ToString();
                }
                rdr.Close();
                conLogin.Close();

                MailMessage mail = new MailMessage("blhsTheDen@gmail.com", email);
                SmtpClient client = new SmtpClient("smtp.gmail.com");
                client.Port = 587;
                //From Login
                client.Credentials = new System.Net.NetworkCredential("blhsTheDen@gmail.com", "usd45817");
                mail.Subject = "Login Info";
                mail.Body = "Here is you login info! " + Environment.NewLine + "Username: " + username + Environment.NewLine + "Password: " + password;
                client.EnableSsl = true;
                //Sends Mail    
                client.Send(mail);
        }
        //Sends login info
        protected void btnSendEmailForgot_ServerClick(object sender, EventArgs e)
        {
            string userEmail = forgotLoginEmail.Value;

            if(userEmail != string.Empty)
            {
                conLogin.Open();
                SqlCommand cmdEmailNotFound = new SqlCommand("SELECT COUNT(*) FROM iDen_Logins where Email=@email", conLogin);
                cmdEmailNotFound.Parameters.AddWithValue("@email", userEmail);
                int emailCount = (int)cmdEmailNotFound.ExecuteScalar();
                //If email does not exist
                if (emailCount != 0)
                {
                    string message = "$('#forgotLoginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    errorForgotLogin.InnerText = "email does exist!";
                    errorForgotLogin.Visible = true;
                    conLogin.Close();
                }
                //Email exists
                else
                {
                    sendForgotLoginInfo();
                    string message = "$('#forgotLoginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    errorForgotLogin.InnerText = "Email with login informaiton was sent!";
                    errorForgotLogin.Visible = true;
                }    
            }
            else
            {
                string message = "$('#forgotLoginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                errorForgotLogin.InnerText = "email not entered";
                errorForgotLogin.Visible = true;
            }
        }

        protected void LoginButtonMain_ServerClick(object sender, EventArgs e)
        {
            Session["LoginButton"] = LoginButtonMain.InnerText;  
            if (Session["LoginButton"].ToString() == "Login")
            {
                string message = "$('#loginModal').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            else
            {
                WelcomeLabel.InnerText = "Welcome";
                WelcomeLabel.Visible = false;
                LoginButtonMain.InnerText = "Login";
            }
        }
        //Account Info
        protected void WelcomeLabel_ServerClick(object sender, EventArgs e)
        {
            string accountBalance = string.Empty;
            string membership = string.Empty;
            string date = string.Empty;

            LoginButtonMain.InnerText = "logout";

            WelcomeLabel.InnerText = Session["Welcome"].ToString();
            WelcomeLabel.Visible = true;
           
            conLogin.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM iDen_Logins WHERE Username=@u", conLogin);
            cmd.Parameters.AddWithValue("@u", Session["Welcome"].ToString());
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                accountBalance = rdr["AccountBalance"].ToString();
                membership = rdr["Membership"].ToString();
                date = rdr["MembDate"].ToString();
            }
            rdr.Close();
            conLogin.Close();
            if (accountBalance != string.Empty)
            {
                lblAccountBalance.InnerText = "Account Balance: $" + accountBalance;
            }
            else
            {
                lblAccountBalance.InnerText = "Account Balance: $0.00";
            }

            if (membership.Contains("Gold") || membership.Contains("Green"))
            {
                DateTime membDate = Convert.ToDateTime(date);

                string currentDate = DateTime.Now.ToString("MM.dd.yyyy");
                DateTime nowDate = Convert.ToDateTime(currentDate);

                var differenceDate = (membDate - nowDate).TotalDays;
                lblMembership.InnerText = "Membership: " + membership + " - " + differenceDate + " Days Remaining";
            }
            else if (membership.Contains("none"))
            {
                lblMembership.InnerText = "Membership: " + membership;
            }

            string message = "$('#userInfo').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }
    }
}