using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Jobprotal.Models;
namespace Jobprotal.Controllers
{
    public class NoticeController : Controller
    {
        // GET: NoticeBoard/PublishNotice // by admin	
        [HttpGet]
        public ActionResult PublishNotice()
        {
            return View();
        }
        // POST: NoticeBoard/PublishNotice	
        [HttpPost]
        public ActionResult PublishNotice(Notice1 notice)
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
        // GET: NoticeBoard/ViewNotice // by admin	

        public ActionResult ViewNotice()
        {
            Notice1 dbhandle = new Notice1();
            ModelState.Clear();
            return View(dbhandle.viewNotices());
        }
        public ActionResult ViewNotice1()
        {
            Notice1 dbhandle = new Notice1();
            ModelState.Clear();
            return View(dbhandle.viewNotices());
        }
        public ActionResult ViewNotice2()
        {
            Notice1 dbhandle = new Notice1();
            ModelState.Clear();
            return View(dbhandle.viewNotices());
        }
        // NoticeBoard // Download Notice file	
        [HttpGet]
        public FileResult DownloadFile(int id, Notice1 obj)
        {
            obj.GetFiles(id);
            string filepath = Server.MapPath("~/NoticeFiles/" + obj.FilePath);
            return File(filepath, "application/pdf", obj.FileName + ".pdf");
        }
        // NoticeBoard/ViewNotice // by admin	
        public ActionResult DeleteFile(int id)
        {
            try
            {
                Notice1 notice = new Notice1();
                if (notice.deleteFile(id))
                {
                    ViewBag.AlertMsg = "Delete Successfully";
                }
                return RedirectToAction("ViewNotice");
            }
            catch
            {
                return RedirectToAction("ViewNotice"); ;
            }
        }
        // GET: NoticeBoard/Notice // by all users	
        [HttpGet]
        public ActionResult Notice()
        {
            if (Request.Cookies.Get("admin") != null)
            {
                return RedirectToAction("Home", "ERP");
            }
            else
            {
                Notice1 notice = new Notice1();
                notice.Data = notice.viewNotices();
                return View(notice);
            }
        }
        // POST: NoticeBoard/Notice	
        [HttpPost]
        public ActionResult Notice(Notice1 notice)
        {
            if (Request.Cookies.Get("admin") != null)
            {
                return RedirectToAction("Home", "ERP");
            }
            else
            {
                notice.Data = notice.viewNotices();
                return View(notice);
            }
        }
    }
}