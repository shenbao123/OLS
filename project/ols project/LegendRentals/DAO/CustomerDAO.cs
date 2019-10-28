//HOVIG

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;

namespace LegendRentals
{
    public class CustomerDAO
    {
        private string CustomerId { get; set; }
        private string Password { get; set; }

        public CustomerDAO(string CustomerId, string Password)
        {
            this.CustomerId = CustomerId;
            this.Password = Password;
        }

        public static CustomerDAO Login(string customerid, string password)
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1};", customerid, password));
            conn.Open(); // Try to connect using given username/password - if can't connect, an exception is thrown
            conn.Close();
            return new CustomerDAO(customerid, password);
        }

        public Customer AuthenticateCustomer()
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            OracleCommand cmd = new OracleCommand("SELECT customer_id, first_name, last_name FROM customer WHERE Customer_Id = :Customer_Id", conn);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();

            cmd.Parameters.AddWithValue(":Customer_Id", CustomerId);

            da.Fill(dt);

            if (dt.Rows.Count > 0) // if customer found
            {
                string Customer_Id = Convert.ToString(dt.Rows[0]["customer_id"]);
                string First_Name = Convert.ToString(dt.Rows[0]["first_name"]);
                string Last_Name = Convert.ToString(dt.Rows[0]["last_name"]);
                return new Customer(Customer_Id, Password, First_Name, Last_Name);
            }
            else
                return null;
        }

        public void CancelVehicleReservation(string LicensePlate)
        {
            OracleConnection con = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            OracleCommand cm = new OracleCommand("UPDATE rental_car SET customer_id = null WHERE license_Plate = :license_Plate", con);
            OracleDataAdapter da = new OracleDataAdapter(cm);
            cm.Parameters.AddWithValue(":license_Plate", LicensePlate);
            con.Open();
            try
            {
                cm.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }


    }
}