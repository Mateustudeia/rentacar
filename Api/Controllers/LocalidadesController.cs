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
    public class LocalidadesController : ApiController
    {
        Repositorio<Localidade> repositorio = new Repositorio<Localidade>();

        [HttpGet]
        public IEnumerable<Localidade> Listar()
        {
            return repositorio.Consultar();
        }

        [HttpGet]
        public Localidade Get(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        [HttpPost]
        public void Salvar([FromBody]Localidade localidade)
        {
            bool invalido = localidade.Nome.IsNullOrWhiteSpace()
                            || localidade.Municipio == null
                            || localidade.Bairro.IsNullOrWhiteSpace()
                            || localidade.Logradouro.IsNullOrWhiteSpace();

            if (!invalido)
            {
                repositorio.Inserir(localidade);
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
