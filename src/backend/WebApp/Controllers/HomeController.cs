using Repository.Entities;
using Repository.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            VeiculoRepositorio veiculoRepositorio = new VeiculoRepositorio();
            IList<Veiculo> veiculos = veiculoRepositorio.Consultar();

            return View(veiculos);
        }
    }
}