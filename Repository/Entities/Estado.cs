using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Estado
    {
        public virtual int Id { get; set; }
        public virtual String Sigla { get; set; }
        public virtual String Nome { get; set; }
        public virtual IList<Municipio> Municipio { get; set; }
    }

    public class EstadoMap : ClassMap<Estado>
    {
        public EstadoMap()
        {
            Table("estado");
            Id(x => x.Id).Column("id");
            Map(x => x.Sigla).Column("sigla");
            Map(x => x.Nome).Column("nome");
            HasMany(x => x.Municipio);
        }
    }
}
