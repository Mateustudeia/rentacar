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
    public class ModeloController : ApiController
    {
        Repositorio<Modelo> repositorio = new Repositorio<Modelo>();

        [HttpGet]
        public IEnumerable<Modelo> Listar()
        {
            return repositorio.Consultar();
        }

        [HttpGet]
        public Modelo Get(int id)
        {
            return repositorio.RetornarPorId(id);
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

            if(modelo.Id == null){
                repositorio.Inserir(modelo);
            }
            else
            {
                Modelo modeloSalvo = repositorio.RetornarPorId(modelo.Id.GetValueOrDefault());

                modeloSalvo.Marca = modelo.Marca;
                modeloSalvo.Nome = modelo.Nome;
                modeloSalvo.Ano = modelo.Ano;
                modeloSalvo.Versao = modelo.Versao;

                repositorio.Alterar(modeloSalvo);
            }
        }

        [HttpPost]
        public void Excluir(int id)
        {
            repositorio.Excluir(repositorio.RetornarPorId(id));
        }
    }
}
