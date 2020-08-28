using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using System.Web.Optimization;
using Api.Business.ClienteBusiness;
using Microsoft.Ajax.Utilities;
using Repository.Entities;

namespace Api.Controllers
{
    public class ClientesController : ApiController
    {
        ClienteBus business = new ClienteBus();

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
        public void Cadastra([FromBody]Cliente cliente)
        {
            bool valida = cliente.Cpf != null
                          && cliente.Email != null
                          && !cliente.Nome.IsNullOrWhiteSpace();

            if (valida)
            {
                business.salvar(cliente);
            }
            else
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }
        }

        [HttpPost]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
