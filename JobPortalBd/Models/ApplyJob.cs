using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
namespace Jobprotal.Models
{
    public class ApplyJob
    {
        DbManage dm = new DbManage();
        public int Id { get; set; }

        [Required(ErrorMessage = "Title required")]
        [Display(Name = "Name")]
        public string FileName { get; set; }

        [Display(Name = "Contact Number")]
        public string Contact_N { get; set; }

        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Uploaded file")]
        public string FilePath { get; set; }

        public HttpPostedFileBase Files { get; set; }
        public bool ApplayJob()
        {
            string query = @"INSERT INTO ApplyJob (FileName, Contact_N,Email, FilePath) VALUES ('" + FileName + "', '" + Contact_N + "',  '" + Email + "','" + FilePath + "'')";
            int i = dm.Execute(query);
            if (i >= 1)
                return true;
            else
                return false;
        }
    }
}