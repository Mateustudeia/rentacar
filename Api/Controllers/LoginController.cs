using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class LoginController : Controller
    {
        [HttpPost]
        public bool Login(string login, string senha)
        {
            UsuarioRepositorio repositorio = new UsuarioRepositorio();

            return repositorio.Login(login, senha);
        }
    }
}
