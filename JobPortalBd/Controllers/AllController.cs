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
    public class AllController : Controller
    {
        // GET: All	
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CreateCompany()
        {
            return View();
        }
        // POST: Sheeker2/Create	
        [HttpPost]
        public ActionResult CreateCompany(Companyadd regi, string ReturnUrl = "")
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
                        return RedirectToAction("Index", "Admin");
                    }
                }
            }
            return View();
        }
        public ActionResult ViewCompanyAd()
        {
            ManageCompany dbhandle = new ManageCompany();
            ModelState.Clear();
            return View(dbhandle.ViewC_Regi());
        }
        public ActionResult ViewCompanyall()
        {
            ManageCompany dbhandle = new ManageCompany();
            ModelState.Clear();
            return View(dbhandle.ViewC_Regi());
        }
        public ActionResult EditCompanyad(int id)
        {
            ManageCompany sdb = new ManageCompany();
            return View(sdb.ViewC_Regi().Find(smodel => smodel.C_Id == id));
        }
        // POST: Student/Edit/5	
        [HttpPost]
        public ActionResult EditCompanyad(int id, Companyadd smodel)
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
        public ActionResult DeleteCompany(int id)
        {
            try
            {
                ManageCompany sdb = new ManageCompany();
                if (sdb.DeleteC_regi(id))
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
        public ActionResult CreateSheekerad()
        {
            return View();
        }
        // POST: Sheeker2/Create	
        [HttpPost]
        public ActionResult CreateSheekerad(SheekerAdd regi, string ReturnUrl = "")
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
                        return RedirectToAction("Index", "Admin");
                    }
                }
            }
            return View();
        }
        public ActionResult ViewSheekerAd()
        {
            ManageSheeker dbhandle = new ManageSheeker();
            ModelState.Clear();
            return View(dbhandle.ViewSheeker());
        }
        public ActionResult ViewSheekerall()
        {
            ManageSheeker dbhandle = new ManageSheeker();
            ModelState.Clear();
            return View(dbhandle.ViewSheeker());
        }
        public ActionResult EditSheeker(int id)
        {
            ManageSheeker sdb = new ManageSheeker();
            return View(sdb.ViewSheeker().Find(smodel => smodel.She_Id == id));
        }
        // POST: Student/Edit/5	
        [HttpPost]
        public ActionResult EditSheeker(int id, SheekerAdd smodel)
        {
            try
            {
                ManageSheeker sdb = new ManageSheeker();
                sdb.UpdateSheeker(smodel);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult DeleteSheeker(int id)
        {
            try
            {
                ManageSheeker sdb = new ManageSheeker();
                if (sdb.DeleteSheeker(id))
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
        public ActionResult ViewShekerProfileall()
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
        public ActionResult C_Profile()
        {
            return View();
        }
        public ActionResult ViewJoball()
        {
            ManageCompany dbhandle = new ManageCompany();
            ModelState.Clear();
            return View(dbhandle.ViewJob());
        }
    }
}