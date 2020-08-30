using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using System.Web.Optimization;
using Api.Business.ClienteBusiness;
using Api.Business.ModeloBusiness;
using Microsoft.Ajax.Utilities;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class ModeloController : ApiController
    {
        ModeloBus business = new ModeloBus();

        [HttpGet]
        public IEnumerable<Modelo> Listar()
        {
            return business.listar();
        }

        [HttpGet]
        public Modelo Get(int id)
        {
            return business.buscarPorId(id);
        }

        [HttpGet]
        public Modelo GetByMarca(int id)
        {
            return business.buscarPorMarca(id);
        }

        [HttpPost]
        public void Salvar([FromBody]Modelo modelo)
        {
            // Avaliar validações
            bool invalido = modelo.Nome.IsNullOrWhiteSpace()
                            || modelo.Ano == null;

            if (invalido)
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }

            if (modelo.Id == null)
            {
                business.salvar(modelo);
            }
            else
            {
                business.editar(modelo);
            }
        }

        [HttpPost]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
