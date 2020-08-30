using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using System.Web.Optimization;
using Api.Business.MarcaBusiness;
using Microsoft.Ajax.Utilities;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class MarcasController : ApiController
    {
        MarcaBus repositorio = new MarcaBus();

        [HttpGet]
        public IEnumerable<Marca> Listar()
        {
            return repositorio.listar();
        }

        //[HttpGet]
        //public Marca Get(int id)
        //{
        //    return repositorio.BuscarPorId(id);
        //}

        //[HttpPost]
        //public void Salvar([FromBody]Marca marca)
        //{
        //    if (!marca.Nome.IsNullOrWhiteSpace())
        //    {
        //        if (marca.Id == null) {

        //            Marca marcaSalva = repositorio.BuscarPorId(marca.Id.GetValueOrDefault());

        //            marcaSalva.Modelos.Clear();

        //            marcaSalva.Nome = marca.Nome;
        //            marcaSalva.Modelos = marca.Modelos;

        //        }

        //        repositorio.Salvar(marca);
        //    }
        //    else
        //    {
        //        throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
        //    }
        //}

        //[HttpPost]
        //public void Excluir(int id)
        //{
        //    repositorio.Excluir(repositorio.BuscarPorId(id));
        //}
    }
}
