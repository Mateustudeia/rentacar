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
        readonly AluguelBus _business = new AluguelBus();

        [HttpGet]
        public IEnumerable<Aluguel> Listar()
        {
            return _business.Listar();
        }

        [HttpPost]
        public IEnumerable<Aluguel> ListarPorCliente(Cliente cliente)
        {
            return _business.ListarPorCliente(cliente);
        }

        [HttpGet]
        public Aluguel Get(int id)
        {
            return _business.BuscarPorId(id);
        }

        [HttpPost]
        public void Alugar([FromBody]AluguelDTO aluguel)
        {
            _business.Alugar(aluguel);
        }

        [HttpPost]
        public void Devolver([FromBody]Aluguel aluguel)
        {
            _business.Devolver(aluguel);
        }

        [HttpDelete]
        public void Excluir(int id)
        {
            _business.Excluir(_business.BuscarPorId(id));
        }
    }
}
