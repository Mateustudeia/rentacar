using System.Collections.Generic;
using System.Management.Instrumentation;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.ClienteBusiness
{
    public class ClienteBus
    {
        private ClienteRepositorio repositorio = new ClienteRepositorio();

        public IList<Cliente> listar()
        {
            return repositorio.Consultar();
        }

        public Cliente buscarPorId(int id)
        {
            return repositorio.RetornarPorId(id);
        }

        public Cliente salvar(Cliente cliente)
        {
            return repositorio.Inserir(cliente);
        }

        internal Cliente buscarPorCpf(string cpf)
        {
            return repositorio.buscarPorCpf(cpf);
        }

        public Cliente editar(Cliente novoCliente)
        {
            Cliente clienteSalvo = repositorio.RetornarPorId(novoCliente.Id.GetValueOrDefault());

            if (clienteSalvo == null)
            {
                throw new InstanceNotFoundException("O cliente " + novoCliente.Nome + " não pôde ser encontrado na base de dados.");
            }

            clienteSalvo.Nome = novoCliente.Nome;
            clienteSalvo.Telefone = novoCliente.Telefone;
            clienteSalvo.Nascimento = novoCliente.Nascimento;
            clienteSalvo.Cpf = novoCliente.Cpf;
            clienteSalvo.Email = novoCliente.Email;

            repositorio.Alterar(clienteSalvo);

            return clienteSalvo;
        }

        public bool excluir(Cliente cliente)
        {
            return repositorio.Excluir(cliente);
        }
    }
}