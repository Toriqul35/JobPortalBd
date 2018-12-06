using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Jobprotal.Models;
using System.Web.Security;
using System.Web.Mvc;
namespace Jobprotal.Controllers
{
    public class CompanyController : Controller
    {
        // GET: Company	
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
        // POST: Sheeker2/Create	
        [HttpPost]

        public ActionResult Create(Companyadd regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageCompany jm = new ManageCompany();
                if (jm.Add_Company1(regi))
                {
                    ViewBag.Message = "You Have Done Registration";
                    ModelState.Clear();
                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Company");
                    }
                }
            }
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        // POST: ERP/Login	
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Company_login Company, string ReturnUrl = "")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string message = Company.Login();
                    if (message.Equals("1"))
                    {
                        int timeout = 1440; // 1440 min = 1 day	
                        var ticket = new FormsAuthenticationTicket(Company.Email, false, timeout);
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
                            return RedirectToAction("Index", "Company");
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
        public ActionResult Setting()
        {
            return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Response.Cookies["admin"].Expires = DateTime.Now.AddDays(-1);
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ViewCompany()
        {
            ManageCompany dbhandle = new ManageCompany();
            ModelState.Clear();
            return View(dbhandle.ViewC_Regi());
        }

        public ActionResult Edit(int id)
        {
            ManageCompany sdb = new ManageCompany();
            return View(sdb.ViewC_Regi().Find(smodel => smodel.C_Id == id));
        }
        // POST: Student/Edit/5	
        [HttpPost]
        public ActionResult Edit(int id, Companyadd smodel)
        {
            try
            {
                ManageCompany sdb = new ManageCompany();
                sdb.UPDATECOMPANYS(smodel);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult PublishedPost()
        {
            return View();
        }
        [HttpPost]
        public ActionResult PublishedPost(JobPost regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageCompany jm = new ManageCompany();
                if (jm.PublishJob(regi))
                {
                    ViewBag.Message = "You Have Done Registration";
                    ModelState.Clear();
                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Company");
                    }
                }
            }
            return View();
        }
        public ActionResult PublishedPostC()
        {
            return View();
        }
        [HttpPost]
        public ActionResult PublishedPostC(JobPost regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageCompany jm = new ManageCompany();
                if (jm.PublishJob(regi))
                {
                    ViewBag.Message = "You Have Done Registration";
                    ModelState.Clear();
                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Company");
                    }
                }
            }
            return View();
        }
        public ActionResult ViewJob()
        {
            ManageCompany dbhandle = new ManageCompany();
            ModelState.Clear();
            return View(dbhandle.ViewJob());
        }
        public ActionResult DeleteJob(int id)
        {
            try
            {
                ManageCompany sdb = new ManageCompany();
                if (sdb.DeleteJob(id))
                {
                    ViewBag.AlertMsg = "Student Deleted Successfully";
                }
                return RedirectToAction("Index", "Admin");
            }
            catch
            {
                return View();
            }

        }
        public ActionResult UpdadeJob(int id)
        {
            ManageCompany sdb = new ManageCompany();
            return View(sdb.ViewJob().Find(smodel => smodel.J_Id == id));
        }
        public ActionResult CreateProfile123()
        {
            return View();
        }
        // POST: Sheeker2/Create	
        [HttpPost]
        public ActionResult Createprofile123(CompanyProfile1 regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageCompany jm = new ManageCompany();
                if (jm.CompanyProfile(regi))
                {
                    ViewBag.Message = "You Have Done Registration";
                    ModelState.Clear();
                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Company");
                    }
                }
            }
            return View();
        }
    }
}