using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Municipio
    {
        public virtual int CodigoIbge { get; set; }
        public virtual String Nome { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual IList<Localidade> Localidades { get; set; }
    }

    public class MunicipioMap : ClassMap<Municipio>
    {
        public MunicipioMap()
        {
            Table("municipio");
            Id(x => x.CodigoIbge).Column("codigo_ibge");
            Map(x => x.Nome).Column("nome");
            References(x => x.Estado);
            HasMany(x => x.Localidades);
        }
    }
}
