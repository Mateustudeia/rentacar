using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Localidade
    {
        public virtual int Id { get; set; }
        public virtual String Bairro { get; set; }
        public virtual String Logradouro { get; set; }
        public virtual int Numero { get; set; }
        public virtual String Nome { get; set; }
        public virtual Municipio Municipio { get; set; }
        //public virtual IList<Veiculo> Veiculos { get; set; }
    }

    public class LocalidadeMap : ClassMap<Localidade>
    {
        public LocalidadeMap()
        {
            Table("localidade");
            Id(x => x.Id).Column("id").GeneratedBy.Identity();
            Map(x => x.Bairro).Column("bairro");
            Map(x => x.Logradouro).Column("logradouro");
            Map(x => x.Numero).Column("numero");
            Map(x => x.Nome).Column("nome");
            References(x => x.Municipio).Not.LazyLoad();
            //HasMany(x => x.Veiculos).Not.LazyLoad();
        }
    }
}
