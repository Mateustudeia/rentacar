using System;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Veiculo
    {
        public virtual int? Id { get; set; }
        public virtual String Chassis { get; set; }
        public virtual float Diaria { get; set; }
        public virtual Modelo Modelo { get; set; }
        public virtual Localidade Localidade { get; set; }
    }

    public class VeiculoMap : ClassMap<Veiculo>
    {
        public VeiculoMap()
        {
            Table("veiculo");
            Id(x => x.Id).Column("id").GeneratedBy.Identity();
            Map(x => x.Chassis).Column("chassis");
            Map(x => x.Diaria).Column("diaria");
            References(x => x.Localidade).Not.LazyLoad();
            References(x => x.Modelo).Not.LazyLoad();
        }
    }
}
