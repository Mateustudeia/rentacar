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
        public IEnumerable<Aluguel> Listar()
        {
            return business.listar();
        }

        [HttpGet]
        public Aluguel Get(int id)
        {
            return business.buscarPorId(id);
        }

        [HttpPost]
        public void Alugar([FromBody]AluguelDTO aluguel)
        {
            business.alugar(aluguel);
        }

        [HttpDelete]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
