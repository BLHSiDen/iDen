using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Web.Services;
using System.Net.Mail;

namespace TheDenOrderingWebApp
{
    public partial class Work : System.Web.UI.Page
    {
        SqlConnection coniDen = new SqlConnection();
        SqlConnection conLogin = new SqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            coniDen.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
            conLogin.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
        }

        protected void loginBtn_ServerClick(object sender, EventArgs e)
        {
            Session["loginEmail"] = enteredEmail.Value.ToUpper();
            string emailEntered = Session["loginEmail"].ToString();

            Session["loginPass"] = enteredPass.Value.ToUpper();
            string passwordEntered = Session["loginPass"].ToString();

            if (emailEntered == "BLHSTHEDEN@GMAIL.COM" || passwordEntered == "USD45817")
            {
                loginModal.Visible = false;
                buttons.Visible = true;
            }
            else
            {
                errorLogin.InnerText = "Incorrect email or password";
                errorLogin.Visible = true;
            }
        }

        protected void addBalance_ServerClick(object sender, EventArgs e)
        {
            string message = "$('#addMoneyModal').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            labelProgressBody.InnerText = "Deals Updated Successful";
        }

        protected void addMoney_ServerClick(object sender, EventArgs e)
        {
            Session["accountLookup"] = accountLookup.Value;
            Session["addAmount"] = txtbxAddAmount.Value;
            string addAmount = Session["addAmount"].ToString();
            Session["Username"] = txtbxUsername.Value;
            string username = Session["Username"].ToString();
            if (Session["accountLookup"].ToString() == "Username")
            {
                Session["selectMoney"] = selectAddSet.Value;
                if(Session["selectMoney"].ToString() == "setMoney") {
                    confirmationMessage.InnerText = "Please Confirm the addition of " + "$" + addAmount + " to " + username;
                }
                else if (Session["selectMoney"].ToString() == "addMoney") {
                    confirmationMessage.InnerText = "Please Confirm the addition of " + "$" + addAmount + " to " + username;
                }
            }
            else if (Session["accountLookup"].ToString() == "Email")
            {
                if (Session["selectMoney"].ToString() == "setMoney")
                {
                    confirmationMessage.InnerText = "Please Confirm the addition of " + "$" + addAmount + " to " + username;
                }
                else if (Session["selectMoney"].ToString() == "addMoney")
                {
                    confirmationMessage.InnerText = "Please Confirm the addition of " + "$" + addAmount + " to " + username;
                }
            }

            string message = "$('#confirmAddMoney').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }
        //Add Money To Account
        protected void addMoneyToAccount_ServerClick(object sender, EventArgs e)
        {
            Session["accountLookup"] = accountLookup.Value;
            string accountLook = Session["accountLookup"].ToString();
            Session["addAmount"] = txtbxAddAmount.Value;
            string addAmount = Session["addAmount"].ToString();
            Session["Username"] = txtbxUsername.Value;
            string username = Session["Username"].ToString();

            if (accountLook == "Username")
            {
                Session["selectSetMoney"] = selectAddSet.Value;
                string select = Session["selectSetMoney"].ToString();
                conLogin.Open();
                if (select == "setMoney")
                {
                    SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET AccountBalance=@account WHERE Username=@user", conLogin);
                    cmd.Parameters.AddWithValue("@user", username);
                    cmd.Parameters.AddWithValue("@account", addAmount);
                    int j = cmd.ExecuteNonQuery();
                    //Successs
                    if (j != 0)
                    {
                        string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    }
                    //Error
                    else
                    {
                        string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    }
                }
                else if (selectAddSet.Value == "addMoney")
                {
                    string accountTotal = string.Empty;


                    SqlCommand cmd = new SqlCommand("SELECT AccountBalance from iDen_Logins where Username=@user", conLogin);
                    cmd.Parameters.AddWithValue("@user", username);
                    int j = cmd.ExecuteNonQuery();
                    //Successs
                    if (j != 0)
                    {
                        SqlDataReader read = cmd.ExecuteReader();
                        while (read.Read())
                        {
                            accountTotal = (read["AccountBalance"].ToString());
                        }

                        decimal amountAdd = Convert.ToDecimal(addAmount);
                        decimal accountBal = Convert.ToDecimal(accountTotal);

                        decimal newTotal = amountAdd + accountBal;
                        string strNewTotal = newTotal.ToString();

                        read.Close();

                        SqlCommand cmdInsert = new SqlCommand("UPDATE iDen_Logins SET AccountBalance=@account WHERE Username=@user", conLogin);
                        cmdInsert.Parameters.AddWithValue("@account", strNewTotal);
                        cmdInsert.Parameters.AddWithValue("@user", username);
                        int x = cmdInsert.ExecuteNonQuery();
                        //Successs
                        if (x != 0)
                        {
                            string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                        }
                        else
                        {
                            string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                        }
                        conLogin.Close();
                    }
                    //Error
                    else
                    {
                        string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                    }
                }
                conLogin.Close();
            }
            else if (accountLook == "Email")
            {
                Session["email"] = txtbxEmail.Value;
                string email = Session["email"].ToString();
                conLogin.Open();
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET AccountBalance=@account WHERE Email=@email", conLogin);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@account", accountLook);
                int j = cmd.ExecuteNonQuery();
                //Successs
                if (j != 0)
                {
                    string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                //Error
                else
                {
                    string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                conLogin.Close();
            }
            else
            {
                string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }

        }

        protected void setMembership_ServerClick(object sender, EventArgs e)
        {
            string message = "$('#membershipModal').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }
        //Membership
        protected void Button1_ServerClick(object sender, EventArgs e)
        {
            Session["accountLookup"] = selectLookup.Value;
            string accountLook = Session["accountLookup"].ToString();
            Session["membUser"] = txtbxMembUsername.Value;
            string membUsername = Session["membUser"].ToString();
            Session["membType"] = selectMembershipType.Value;
            string membType = Session["membType"].ToString();
            Session["membEmail"] = txtbxMembEmail.Value;
            string membEmail = Session["membEmail"].ToString();
            
            conLogin.Open();
            if (accountLook == "Username")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET Membership=@ship WHERE Username=@user", conLogin);
                cmd.Parameters.AddWithValue("@user", membUsername);
                cmd.Parameters.AddWithValue("@ship", membType);
                int j = cmd.ExecuteNonQuery();
                //Successs
                if (j != 0)
                {
                    label1.InnerText = "Membership added";
                    string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                //Error
                else
                {
                    label2.InnerText = "Error while trying to update";
                    string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
            }
            else if (accountLook == "Email")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET Membership=@ship WHERE Email=@email", conLogin);
                cmd.Parameters.AddWithValue("@email", membEmail);
                cmd.Parameters.AddWithValue("@ship", membType);
                int j = cmd.ExecuteNonQuery();
                //Successs
                if (j != 0)
                {
                    label1.InnerText = "Membership added";
                    string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                //Error
                else
                {
                    label2.InnerText = "Error while trying to update";
                    string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
            }
            else if (accountLook == "All")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET Membership=@ship", conLogin);
                cmd.Parameters.AddWithValue("@ship", membType);
                int j = cmd.ExecuteNonQuery();
                //Successs
                if (j != 0)
                {
                    label1.InnerText = "Membership added";
                    string message = "$('#addSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
                //Error
                else
                {
                    label2.InnerText = "Error while trying to update";
                    string message = "$('#addError').modal({ backdrop: 'static', keyboard: false, show: true });";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
                }
            }
            conLogin.Close();

            conLogin.Open();
            string currentDate = DateTime.Now.ToString("MM.dd.yyyy");
            DateTime now = Convert.ToDateTime(currentDate);
            DateTime expDate = now.AddDays(30);
            string expiringDate = expDate.ToString("MM.dd.yyyy");

            if(accountLook == "All")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET MembDate=@date", conLogin);
                cmd.Parameters.AddWithValue("@date", expiringDate);
                cmd.ExecuteNonQuery();
            }
            else if (accountLook == "Username")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET MembDate=@date WHERE Username=@username", conLogin);
                cmd.Parameters.AddWithValue("@date", expiringDate);
                cmd.Parameters.AddWithValue("@username", membUsername);
                cmd.ExecuteNonQuery();
            }
            else if (accountLook == "Email")
            {
                SqlCommand cmd = new SqlCommand("UPDATE iDen_Logins SET MembDate=@date WHERE Email=@email", conLogin);
                cmd.Parameters.AddWithValue("@date", expiringDate);
                cmd.Parameters.AddWithValue("@email", membEmail);
                cmd.ExecuteNonQuery();
            }
            conLogin.Close();
            Session["sendEmail"] = checkSendEmail.Checked;
            string sendEmailChecked = Session["sendEmail"].ToString().ToUpper();
            if (sendEmailChecked == "TRUE")
            {
                conLogin.Open();
                if (accountLook == "All")
                {
                    string email = string.Empty;
                    SqlCommand cmdFindEmail = new SqlCommand("SELECT * FROM iDen_Logins", conLogin);
                    SqlDataReader rdr = cmdFindEmail.ExecuteReader();
                    while (rdr.Read())
                    {
                        email = rdr["Email"].ToString();

                        //MailMessage mail = new MailMessage("blhsTheDen@gmail.com", email);
                        //SmtpClient client = new SmtpClient("smtp.gmail.com");
                        //client.Port = 587;
                        ////From Login
                        //client.Credentials = new System.Net.NetworkCredential("blhsTheDen@gmail.com", "usd45817");
                        //mail.Subject = "Membership Status";
                        //mail.Body = emailContent.Value;
                        //client.EnableSsl = true;
                        ////Sends Mail   
                        //client.Send(mail);
                        Session["emailContent"] = emailContent.Value;
                        string emailCont = Session["emailContent"].ToString();

                        SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                        smtp.Credentials = new System.Net.NetworkCredential("dotg@iden-order.com", "U$d45817");
                        smtp.EnableSsl = false;

                        MailMessage msg = new MailMessage();
                        msg.From = new MailAddress("dotg@iden-order.com");
                        msg.To.Add(email);
                        msg.Subject = "Membership Status Updated";
                        msg.Body = emailCont;
                        msg.IsBodyHtml = true;
                        smtp.Send(msg);
                    }
                    rdr.Close();
                }
                else if (accountLook == "Username")
                {
                    string email = string.Empty;
                    SqlCommand cmdFindInfo = new SqlCommand("SELECT Email FROM iDen_Logins WHERE(Username=@user)", conLogin);
                    cmdFindInfo.Parameters.AddWithValue("@user", membUsername);
                    SqlDataReader rdr = cmdFindInfo.ExecuteReader();
                    while (rdr.Read())
                    {
                        email = rdr["Email"].ToString();
                    }
                    rdr.Close();
                    conLogin.Close();

                    //MailMessage mail = new MailMessage("blhsTheDen@gmail.com", email);
                    //SmtpClient client = new SmtpClient("smtp.gmail.com");
                    //client.Port = 587;
                    ////From Login
                    //client.Credentials = new System.Net.NetworkCredential("blhsTheDen@gmail.com", "usd45817");
                    //mail.Subject = "Membership Status";
                    //mail.Body = emailContent.Value;
                    //client.EnableSsl = true;
                    ////Sends Mail    
                    //client.Send(mail);
                    Session["emailContent"] = emailContent.Value;
                    string emailCont = Session["emailContent"].ToString();

                    SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                    smtp.Credentials = new System.Net.NetworkCredential("dotg@iden-order.com", "U$d45817");
                    smtp.EnableSsl = false;

                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("dotg@iden-order.com");
                    msg.To.Add(email);
                    msg.Subject = "Membership Status Updated";
                    msg.Body = emailCont;
                    msg.IsBodyHtml = true;
                    smtp.Send(msg);
                }
                else if (accountLook == "Email")
                {
                    string email = string.Empty;
                    SqlCommand cmdFindInfo = new SqlCommand("SELECT Email FROM iDen_Logins WHERE(Email=@email)", conLogin);
                    cmdFindInfo.Parameters.AddWithValue("@email", membEmail);
                    SqlDataReader rdr = cmdFindInfo.ExecuteReader();
                    while (rdr.Read())
                    {
                        email = rdr["Email"].ToString();
                    }
                    rdr.Close();
                    conLogin.Close();

                    Session["emailContent"] = emailContent.Value;
                    string emailCont = Session["emailContent"].ToString();

                    SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
                    smtp.Credentials = new System.Net.NetworkCredential("dotg@iden-order.com", "U$d45817");
                    smtp.EnableSsl = false;

                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("dotg@iden-order.com");
                    msg.To.Add(email);
                    msg.Subject = "Membership Status Updated";
                    msg.Body = emailCont;
                    msg.IsBodyHtml = true;
                    smtp.Send(msg);
                }
                conLogin.Close();
            }
        }
        protected void drinks_ServerClick(object sender, EventArgs e)
        {
            //string message = "$('#drinksModal').modal({ backdrop: 'static', keyboard: false, show: true });";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);

            //coniDen.Open();
            //if (itemOneCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemOne=@item, ItemOneDesc=@desc, ItemOneTotal=@total WHERE Id=@id", coniDen);
            //    cmd.Parameters.AddWithValue("@id", '1');
            //    cmd.Parameters.AddWithValue("@item", itemOneName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemOneDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemOneTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //if(itemTwoCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemTwo=@item, ItemTwoDesc=@desc, ItemTwoTotal=@total WHERE Id=@id", coniDen);
            //    cmd.Parameters.AddWithValue("@item", itemTwoName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemTwoDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemTwoTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //if (itemThreeCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemThree=@item, ItemThreeDesc=@desc, ItemThreeTotal=@total", coniDen);
            //    cmd.Parameters.AddWithValue("@item", itemOneName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemOneDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemOneTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //if (itemFourCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemFour=@item, ItemFourDesc=@desc, ItemFourTotal=@total", coniDen);
            //    cmd.Parameters.AddWithValue("@item", itemFourName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemFourDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemFourTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //if (itemFiveCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemFive=@item, ItemFiveDesc=@desc, ItemFiveTotal=@total", coniDen);
            //    cmd.Parameters.AddWithValue("@item", itemFourName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemFourDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemFourTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //if (itemSixCheck.Checked == true)
            //{
            //    SqlCommand cmd = new SqlCommand("UPDATE iDen_Drinks SET ItemSix=@item, ItemSixDesc=@desc, ItemSixTotal=@total", coniDen);
            //    cmd.Parameters.AddWithValue("@item", itemOneName.Value);
            //    cmd.Parameters.AddWithValue("@desc", itemOneDesc.Value);
            //    cmd.Parameters.AddWithValue("@total", itemOneTotal.Value);
            //    cmd.ExecuteNonQuery();
            //}
            //string message2 = "$('#progressSetDrinks').modal({ backdrop: 'static', keyboard: false, show: true });";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message2, true);
            //coniDen.Close();
        }
    }
}