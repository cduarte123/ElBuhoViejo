using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElBuhoViejo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Acerca de Nosotross.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contacto";

            return View();
        }

        public ActionResult Nosotros()
        {
            ViewBag.Message = "Nosotros";

            return View();
        }
    }
}