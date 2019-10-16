using ElBuhoViejo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElBuhoViejo.Controllers
{
    public class ContactoController : Controller
    {


        private BibliotecaVirtualEntities db = new BibliotecaVirtualEntities();
        
        public ActionResult Index()
        {
            List<Contacto> listaContacto = db.Contacto.ToList();
            return View(listaContacto);
        }
    }

}