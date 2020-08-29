using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Modelo
    {
        public virtual int? Id { get; set; }
        public virtual String Nome { get; set; }
        public virtual DateTime? Ano { get; set; }
        public virtual String Versao { get; set; }
        public virtual Marca Marca { get; set; }
        //public virtual IList<Veiculo> Veiculos { get; set; }
    }

    public class ModeloMap : ClassMap<Modelo>
    {
        public ModeloMap()
        {
            Table("modelo");
            Id(x => x.Id).Column("id");
            Map(x => x.Nome).Column("nome");
            Map(x => x.Ano).Column("ano");
            Map(x => x.Versao).Column("versao");
            References(x => x.Marca).Not.LazyLoad();
            //HasMany(x => x.Veiculos);
        }
    }
}
