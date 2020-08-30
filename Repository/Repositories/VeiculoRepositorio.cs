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
    public class VeiculoRepositorio : Repositorio<Veiculo>
    {
        public IList<Veiculo> listarDisponiveis(DateTime begin, DateTime end, Localidade localidade = null)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    string stringQuery = "SELECT v.id FROM veiculo v WHERE" +
                                         " v.id NOT IN" +
                                         " (" +
                                         "  select a.veiculo_id " +
                                         "  from aluguel a " +
                                         "  where a.data_emprestimo <= '" + begin.ToString("yyyy-MM-dd") + "'" +
                                         "  and a.data_devolucao_contratada >= '" + end.ToString("yyyy-MM-dd") + "'" +
                                         "  and a.data_devolucao is not null" +
                                         " )";

                    var query = session.CreateSQLQuery(stringQuery);

                    IList<int> ids = query.List<int>();
                    IList<Veiculo> veiculos = new List<Veiculo>();

                    foreach(int id in ids)
                    {
                        Veiculo veiculo = RetornarPorId(id);

                        if (localidade == null || veiculo.Localidade.Id == localidade.Id)
                        {
                            veiculos.Add(veiculo);
                        }
                    }

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
