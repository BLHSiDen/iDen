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
using System.Net.Mail;


namespace TheDenOrderingWebApp
{
    public partial class OrderView : System.Web.UI.Page
    {
        SqlConnection iDenCon = new SqlConnection();
        SqlConnection conLogin = new SqlConnection();
        
        public int numOrdersTotal = 0;
        static int numBobcatOrdered = 0;
        public double bobcatTotal = 0;
        static int numCoffeeOrdered = 0;
        public double coffeeTotal = 0;
        static int numLemonadeOrdered = 0;
        public double lemonadeTotal = 0;
        static int numHotChocOrdered = 0;
        public double hotchocTotal = 0;
        static int numChaiOrdered = 0;
        public double chaiTotal = 0;

        public double totalMade = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            iDenCon.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];
            conLogin.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["ConnectionInfo"];

        }
//LOGIN---------------------------------------------------------------------------------------------------------
        protected void loginBtn_ServerClick(object sender, EventArgs e)
        {
            Session["emailEntered"] = enteredEmail.Value;
            string emailEntered = Session["emailEntered"].ToString();
            string lowerEmailEntered = emailEntered.ToLower();
            Session["passwordEntered"] = enteredPass.Value;
            string passwordEntered = Session["passwordEntered"].ToString();
            string lowerPasswordEntered = passwordEntered.ToLower();

            if (lowerEmailEntered == "blhstheden@gmail.com" || lowerPasswordEntered == "usd45817")
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
//UNCOMPLETE ORDERS---------------------------------------------------------------------------------------------------------
        //Shows orders that are not started
        protected void unCompleteOrdersbtn_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            unCompleteOrders.Visible = true;
            workingOnOrders.Visible = false;
            outboundOrders.Visible = false;

            using (iDenCon)
            {
                iDenCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM orders WHERE OrderStatus=@status", iDenCon);
                cmd.Parameters.AddWithValue("@status", "uncomplete");
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                unCompleteOrdersTable.DataSource = dtbl;
                unCompleteOrdersTable.DataBind();
                iDenCon.Close();
            }
        }
 //WORKING ON---------------------------------------------------------------------------------------------------------
        //Shows orders that are being worked-on
        protected void workOnOrdersbtn_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            unCompleteOrders.Visible = false;
            workingOnOrders.Visible = true;
            outboundOrders.Visible = false;

            using (iDenCon)
            {

                iDenCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM orders WHERE OrderStatus=@status", iDenCon);
                cmd.Parameters.AddWithValue("@status", "workingon");
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                workingOnTable.DataSource = dtbl;
                workingOnTable.DataBind();
                iDenCon.Close();
            }

        }
        //OUTBOUND ---------------------------------------------------------------------------------------------------------
        //Shows orders that are outbound to the location of the delivery
        protected void outBoundOrdersbtn_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            unCompleteOrders.Visible = false;
            workingOnOrders.Visible = false;
            outboundOrders.Visible = true;

            using (iDenCon)
            {

                iDenCon.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM orders WHERE OrderStatus=@status", iDenCon);
                cmd.Parameters.AddWithValue("@status", "complete");
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                outboundTable.DataSource = dtbl;
                outboundTable.DataBind();
                iDenCon.Close();
            }
        }
        ////UNCOMPLETE ---> WORKING ON---------------------------------------------------------------------------------------------------------
        protected void btnSendToWO_ServerClick(object sender, EventArgs e)
            {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            string id = Session["id"].ToString();

            string status = "workingon";

            iDenCon.Open();
            SqlCommand cmd = new SqlCommand("UPDATE orders SET OrderStatus=@status where OrderID=@id", iDenCon);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@id", id);

            int x = cmd.ExecuteNonQuery();
            if (x != 0)
            {
                string message = "$('#moveSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            else
            {
                string message = "$('#moveError').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            iDenCon.Close();
        }

        protected void btnSendToWObefore_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            Session["id"] = txtbxUCtoWO.Value;
            string idEntered = Session["id"].ToString();

            string message = "$('#confirmMoveUCtoWO').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            bodyconfirmMoveUCtoWO.InnerText = "Confirm you are working on order number:" + idEntered;
            bodyconfirmMoveUCtoWO.Visible = true;
        }
        //Deal of the day
        protected void dealOfTheDaybtn_ServerClick(object sender, EventArgs e)
        {

        }

        //Confirm WO to OB
        protected void btnSendToOBbefore_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            Session["idWO"] = inputWOtoOB.Value;
            string idEntered = Session["idWO"].ToString();

            string message = "$('#confirmWOtoOB').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            bodyconfirmWOtoOB.InnerText = "Confirm order number:" + idEntered + " is complete!";
            bodyconfirmWOtoOB.Visible = true;
        }
