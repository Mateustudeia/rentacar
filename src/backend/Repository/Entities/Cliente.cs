using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Cliente
    {
        public virtual int? Id { get; set; }
        public virtual DateTime Nascimento { get; set; }
        public virtual string Nome { get; set; }
        public virtual string Cpf { get; set; }
        public virtual string Telefone { get; set; }
        public virtual string Email { get; set; }
        //public virtual IList<Aluguel> Alugueis { get; set; }
    }

    public class ClienteMap : ClassMap<Cliente>
    {
        public ClienteMap()
        {
            Table("cliente");
            Id(x => x.Id).Column("id").GeneratedBy.Identity();
            Map(x => x.Nascimento).Column("nascimento");
            Map(x => x.Nome).Column("nome");
            Map(x => x.Cpf).Column("cpf");
            Map(x => x.Telefone).Column("telefone");
            Map(x => x.Email).Column("email");

            //HasManyToMany(x => x.Alugueis)
                //.Table("cliente_aluguel")
                //.ParentKeyColumn("client_id")
                //.ChildKeyColumn("aluguel_id")
                //.Not.LazyLoad();
        }
    }
}