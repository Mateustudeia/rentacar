using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Management.Instrumentation;
using System.Web.UI.WebControls;
using Api.Business.AluguelBusiness;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.ClienteBusiness
{
    public class AluguelBus
    {
        private AluguelRepositorio repositorio = new AluguelRepositorio();

        public IList<Aluguel> listar()
        {
            return repositorio.Consultar();
        }

        public Aluguel buscarPorId(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        public Aluguel alugar(AluguelDTO aluguel)
        {
            if (aluguel.DataEmprestimo > aluguel.DataDevolucao)
            {
                throw new Exception("A data de empréstimo deve ser anterior à data de entrega.");
            }

            VeiculoRepositorio veiculoRepositorio = new VeiculoRepositorio();

            DateTime inicio = aluguel.DataEmprestimo.GetValueOrDefault();
            DateTime entrega = aluguel.DataDevolucao.GetValueOrDefault();

            IList<Veiculo> veiculosDisponiveis = veiculoRepositorio.listarDisponiveis(inicio, entrega);

            Veiculo veiculo = veiculosDisponiveis.FirstOrDefault(x => x.Id == aluguel.Veiculo.Id);

            if (veiculo == null)
            {
                throw new Exception("Veículo indisponível durante o período selecionado.");
            }

            ClienteRepositorio clienteRepositorio = new ClienteRepositorio();

            Aluguel novoAluguel = new Aluguel();

            novoAluguel.DataEmprestimo = inicio;
            novoAluguel.DataDevolucaoContratada = entrega;
            novoAluguel.Veiculo = veiculo;
            novoAluguel.Clientes.Add(clienteRepositorio.buscarPorCpf(aluguel.Cpf));

            return repositorio.Inserir(novoAluguel);
        }

        public bool excluir(Aluguel aluguel)
        {
            return repositorio.Excluir(aluguel);
        }
    }
}