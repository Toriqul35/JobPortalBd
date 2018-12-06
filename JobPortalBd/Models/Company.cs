using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace Jobprotal.Models
{
    public class Company
    {
        DbManage db = new DbManage();
        [Display(Name = "Company Id")]
        public string Id { get; set; }
        [Display(Name = "Company Name")]
        public string C_Name { get; set; }
        [Display(Name = "Web_Site")]
        public string Web_S { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Contact Number ")]
        public string Contact_N { get; set; }
        [Display(Name = "Establish date")]
        [DataType(DataType.Date)]
        public DateTime? Establish_date { get; set; }
        [Display(Name = "Password")]
        public string Password { get; set; }
        public bool AddCompanys()
        {
            string query = "INSERT INTO C_Register (C_Name,Web_S,Email,Contact_N,Establish_date,Password) VALUES ('" + Id + "', '" + C_Name + "', '" + Web_S + "', '" + Email + "', '" + Contact_N + "', '" + Establish_date + "', '" + Password + "')";
            int i = db.Execute(query);
            if (i >= 1)
                return true;
            else
                return false;
        }
    }
}