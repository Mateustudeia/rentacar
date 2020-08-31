using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Api.Controllers;
using Api.Business;
using Api.Business.ClienteBusiness;
using Repository;
using Repository.Entities;
using Repository.Repositories;
using System.Linq;

namespace Rentacar.Test
{
    [TestClass]
    public class ClienteUnitTest
    {
        ClienteBus ClienteBus = new ClienteBus();

        Repositorio<Cliente> repositorio = new Repositorio<Cliente>();

        [TestInitialize]
        public void IniarTestes()
        {

        }
        [TestMethod]
        public void testCreate()
        {

            Cliente novoCliente = new Cliente()
                {
                    Nascimento = DateTime.Parse("1999-11-11"),
                    Nome = "Teste Unitário",
                    Cpf = "118.165.146-48",
                    Telefone = "(99) 9 9999-9999",
                    Email = "test@test.com"
                };
            var resultado = ClienteBus.salvar(novoCliente);
            Assert.IsNotNull(resultado);
        }

        [TestMethod]
        public void testEdit()
        {
            var cliente = ClienteBus.listar().First();
            cliente.Nascimento = DateTime.Parse("1999-11-11");
            cliente.Nome = "Teste Unitário - Edit";
            cliente.Cpf = "118.165.146-48";
            cliente.Telefone = "(99) 9 9999-9999";
            cliente.Email = "test@test.com";

            var resultado = repositorio.Alterar(cliente);
            Assert.IsNotNull(resultado);
        }

        [TestMethod]
        public void testDelite()
        {
            var cliente = ClienteBus.listar().First();
            var resultado = ClienteBus.excluir(cliente);
            Assert.AreEqual(true, resultado);
        }

        [TestCleanup]
        public void FinalizarTest()
        {

        }
    }
}
