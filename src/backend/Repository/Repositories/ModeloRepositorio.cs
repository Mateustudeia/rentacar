using NHibernate;
using Repository.Entities;
using Repository.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repositories
{
    public class ModeloRepositorio : Repositorio<Modelo>
    {
        public IList<Modelo> buscarPorMarca(int id)
        {
            using (ISession session = FluentNHibernateHelper.AbrirSession())
            {
                try
                {
                    var query = session.Query<Modelo>();
                    IList<Modelo> modelo = query.Where(x => x.Marca.Id == id).ToList();
                    return modelo;
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao buscar cliente pelo cpf: " + ex.Message);
                }
            }
        }
    }
}
