using System.Collections;
using System.Collections.Generic;
using System.Management.Instrumentation;
using System.Runtime.CompilerServices;
using System.Web.Optimization;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Business.ClienteBusiness
{
    public class ClienteBus
    {
        private Repositorio<Cliente> repositorio = new Repositorio<Cliente>();

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

        public Cliente editar(Cliente novoCliente)
        {
            Cliente clienteSalvo = repositorio.RetornarPorId(novoCliente.Id);

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