using Repository.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate;
using NHibernate.Criterion;
using Repository.Helper;

namespace Repository.Repositories
{
    public class VeiculoRepositorio : Repositorio<Veiculo>
    {
        public IList<Veiculo> listarDisponiveis(DateTime begin, DateTime end, Localidade localidade = null)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    Veiculo veiculo = null;
                    var query = session.QueryOver<Veiculo>(() => veiculo)
                        .WithSubquery.WhereNotExists(QueryOver.Of<Aluguel>()
                            .Where(x => x.DataDevolucaoContratada > begin)
                            .Where(x => x.DataDevolucaoContratada < end)
                            .Where(x => x.DataEmprestimo > begin)
                            .Where(x => x.DataEmprestimo < end));

                    if (localidade != null)
                    {
                        query = query.Where(x => x.Localidade == localidade);
                    }

                    IList<Veiculo> veiculos = query.List();

                    return veiculos;
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao buscar os veículos disponíveis entre " + begin + " e " + end);
                }
            }
        }
    }
}