//WORKING ON ---> OUTBOUND ---------------------------------------------------------------------------------------------------------
        //Moves order from WO to OB
        protected void btnSendToOB_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            string status = "complete";
            string id = Session["idWO"].ToString();

            iDenCon.Open();
            SqlCommand cmd = new SqlCommand("UPDATE orders SET OrderStatus=@status where OrderID=@id", iDenCon);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@id", id);

            int x = cmd.ExecuteNonQuery();
            if (x != 0)
            {
                string message = "$('#moveSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            else
            {
                string message = "$('#moveError').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            iDenCon.Close();
        }

        protected void btnOrderDoneBefore_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            Session["idOB"] = inputDone.Value;
            string id = Session["idOB"].ToString();

            string message = "$('#confirmOBtoDel').modal({ backdrop: 'static', keyboard: false, show: true });";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            bodyconfirmOBtoDel.InnerText = "Confirm that order:" + id + " was successfully recieved by the customer!";
            bodyconfirmOBtoDel.Visible = true;
        }

        protected void btnOrderDone_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;

            string id = Session["idOB"].ToString();

            iDenCon.Open();
            SqlCommand cmd = new SqlCommand("DELETE from orders WHERE OrderID=@id", iDenCon);
            cmd.Parameters.AddWithValue("@id", id);
            int x = cmd.ExecuteNonQuery();
            if (x != 0)
            {
                string message = "$('#moveSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            else
            {
                string message = "$('#moveError').modal({ backdrop: 'static', keyboard: false, show: true });";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
            }
            iDenCon.Close();
            //iDenCon.Open();
            ////Finds Phonenumber value
            //SqlCommand cmd1 = new SqlCommand("SELECT OrderItems FROM ordersOB WHERE (OrderID='" + idEntered + "')", iDenCon);
            //SqlDataReader reader = null;
            //reader = cmd1.ExecuteReader();
            //while (reader.Read())
            //{
            //    itemOrdered = reader["OrderItems"].ToString();
            //}
            //reader.Close();

            //if (itemOrdered.Contains("Bobcat"))
            //{
            //    numBobcatOrdered++;
            //}
            //else if (itemOrdered.Contains("Coffee"))
            //{
            //    numCoffeeOrdered++;
            //}
            //else if (itemOrdered.Contains("Lemonade"))
            //{
            //    numLemonadeOrdered++;
            //}
            //else if (itemOrdered.Contains("Hot Chocolate"))
            //{
            //    numHotChocOrdered++;
            //}
            //else if (itemOrdered.Contains("Chai"))
            //{
            //    numChaiOrdered++;
            //}

            ////Send Text : Thank you text
            ////Deletes from OB table
            //SqlCommand cmdDelete = null;
            //string commandDelText = "DELETE from ordersOB WHERE (OrderID='" + idEntered + "')";
            //cmdDelete = new SqlCommand(commandDelText);
            //cmdDelete.Connection = iDenCon;
            //cmdDelete.ExecuteNonQuery();
            //iDenCon.Close();

            //string message = "$('#moveSuccessful').modal({ backdrop: 'static', keyboard: false, show: true });";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", message, true);
        }

        private void TRUNCATEuc()
        {
            //iDenCon.Open();
            //SqlCommand cmd = new SqlCommand("TRUNCATE TABLE ordersUC", iDenCon);
            //cmd.ExecuteNonQuery();
            //iDenCon.Close();
        }
        private void TRUNCATEwo()
        {
            //iDenCon.Open();
            //SqlCommand cmd = new SqlCommand("TRUNCATE TABLE ordersWO", iDenCon);
            //cmd.ExecuteNonQuery();
            //iDenCon.Close();
        }
        private void TRUNCATEob()
        {
            //iDenCon.Open();
            //SqlCommand cmd = new SqlCommand("TRUNCATE TABLE OrdersOB_Info", iDenCon);
            //cmd.ExecuteNonQuery();
            //iDenCon.Close();
        }

        protected void btnStartDay_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;
            buttons.Visible = true;

            btnStartDay.Visible = false;
            btnEndDay.Visible = true;

            orderBTNs.Visible = true;
        }
//END OF DAY---------------------------------------------------------------------------------------------------------
        protected void btnEndDay_ServerClick(object sender, EventArgs e)
        {
            loginModal.Visible = false;

            btnStartDay.Visible = true;
            btnEndDay.Visible = false;

            orderBTNs.Visible = false;
            outboundOrders.Visible = false;

            ////Finds Total
            //bobcatTotal = 2.50 * numBobcatOrdered;
            //coffeeTotal = 2.00 * numCoffeeOrdered;
            //lemonadeTotal = 1.00 * numLemonadeOrdered;
            //hotchocTotal = 1.00 * numHotChocOrdered;
            //chaiTotal = 1.50 * numChaiOrdered;

            //string date = DateTime.Now.ToString("MM/dd");

            //totalMade = bobcatTotal + coffeeTotal + lemonadeTotal + hotchocTotal + chaiTotal;

            ////Email Body
            //string mailBody = "Here is today's online report!" + Environment.NewLine + Environment.NewLine +
            //    "Number of Bobcats Sold: " + numBobcatOrdered + Environment.NewLine + Environment.NewLine +
            //    "Number of Coffees Sold: " + numCoffeeOrdered + Environment.NewLine + Environment.NewLine +
            //    "Number of Lemonades Sold: " + numLemonadeOrdered + Environment.NewLine + Environment.NewLine +
            //    "Number of Hot Chocolate Sold: " + numHotChocOrdered + Environment.NewLine + Environment.NewLine +
            //    "Number of Chais Sold: " + numChaiOrdered + Environment.NewLine + Environment.NewLine +
            //    " --- TOTAL: $" + totalMade + " ---" + Environment.NewLine + Environment.NewLine;

            ////From, To
            //SmtpClient smtp = new SmtpClient("relay-hosting.secureserver.net", 25);
            //smtp.Credentials = new System.Net.NetworkCredential("dotg@iden-order.com", "U$d45817");
            //smtp.EnableSsl = false;

            //MailMessage msg = new MailMessage();
            //msg.From = new MailAddress("dotg@iden-order.com");
            //msg.To.Add("blhstheden@gmail.com");
            //msg.Subject = "Today's Report";
            //msg.Body = mailBody;
            //msg.IsBodyHtml = true;
            //smtp.Send(msg);
        }
    }
}