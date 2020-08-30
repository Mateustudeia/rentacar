using System;
using System.Collections.Generic;
using System.Linq;
using System.Management.Instrumentation;
using System.Web;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.ModeloBusiness
{
    public class ModeloBus
    {
        private ModeloRepositorio repositorio = new ModeloRepositorio();
        public IList<Modelo> listar()
        {
            return repositorio.Consultar();
        }

        public Modelo buscarPorId(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        public IList<Modelo> buscarPorMarca(int id)
        {
            return repositorio.buscarPorMarca(id);
        }

        public Modelo salvar(Modelo modelo)
        {
            return repositorio.Inserir(modelo);
        }

        public Modelo editar(Modelo novoModelo)
        {
            Modelo modeloSalvo = repositorio.RetornarPorId(novoModelo.Id.GetValueOrDefault());

            if (modeloSalvo == null)
            {
                throw new InstanceNotFoundException("O modelo " + novoModelo.Nome + " não pôde ser encontrado na base de dados.");
            }

            modeloSalvo.Marca = novoModelo.Marca;
            modeloSalvo.Nome = novoModelo.Nome;
            modeloSalvo.Ano = novoModelo.Ano;
            modeloSalvo.Versao = novoModelo.Versao;

            repositorio.Alterar(modeloSalvo);

            return modeloSalvo;
        }

        public bool excluir(Modelo modelo)
        {
            return repositorio.Excluir(modelo);
        }
    }
}