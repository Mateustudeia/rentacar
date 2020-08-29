using System.Collections.Generic;
using System.IO;
using System.Web.Http;
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

        [HttpGet]
        public Cliente GetByCpf(string cpf)
        {
            return business.buscarPorCpf(cpf);
        }

        [HttpPost]
        public void Salvar([FromBody]Cliente cliente)
        {
            bool valida = cliente.Cpf != null
                          && cliente.Email != null
                          && !cliente.Nome.IsNullOrWhiteSpace();

            if (!valida)
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }

            if (cliente.Id == null)
            {
                business.salvar(cliente);
            }
            else
            {
                business.editar(cliente);
            }
        }

        [HttpDelete]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
