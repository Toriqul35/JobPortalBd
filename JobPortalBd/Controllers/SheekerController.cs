using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using Jobprotal.Models;
using System.Web.Security;
using System.Web.Mvc;

namespace Jobprotal.Controllers
{
    public class SheekerController : Controller
    {
        // GET: Sheeker
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
        public ActionResult Create(SheekerAdd regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageSheeker jm = new ManageSheeker();
                if (jm.Add_Sheeker(regi))
                {
                    ViewBag.Message = "You Have Done Registration";
                    ModelState.Clear();

                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Sheeker");
                    }
                }
            }
            return View();
        }
        public ActionResult Setting()
        {
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
        public ActionResult Login(Sheeker_Login sheeker, string ReturnUrl = "")
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string message = sheeker.Login();
                    if (message.Equals("1"))
                    {
                        int timeout = 1440; // 1440 min = 1 day
                        var ticket = new FormsAuthenticationTicket(sheeker.Email, false, timeout);
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
                            return RedirectToAction("Index", "Sheeker");
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
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Response.Cookies["admin"].Expires = DateTime.Now.AddDays(-1);
            return RedirectToAction("Index", "Home");
        }


        public ActionResult CreateProfile1()
        {
            return View();
        }
        // POST: Sheeker2/Create
        [HttpPost]
        public ActionResult CreateProfile1(Sheekerprofile regi, string ReturnUrl = "")
        {
            if (ModelState.IsValid)
            {
                ManageSheeker jm = new ManageSheeker();
                if (jm.SheekerProfile(regi))
                {
                    ViewBag.Message = "You Have Done Create Profile";
                    ModelState.Clear();

                    if (Url.IsLocalUrl(ReturnUrl))
                    {
                        return Redirect(ReturnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Sheeker");
                    }
                }
            }
            return View();
        }
        public ActionResult ViewShekerProfile()
        {
            ManageSheeker dbhandle = new ManageSheeker();
            ModelState.Clear();
            return View(dbhandle.ViewSheekerProfile());

        }

        public ActionResult EditSheekerProfile(int id)
        {
            ManageSheeker sdb = new ManageSheeker();
            return View(sdb.ViewSheekerProfile().Find(smodel => smodel.Sheker_Id == id));
        }

        // POST: Student/Edit/5
        [HttpPost]
        public ActionResult EditSheekerProfile(int id, Sheekerprofile smodel)
        {
            try
            {
                ManageSheeker sdb = new ManageSheeker();
                sdb.UpdateSheekerProfile(smodel);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult DeleteSheekerProfile(int id)
        {
            try
            {
                ManageSheeker sdb = new ManageSheeker();
                if (sdb.DeleteSheekerprofile(id))
                {
                    ViewBag.AlertMsg = "Student Deleted Successfully";
                }
                return RedirectToAction("Index", "Sheeker");
            }
            catch
            {
                return View();
            }



        }


    }
}