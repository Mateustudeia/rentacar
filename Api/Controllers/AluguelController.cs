using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using Api.Business.AluguelBusiness;
using Api.Business.ClienteBusiness;
using Microsoft.Ajax.Utilities;
using Repository.Entities;

namespace Api.Controllers
{
    public class AluguelController : ApiController
    {
        AluguelBus business = new AluguelBus();

        [HttpGet]
        public IEnumerable<Cliente> Listar()
        {
            return business.listar();
        }

        [HttpGet]
        public Cliente Get(int id)
        {
            return business.buscarPorId(id);
        }

        [HttpPost]
        public void Alugar([FromBody]AluguelDTO aluguel)
        {
            // Isso será implementado logo em brevaa :)
            throw new NotImplementedException();
        }

        [HttpDelete]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
