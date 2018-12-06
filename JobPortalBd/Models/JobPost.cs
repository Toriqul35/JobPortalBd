using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Jobprotal.Models
{
    public class JobPost
    {
        // DataManage1 DM = new DataManage1();	
        [Display(Name = "J_Id")]
        public int J_Id { get; set; }

        [Display(Name = "Job_Title")]
        public string Title { get; set; }

        [Display(Name = "Company Name")]
        public string Name { get; set; }

        [Display(Name = "Employee Status")]
        public string Status { get; set; }

        [Display(Name = "Educational Requirnment")]
        public string Educational { get; set; }

        [Display(Name = "Experience Requirnment")]
        public string Experience { get; set; }

        [Display(Name = "Location")]
        public string Location { get; set; }

        [Display(Name = "Salary")]
        public string Salary { get; set; }

        [Display(Name = "Job Sorurce")]
        public string Source { get; set; }

        [Display(Name = "Vacancy")]
        public string Vacancy { get; set; }

        [Display(Name = "Dateline")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd-mm-yyyy}")]
        public Nullable<System.DateTime> date { get; set; }
        /*	

       public bool publishjob()	
       {	
            string query =@"INSERT INTO postjobs (Job_Title, Company_Name, Employee_Status, Educational_R,Experience_R,Job_Location,Salary,Job_Source,No_Vacancy,L_date) VALUES	
                              ('" + Job_Title + "', '" + Company_Name + "', '" + Employee_Status + "', '" + Educational_R + "','" + Experience_R + "','" + Job_Location + "','" + Salary + "','" + Job_Source + "','" + No_Vacancy + "','" + L_date + "','"+ District"'+)";	
            int i = DM.Execute(query);	
            if (i >= 1)	
               return true;	
           else	
               return false;	
       }	
       */
    }
}
