using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Jobprotal.Models
{
    public class SheekerAdd
    {
        [Display(Name = "Id")]
        public int She_Id { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = " E_Mail Required")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = " Password Required")]
        [DataType(DataType.Password)]
        [MinLength(4, ErrorMessage = "Minimum 4 characters number")]
        public string Password { get; set; }

        [Display(Name = "Confrim Pasword")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Do not match the password")]
        public string ConfrimPassword { get; set; }

        [Display(Name = "Phone")]
        public string Phone_N { get; set; }

        [Display(Name = "Entry Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-mm-yyyy}")]
        public Nullable<System.DateTime> Entry_Date { get; set; }
    }
}