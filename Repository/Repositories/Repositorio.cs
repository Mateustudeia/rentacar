using NHibernate;
using System;
using System.Collections.Generic;
using System.Linq;
using Repository.Helper;
using Repository.Repositories.Interfaces;

namespace Repository.Repositories
{
    public class Repositorio<T> : ICrud<T> where T : class
    {
        public T Inserir(T entidade)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                using (ITransaction transacao = session.BeginTransaction())
                {
                    try
                    {
                        session.Save(entidade);
                        transacao.Commit();
                        return entidade;
                    }
                    catch (Exception ex)
                    {
                        if (!transacao.WasCommitted)
                        {
                            transacao.Rollback();
                            throw new Exception("Foi commitado. Erro ao inserir : " + ex.Message + entidade);
                        }
                        throw new Exception("Erro ao inserir : " + ex.Message);
                    }
                }
            }
        }

        public bool Alterar(T entidade)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                using (ITransaction transacao = session.BeginTransaction())
                {
                    try
                    {
                        session.Update(entidade);
                        transacao.Commit();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        if (!transacao.WasCommitted)
                        {
                            transacao.Rollback();
                            return false;
                        }
                        throw new Exception("Erro ao Alterar Cliente : " + ex.Message);
                    }
                }
            }
        }

        public bool Excluir(T entidade)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                using (ITransaction transacao = session.BeginTransaction())
                {
                    try
                    {
                        session.Delete(entidade);
                        transacao.Commit();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        if (!transacao.WasCommitted)
                        {
                            transacao.Rollback();
                            return false;
                        }
                        throw new Exception("Erro ao Excluir Cliente : " + ex.Message);
                    }
                }
            }
        }

        public T RetornarPorId(int Id)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                return session.Get<T>(Id);
            }
        }

        public IList<T> Consultar()
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                return (from c in session.Query<T>() select c).ToList();
            }
        }
    }
}
