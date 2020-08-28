using System.Collections.Generic;
using System.Management.Instrumentation;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.VeiculoBusiness
{
    public class VeiculoBus
    {
        private Repositorio<Veiculo> repositorio = new Repositorio<Veiculo>();

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