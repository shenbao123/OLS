//MARL SERRANO

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LegendRentals
{
    public partial class RentalVehiclePage : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                loadVehicleType();
            }
        }
        private void loadVehicleType()
        {
            Customer login = (Customer)Session["login"];
            VehicleDAO obj_vehicleDAO = new VehicleDAO(login.CustomerID, login.PassWord);
            vehicleTypeDropDownList.DataSource = obj_vehicleDAO.GetVehicleTypes();
            vehicleTypeDropDownList.DataBind();
            customerIdLabel.Text = login.customerFirstname + " " + login.customerLastname;
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            Customer login = (Customer)Session["login"];
            VehicleDAO obj_vehicleDAO = new VehicleDAO(login.CustomerID, login.PassWord);
            string vehicleType = vehicleTypeDropDownList.SelectedValue;
            string modelVehicle = availableVehicleTextBox.Text;
            List<Vehicle> obj_vehicle_list = new List<Vehicle>();
            if (vehicleType == "0")
            {
                vehicleType = "";
            }
            obj_vehicle_list = obj_vehicleDAO.FindVehicles(vehicleType, modelVehicle);
            availableVehicleGridView.DataSource = obj_vehicle_list;
            availableVehicleGridView.Columns[1].Visible = true;
            availableVehicleGridView.DataBind();
            noVehicleLabel.Visible = (obj_vehicle_list.Count == 0);
            availableVehicleGridView.Columns[1].Visible = false;
        }

        protected void availableVehicleGridViewRowCommand(object sender, GridViewCommandEventArgs e)
        {
            Customer login = (Customer)Session["login"];
            ReservationDAO obj_reservationDAO = new ReservationDAO(login.CustomerID, login.PassWord);
            int index = Convert.ToInt32(e.CommandArgument);
            string model = Convert.ToString(availableVehicleGridView.Rows[index].Cells[2].Text);
            if (e.CommandName == "RESERVE")
            {
                bool check = obj_reservationDAO.ReserveVehicle(model);
                if(check == true){
                    errorLabel.Visible = false;
                    Response.Redirect("~/VehicleRentalReservations.aspx");
                }
                else{
                    errorLabel.Visible = true;
                }
            }

        }

        protected void reservationButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/VehicleRentalReservations.aspx");
        }
    }
}