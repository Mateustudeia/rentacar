using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class Usuario
    {
        public string login { get; set; }
        public string senha { get; set; }
    }
    public class LoginController : ApiController
    {
        [HttpPost]
        public bool Logar([FromBody] Usuario usuario)
        {
            UsuarioRepositorio repositorio = new UsuarioRepositorio();

            return repositorio.Login(usuario.login, usuario.senha);
        }
    }
}
