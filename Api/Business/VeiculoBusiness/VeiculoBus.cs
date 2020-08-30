using System;
using System.Collections.Generic;
using System.Management.Instrumentation;
using System.Web.UI;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.VeiculoBusiness
{
    public class VeiculoBus
    {
        private VeiculoRepositorio repositorio = new VeiculoRepositorio();

        public IList<Veiculo> listar()
        {
            return repositorio.Consultar();
        }

        public Veiculo buscarPorId(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        public Veiculo salvar(Veiculo veiculo)
        {
            return repositorio.Inserir(veiculo);
        }

        public IList<Veiculo> disponiveisEntreDatas(DateTime begin, DateTime end, Localidade localidade)
        {
            if (begin > end)
            {
                throw new Exception("A data de início deve ser anterior à data de devolução");
            }

            return repositorio.listarDisponiveis(begin, end, localidade);
        }

        public Veiculo editar(Veiculo novoVeiculo)
        {
            Veiculo veiculoSalvo = repositorio.RetornarPorId(novoVeiculo.Id);

            if (veiculoSalvo == null)
            {
                throw new InstanceNotFoundException("O veículo " + novoVeiculo.Modelo + " não pôde ser encontrado na base de dados.");
            }

            veiculoSalvo.Modelo = novoVeiculo.Modelo;
            veiculoSalvo.Chassis = novoVeiculo.Chassis;
            veiculoSalvo.Diaria = novoVeiculo.Diaria;
            veiculoSalvo.Localidade = novoVeiculo.Localidade;

            repositorio.Alterar(veiculoSalvo);

            return veiculoSalvo;
        }

        public bool excluir(Veiculo veiculo)
        {
            return repositorio.Excluir(veiculo);
        }
    }
}