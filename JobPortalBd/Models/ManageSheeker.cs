using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Jobprotal.Models
{
    public class ManageSheeker
    {
        private SqlConnection con;
        private void connection()
        {
            string constring = ConfigurationManager.ConnectionStrings["job"].ToString();
            con = new SqlConnection(constring);
        }
        public bool Add_Sheeker(SheekerAdd smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("AddShee_Regi", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Email", smodel.Email);
            cmd.Parameters.AddWithValue("@Name", smodel.Name);
            cmd.Parameters.AddWithValue("@Password", smodel.Password);
            cmd.Parameters.AddWithValue("@Phone_N", smodel.Phone_N);
            cmd.Parameters.AddWithValue("@Entry_date", smodel.Entry_Date);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool SheekerProfile(Sheekerprofile smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Sheeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FirstName", smodel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", smodel.LastName);
            cmd.Parameters.AddWithValue("@State", smodel.State);
            cmd.Parameters.AddWithValue("@City", smodel.City);
            cmd.Parameters.AddWithValue("@Gender", smodel.Gender);
            cmd.Parameters.AddWithValue("@Date_Of_Birth", smodel.Date_Of_Birth);
            cmd.Parameters.AddWithValue("@Contact_Number", smodel.Contact_Number);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public List<Sheekerprofile> ViewSheekerProfile()
        {
            connection();
            List<Sheekerprofile> C_Regist = new List<Sheekerprofile>();
            SqlCommand cmd = new SqlCommand("Viewsheekerprofile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                C_Regist.Add(
                    new Sheekerprofile
                    {
                        Sheker_Id = Convert.ToInt32(dr["Sheker_Id"]),
                        FirstName = Convert.ToString(dr["FirstName"]),
                        LastName = Convert.ToString(dr["LastName"]),
                        State = Convert.ToString(dr["State"]),
                        City = Convert.ToString(dr["City"]),
                        Gender = Convert.ToString(dr["Gender"]),
                        Date_Of_Birth = Convert.ToDateTime(dr["Date_Of_Birth"]),
                        Contact_Number = Convert.ToString(dr["Contact_Number"])
                    });
            }
            return C_Regist;
        }
        public bool UpdateSheekerProfile(Sheekerprofile smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("updateheekerprofile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("Sheker_Id", smodel.Sheker_Id);
            cmd.Parameters.AddWithValue("@FirstName", smodel.FirstName);
            cmd.Parameters.AddWithValue("@LastName", smodel.LastName);
            cmd.Parameters.AddWithValue("@State", smodel.State);
            cmd.Parameters.AddWithValue("@City", smodel.City);
            cmd.Parameters.AddWithValue("@Gender", smodel.Gender);
            cmd.Parameters.AddWithValue("@Date_Of_Birth", smodel.Date_Of_Birth);
            cmd.Parameters.AddWithValue("@Contact_Number", smodel.Contact_Number);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool DeleteSheekerprofile(int ID)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Deletedsheekerprofile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Sheker_Id", ID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public List<SheekerAdd> ViewSheeker()
        {
            connection();
            List<SheekerAdd> C_Regist = new List<SheekerAdd>();
            SqlCommand cmd = new SqlCommand("ViewShe_Regi", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                C_Regist.Add(
                    new SheekerAdd
                    {

                        She_Id = Convert.ToInt32(dr["She_Id"]),
                        Email = Convert.ToString(dr["Email"]),
                        Name = Convert.ToString(dr["Name"]),
                        Phone_N = Convert.ToString(dr["Phone_N"]),
                        Entry_Date = Convert.ToDateTime(dr["Entry_Date"])

                    });
            }
            return C_Regist;
        }
        public bool UpdateSheeker(SheekerAdd smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("updatesheeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("SheC_Id", smodel.She_Id);
            cmd.Parameters.AddWithValue("@Email", smodel.Email);
            cmd.Parameters.AddWithValue("@Name", smodel.Name);
            cmd.Parameters.AddWithValue("@Password", smodel.Password);
            cmd.Parameters.AddWithValue("@Phone_N", smodel.Phone_N);
            cmd.Parameters.AddWithValue("@Entry_Date", smodel.Entry_Date);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool DeleteSheeker(int ID)
        {
            connection();
            SqlCommand cmd = new SqlCommand("deletesheeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@She_Id", ID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
    }
}