using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Jobprotal.Models
{
    public class ManageCompany
    {
        private SqlConnection con;
        private void connection()
        {
            string constring = ConfigurationManager.ConnectionStrings["job"].ToString();
            con = new SqlConnection(constring);
        }
        // **************** ADD NEW Company *********************	
        public bool Add_Company1(Companyadd smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("AddC_Registar", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@C_Name", smodel.C_Name);
            cmd.Parameters.AddWithValue("@Email", smodel.Email);
            cmd.Parameters.AddWithValue("@Web_S", smodel.Web_S);
            cmd.Parameters.AddWithValue("@Establish_date", smodel.Establish_date);
            cmd.Parameters.AddWithValue("@Entry_date", smodel.Entry_Date);
            cmd.Parameters.AddWithValue("@Password", smodel.Password);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        // ********** VIEW Company DETAILS ********************	
        public List<Companyadd> ViewC_Regi()
        {
            connection();
            List<Companyadd> C_Regist = new List<Companyadd>();
            SqlCommand cmd = new SqlCommand("Viewc_Regi", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                C_Regist.Add(
                    new Companyadd
                    {
                        C_Id = Convert.ToInt32(dr["C_Id"]),
                        C_Name = Convert.ToString(dr["C_Name"]),
                        Email = Convert.ToString(dr["Email"]),
                        Web_S = Convert.ToString(dr["Web_S"]),
                        Establish_date = Convert.ToDateTime(dr["Establish_date"]),
                        Entry_Date = Convert.ToDateTime(dr["Entry_Date"])
                    });
            }
            return C_Regist;
        }
        // ***************** UPDATE Company DETAILS *********************	
        public bool UPDATECOMPANYS(Companyadd smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("UPDATECOMPANYS", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@C_Id", smodel.C_Id);
            cmd.Parameters.AddWithValue("@C_Name", smodel.C_Name);
            cmd.Parameters.AddWithValue("@Email", smodel.Email);
            cmd.Parameters.AddWithValue("@Web_S", smodel.Web_S);
            cmd.Parameters.AddWithValue("@Established_date", smodel.Establish_date);
            cmd.Parameters.AddWithValue("@Entry_Date", smodel.Entry_Date);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        // ********************** DELETE Company DETAILS *******************	
        public bool DeleteC_regi(int ID)
        {
            connection();
            SqlCommand cmd = new SqlCommand("DeleteC_regi", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@C_Id", ID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool PublishJob(JobPost smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("job", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@J_Id", smodel.J_Id);
            cmd.Parameters.AddWithValue("@Title", smodel.Title);
            cmd.Parameters.AddWithValue("@Name", smodel.Name);
            cmd.Parameters.AddWithValue("@Status", smodel.Status);
            cmd.Parameters.AddWithValue("@Educational", smodel.Educational);
            cmd.Parameters.AddWithValue("@Experience", smodel.Experience);
            cmd.Parameters.AddWithValue("@Location", smodel.Location);
            cmd.Parameters.AddWithValue("@Salary", smodel.Salary);
            cmd.Parameters.AddWithValue("@Source", smodel.Source);
            cmd.Parameters.AddWithValue("@Vacancy", smodel.Vacancy);
            cmd.Parameters.AddWithValue("@date", smodel.date);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public List<JobPost> ViewJob()
        {
            connection();
            List<JobPost> C_Regist = new List<JobPost>();
            SqlCommand cmd = new SqlCommand("viewjobpost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sd.Fill(dt);
            con.Close();
            foreach (DataRow dr in dt.Rows)
            {
                C_Regist.Add(
                    new JobPost
                    {
                        J_Id = Convert.ToInt32(dr["J_Id"]),
                        Title = Convert.ToString(dr["Title"]),
                        Name = Convert.ToString(dr["Name"]),
                        Status = Convert.ToString(dr["Status"]),
                        Educational = Convert.ToString(dr["Educational"]),
                        Experience = Convert.ToString(dr["Experience"]),
                        Location = Convert.ToString(dr["Location"]),
                        Salary = Convert.ToString(dr["Salary"]),
                        Source = Convert.ToString(dr["Source"]),
                        Vacancy = Convert.ToString(dr["Vacancy"]),
                        date = Convert.ToDateTime(dr["date"]),
                    });
            }
            return C_Regist;
        }
        public bool DeleteJob(int ID)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Deletejobpost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@J_Id", ID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool UpdateJob(JobPost smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("updatejobpost", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Title", smodel.Title);
            cmd.Parameters.AddWithValue("@Name", smodel.Name);
            cmd.Parameters.AddWithValue("@Status", smodel.Status);
            cmd.Parameters.AddWithValue("@Educational", smodel.Educational);
            cmd.Parameters.AddWithValue("@Experience", smodel.Experience);
            cmd.Parameters.AddWithValue("@Location", smodel.Location);
            cmd.Parameters.AddWithValue("@Salary", smodel.Salary);
            cmd.Parameters.AddWithValue("@Source", smodel.Source);
            cmd.Parameters.AddWithValue("@Vacancy", smodel.Vacancy);
            cmd.Parameters.AddWithValue("@date", smodel.date);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
                return true;
            else
                return false;
        }
        public bool CompanyProfile(CompanyProfile1 smodel)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Profile_c", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", smodel.Name);
            cmd.Parameters.AddWithValue("@UserName", smodel.UserName);
            cmd.Parameters.AddWithValue("@Contact", smodel.Contact);
            cmd.Parameters.AddWithValue("@State", smodel.State);
            cmd.Parameters.AddWithValue("@City", smodel.City);
            cmd.Parameters.AddWithValue("@Address", smodel.Address);
            cmd.Parameters.AddWithValue("@Details", smodel.Details);
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