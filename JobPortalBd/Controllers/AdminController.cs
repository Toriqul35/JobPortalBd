using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.Security;
using Jobprotal.Models;
namespace Jobprotal.Controllers
{
    public class AdminController : Controller

    {

        public ActionResult ERP()
        {
            if (Request.Cookies.Get("admin") != null)
            {
                return RedirectToAction("Index", "Admin");
            }
            else if (Request.Cookies.Get("teacher") != null)
            {
                return RedirectToAction("Index", "Teachers");
            }
            else
            {
                return View();
            }
        }
        // GET: ERP/Login // for admin	
        [HttpGet]
        public ActionResult Login()
        {
            return View();

        }
        // POST: ERP/Login	
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Admin1 admin, string ReturnUrl = "")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string message = admin.Login();
                    if (message.Equals("1"))
                    {
                        int timeout = 1440; // 1440 min = 1 day	
                        var ticket = new FormsAuthenticationTicket(admin.UserName, false, timeout);
                        string encrypted = FormsAuthentication.Encrypt(ticket);
                        HttpCookie cookie = new HttpCookie("admin", encrypted);
                        cookie.Expires = DateTime.Now.AddMinutes(timeout);
                        Response.Cookies.Add(cookie);
                        if (Url.IsLocalUrl(ReturnUrl))
                        {
                            return Redirect(ReturnUrl);
                        }
                        else
                        {
                            return RedirectToAction("Index", "Admin");
                        }
                    }
                    else
                    {
                        ViewBag.ErrorMessage = message;
                    }
                }
                return View();
            }
            catch
            {
                return View();
            }
        }

        //Logout	
        //[Authorize]	
        //[HttpPost]	
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Response.Cookies["admin"].Expires = DateTime.Now.AddDays(-1);
            return RedirectToAction("Login", "Admin");
        }
        // ERP/Home // by admin	
        public ActionResult Home()
        {
            if (Request.Cookies.Get("admin") != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "ERP");
            }
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Setting()
        {
            return View();
        }

        [HttpGet]
        public ActionResult PublishJob()
        {
            return View();
        }
        // POST: NoticeBoard/PublishNotice	
        [HttpPost]
        public ActionResult PublishJob(Notice1 notice)
        {
            notice.FileName = Path.GetFileNameWithoutExtension(notice.Files.FileName);
            notice.FilePath = notice.FileName + System.IO.Path.GetExtension(notice.Files.FileName);
            string fileName = "~/NoticeFiles/" + notice.FileName + System.IO.Path.GetExtension(notice.Files.FileName);
            notice.Files.SaveAs(Server.MapPath(fileName));
            try
            {
                if (ModelState.IsValid)
                {
                    if (notice.publishNotice())
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