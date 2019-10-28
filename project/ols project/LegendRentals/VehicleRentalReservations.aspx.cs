// HOVIG

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LegendRentals
{
    public partial class VehicleRentalReservations : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                Customer login = (Customer)Session["login"];
                ReservationDAO reservedao = new ReservationDAO(login.CustomerID, login.PassWord);
                List<Vehicle> obj_vehicleList = new List<Vehicle>();
                obj_vehicleList = reservedao.GetReservation();
                gridViewCustResvs.DataSource = obj_vehicleList;
                gridViewCustResvs.Columns[1].Visible = true;
                gridViewCustResvs.DataBind();
                gridViewCustResvs.Columns[1].Visible = false;
                lblFirstLastName.Text = login.customerFirstname + " " + login.customerLastname;
                errorLabel.Visible = (obj_vehicleList.Count == 0);

            }
        }

        protected void reservationPageButton_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/RentalVehiclePage.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/RentalVehiclePage.aspx");
        }

        protected void CancelReservation(object sender, GridViewCommandEventArgs e)
        {
            //gridViewCustResvs.Columns.Clear();
            Customer login = (Customer)Session["login"];
            CustomerDAO cust = new CustomerDAO(login.CustomerID, login.PassWord);
            int index = Convert.ToInt32(e.CommandArgument);
            string LicensePlate = Convert.ToString(gridViewCustResvs.Rows[index].Cells[1].Text);
            cust.CancelVehicleReservation(LicensePlate);
            Response.Redirect("~/VehicleRentalReservations.aspx");

        }
    }
}