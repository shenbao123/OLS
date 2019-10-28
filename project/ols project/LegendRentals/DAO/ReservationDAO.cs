//MARL SERRANO

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;

namespace LegendRentals
{
    public class ReservationDAO
    {
        private string CustomerId;
        private string Password;
        public ReservationDAO(string CustomerId, string Password)
        {
            this.CustomerId = CustomerId;
            this.Password = Password;
        }
        public List<Vehicle> GetReservation()
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            //OracleCommand cmd = new OracleCommand("select * from rental_car where customer_id = :CUSTOMER_ID", conn);
            OracleCommand cmd = new OracleCommand("select license_plate, vehicle_model, description, type from rental_car inner join vehicle on rental_car.vehicle_model = vehicle.model where customer_id = (select user from dual)", conn);

            OracleDataAdapter da = new OracleDataAdapter(cmd);
            DataTable dt = new DataTable();
            List<Vehicle> obj_vehicle_list = new List<Vehicle>();

            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                string license_plate = Convert.ToString(dr["license_plate"]);
                string vehicle_model = Convert.ToString(dr["vehicle_model"]);
                string description = Convert.ToString(dr["description"]);
                string type = Convert.ToString(dr["type"]);
                obj_vehicle_list.Add(new Vehicle(license_plate, vehicle_model, description, type));

            }
            return obj_vehicle_list;
        }
        
        public Boolean ReserveVehicle(string Model)
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", CustomerId, Password));
            OracleCommand cmd = new OracleCommand("RESERVE_VEHICLE", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("pmodel", Model);
            cmd.Parameters.Add("psuccess", OracleType.Int32).Direction = ParameterDirection.Output;

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                return Convert.ToBoolean(Convert.ToInt32(cmd.Parameters["psuccess"].Value));
            }
            catch (Exception)
            {
                return Convert.ToBoolean(Convert.ToInt32(cmd.Parameters["psuccess"].Value));
            }
            finally
            {
                conn.Close();
            }
        }
    }
}