using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Jobprotal.Models
{
    public class DbManage
    {
        public string ConnnectionString = ConfigurationManager.ConnectionStrings["Jobprotal"].ConnectionString;
        public int count;
        public DataTable GetDataTable(string query)
        {
            SqlConnection con = new SqlConnection(ConnnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                count = Convert.ToInt32(dt.Rows.Count.ToString());
                con.Close();
                return dt;
            }
            catch (Exception)
            {
                con.Close();
                return dt;
            }
        }
        public int Execute(string query)
        {
            SqlConnection con = new SqlConnection(ConnnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                return 1;
            }
            catch (SqlException)
            {
                con.Close();
                return 0;
            }
        }
        public int Save(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection(ConnnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                cmd.ExecuteNonQuery();
                con.Close();
                return 1;
            }
            catch (Exception)
            {
                con.Close();
                return 0;
            }
        }
    }
}