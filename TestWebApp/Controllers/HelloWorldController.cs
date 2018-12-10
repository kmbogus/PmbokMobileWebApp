using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestWebApp.Controllers
{
    public class HelloWorldController : Controller
    {
        // GET: HelloWorld
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Welcome(string message,int numtimes = 1)
        {
            ViewBag.Message = "Your message " + message;
            ViewBag.NumTimes = numtimes;

            return View();


        }
    }
}