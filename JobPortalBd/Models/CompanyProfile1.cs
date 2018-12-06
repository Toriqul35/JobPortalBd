using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Jobprotal.Models
{
    public class CompanyProfile1
    {
        [Display(Name = "Company Id")]
        public int C_Id { get; set; }
        [Display(Name = "Name")]
        public string Name { get; set; }
        [Display(Name = " User Name")]
        public string UserName { get; set; }
        [Display(Name = "Contact Number")]
        public int Contact { get; set; }
        [Display(Name = "State")]
        public string State { get; set; }
        [Display(Name = "City")]
        public string City { get; set; }
        [Display(Name = "Address")]
        public string Address { get; set; }
        [Display(Name = "Details")]
        public string Details { get; set; }
    }
}