using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using NHibernate;
using NHibernate.Tool.hbm2ddl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Entities;

namespace Repository.Helper
{
    public static class FluentNHibernateHelper
    {
        private static ISessionFactory session;

        public static ISessionFactory CriarSession()
        {
            if (session != null)
                return session;

            ISessionFactory sessionFactory = Fluently.Configure()

                .Database(PostgreSQLConfiguration.PostgreSQL82

                    .ConnectionString(c =>
                        c.Host("localhost")
                            .Port(5432)
                            .Database("rentacar")
                            .Username("postgres")
                            .Password("postgres")
                    ).DefaultSchema("public"))

                .Mappings(m =>
                    m.FluentMappings
                        .AddFromAssemblyOf<Aluguel>()
                        .AddFromAssemblyOf<Cliente>()
                        .AddFromAssemblyOf<Estado>()
                        .AddFromAssemblyOf<Localidade>()
                        .AddFromAssemblyOf<Marca>()
                        .AddFromAssemblyOf<Modelo>()
                        .AddFromAssemblyOf<Municipio>()
                        .AddFromAssemblyOf<Veiculo>()
                    )

                .ExposeConfiguration(cfg => new SchemaExport(cfg)
                    .Create(false, false))
                .BuildSessionFactory();

            return sessionFactory;
        }

        public static ISession AbrirSession()
        {
            return CriarSession().OpenSession();
        }
    }
}