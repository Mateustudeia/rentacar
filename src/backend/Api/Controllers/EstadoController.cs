using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using System.Web.Optimization;
using Api.Business.ClienteBusiness;
using Microsoft.Ajax.Utilities;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class EstadosController : ApiController
    {
        Repositorio<Estado> repositorio = new Repositorio<Estado>();

        [HttpGet]
        public IEnumerable<Estado> Listar()
        {
            return repositorio.Consultar();
        }

        [HttpGet]
        public Estado Get(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        [HttpPost]
        public void Salvar([FromBody]Estado estado)
        {
            bool invalido = estado.Nome.IsNullOrWhiteSpace()
                          || estado.Sigla.IsNullOrWhiteSpace();

            if (!invalido)
            {
                repositorio.Inserir(estado);
            }
            else
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }
        }

        [HttpPost]
        public void Excluir(int id)
        {
            repositorio.Excluir(repositorio.RetornarPorId(id));
        }
    }
}
