using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;
using Repository.Entities;
using Repository.Repositories;

namespace WebApp.Controllers
{
    public class ClienteController : Controller
    {
        public ActionResult Index()
        {
            ClienteRepositorio clienteRepositorio = new ClienteRepositorio();
            IList<Cliente> clientes = clienteRepositorio.Consultar();

            return View(clientes);
        }
    }
}