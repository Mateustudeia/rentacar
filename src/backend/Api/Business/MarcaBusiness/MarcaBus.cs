﻿using System.Collections;
using System.Collections.Generic;
using System.Management.Instrumentation;
using System.Runtime.CompilerServices;
using System.Web.Optimization;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.MarcaBusiness
{
    public class MarcaBus
    {
        private Repositorio<Marca> repositorio = new Repositorio<Marca>();

        public IList<Marca> listar()
        {
            return repositorio.Consultar();
        }

        //public Marca BuscarPorId(int id)
        //{
        //    return repositorio.RetornarPorId(id);
        //}

        //public Marca Salvar(Marca marca)
        //{
        //    return repositorio.Inserir(marca);
        //}

        //public Marca Editar(Marca novaMarca)
        //{
        //    Marca marcaSalva = repositorio.RetornarPorId(novaMarca.Id.GetValueOrDefault());

        //    if (marcaSalva == null)
        //    {
        //        throw new InstanceNotFoundException("A marca " + novaMarca.Nome + " não pôde ser encontrado na base de dados.");
        //    }

        //    marcaSalva.Nome = novaMarca.Nome;

        //    repositorio.Alterar(marcaSalva);

        //    return marcaSalva;
        //}

        //public bool Excluir(Marca marca)
        //{
        //    return repositorio.Excluir(marca);
        //}
    }
}