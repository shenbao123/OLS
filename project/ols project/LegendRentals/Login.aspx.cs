// TRI

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LegendRentals
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    CustomerDAO loginInfo = CustomerDAO.Login((txtUserName.Text).ToUpper(), txtPassword.Text);
                    loginInfo.AuthenticateCustomer();
                    Customer obj_customer = loginInfo.AuthenticateCustomer();
                    Session.Add("login", obj_customer);
                    Response.Redirect("~/RentalVehiclePage.aspx");
                }
                catch (Exception)
                {
                    lblInvalid.Visible = true;
                }
            }
        }
    }
}