using Repository.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.Hql.Ast.ANTLR.Tree;
using Repository.Helper;

namespace Repository.Repositories
{
    public class UsuarioRepositorio
    {
        public bool Login(string login, string senha)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    var query = session
                        .Query<Usuario>()
                        .Count(x => x.Login == login && x.Senha == senha);

                    return query == 1;
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao fazer login. Usuário inexistente, ou senha incorreta");
                }
            }
        }
    }
}
