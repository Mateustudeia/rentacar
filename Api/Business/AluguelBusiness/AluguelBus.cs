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

        private ClienteRepositorio clienteRepositorio = new ClienteRepositorio();

        private VeiculoRepositorio veiculoRepositorio = new VeiculoRepositorio();

        public IList<Aluguel> Listar()
        {
            return repositorio.Consultar();
        }

        public IEnumerable<Aluguel> ListarPorCliente(Cliente cliente)
        {
            return repositorio.RetornarPorCliente(cliente);
        }

        public Aluguel BuscarPorId(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        public Aluguel Alugar(AluguelDTO aluguel)
        {
            if (aluguel.DataEmprestimo > aluguel.DataDevolucao)
            {
                throw new Exception("A data de empréstimo deve ser anterior à data de entrega.");
            }

            DateTime inicio = aluguel.DataEmprestimo.GetValueOrDefault();
            DateTime entrega = aluguel.DataDevolucao.GetValueOrDefault();

            IList<Veiculo> veiculosDisponiveis = veiculoRepositorio.ListarDisponiveis(inicio, entrega);

            Veiculo veiculo = veiculosDisponiveis.FirstOrDefault(x => x.Id == aluguel.Veiculo.Id);

            if (veiculo == null)
            {
                throw new Exception("Veículo indisponível durante o período selecionado.");
            }

            Aluguel novoAluguel = new Aluguel();

            novoAluguel.DataEmprestimo = inicio;
            novoAluguel.DataDevolucaoContratada = entrega;
            novoAluguel.Veiculo = veiculo;
            novoAluguel.Clientes.Add(clienteRepositorio.buscarPorCpf(aluguel.Cpf));

            return repositorio.Inserir(novoAluguel);
        }

        public bool Excluir(Aluguel aluguel)
        {
            return repositorio.Excluir(aluguel);
        }
    }
}