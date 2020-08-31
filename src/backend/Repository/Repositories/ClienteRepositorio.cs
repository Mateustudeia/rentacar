using NHibernate;
using Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;
using Repository.Helper;

namespace Repository.Repositories
{
    public class ClienteRepositorio : Repositorio<Cliente>
    {
        public Cliente buscarPorCpf(string cpf)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    var query = session.Query<Cliente>();
                    Cliente cliente = query.Where(x => x.Cpf == cpf).First();

                    return cliente;
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao buscar cliente pelo cpf: " + ex.Message);
                }
            }
        }
    }
}