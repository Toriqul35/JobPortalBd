using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Jobprotal.Models
{
    public class Company_login
    {
        DataManage1 dam = new DataManage1();
        [Required(ErrorMessage = "Please enter your Email")]
        public string Email { get; set; }
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please enter your password")]
        public string Password { get; set; }
        public string Login()
        {
            string Message = "";
            string query = "SELECT* FROM C_Regi WHERE Email = '" + Email + "' AND Password = '" + Password + "'";
            dam.GetDataTable(query);
            if (dam.count != 0)
            {
                Message = "1";
                Email = Email;
            }
            else
            {
                Message = "Invalid username or password!";
            }
            return Message;
        }
    }
}