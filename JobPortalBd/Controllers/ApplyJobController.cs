using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Jobprotal.Models;
namespace Jobprotal.Controllers
{
    public class ApplyJobController : Controller
    {
        // GET: ApplyJob	
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ApplyJob()
        {
            return View();
        }
        // POST: NoticeBoard/PublishNotice	
        [HttpPost]
        public ActionResult ApplyJob(ApplyJob notice)
        {
            notice.FileName = Path.GetFileNameWithoutExtension(notice.Files.FileName);
            notice.FilePath = notice.FileName + System.IO.Path.GetExtension(notice.Files.FileName);
            string fileName = "~/NoticeFiles/" + notice.FileName + System.IO.Path.GetExtension(notice.Files.FileName);
            notice.Files.SaveAs(Server.MapPath(fileName));
            try
            {
                if (ModelState.IsValid)
                {
                    if (notice.ApplayJob())
                    {
                        ViewBag.Message = "Publish successfully";
                        ModelState.Clear();
                    }
                    else
                    {
                        ViewBag.Message = "Sorry! try again.";
                    }
                    return View();
                }
                return View();
            }
            catch
            {
                return View();
            }
        }
    }
}