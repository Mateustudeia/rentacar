using NHibernate;
using Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;
using Repository.Helper;

namespace Repository.Repositories
{
    public class AluguelRepositorio : Repositorio<Aluguel>
    {
        public IEnumerable<Aluguel> RetornarPorCliente(Cliente cliente)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    var query = session.Query<Aluguel>()
                        .Where(x => x.Clientes.FirstOrDefault().Id == cliente.Id);

                    return query.ToList();
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao buscar os aluguéis referentes ao cliente " + cliente.Nome);
                }
            }
        }
    }
}