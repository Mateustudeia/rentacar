using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Marca
    {
        public virtual int? Id { get; set; }
        public virtual String Nome { get; set; }
        public virtual IList<Modelo> Modelos { get; set; }
    }

    public class MarcaMap : ClassMap<Marca>
    {
        public MarcaMap()
        {
            Table("marca");
            Id(x => x.Id).Column("id");
            Map(x => x.Nome).Column("nome");
        }
    }
}
