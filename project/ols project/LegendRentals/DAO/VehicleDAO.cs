//TRI

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;

namespace LegendRentals
{
    public class VehicleDAO
    {
        private string CustomerId { get; set; }
        private string Password { get; set; }

        public VehicleDAO(string customerid, string password)
        {
            this.CustomerId = customerid;
            this.Password = password;
        }

        public static CustomerDAO Login(string customerid, string password)
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1};", customerid, password));
            conn.Open(); // Try to connect using given username/password - if can't connect, an exception is thrown
            conn.Close();
            return new CustomerDAO(customerid, password);
        }

        public List<Vehicle> FindVehicles(string VehicleType, string Model)
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            OracleCommand cmd = new OracleCommand("SELECT license_plate, vehicle_model, type, description FROM rental_car FULL JOIN vehicle ON vehicle.model = rental_car.vehicle_model WHERE LOWER(vehicle_model) LIKE LOWER(:vehicle_model) and LOWER(type) LIKE LOWER(:vehicle_type) and customer_id IS NULL", conn);           
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            cmd.Parameters.AddWithValue(":vehicle_type", "%" + VehicleType +"%");
            cmd.Parameters.AddWithValue(":vehicle_model", "%" + Model +"%");
            List<Vehicle> find_vehicles = new List<Vehicle>();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                string license_plate = Convert.ToString(dr["license_plate"]);
                string vehicle_model = Convert.ToString(dr["vehicle_model"]);
                string type = Convert.ToString(dr["type"]);
                string description = Convert.ToString(dr["description"]);
                find_vehicles.Add(new Vehicle(license_plate, vehicle_model, description, type));
            }
            return find_vehicles;
        }

        public List<string> GetVehicleTypes()
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            OracleCommand cmd = new OracleCommand("SELECT DISTINCT type FROM vehicle_type ORDER BY type asc", conn);
            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            List<string> find_vehicles = new List<string>();
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                string type = Convert.ToString(dr["type"]);
                find_vehicles.Add(type);
            }

            return find_vehicles;
        }



    }
}