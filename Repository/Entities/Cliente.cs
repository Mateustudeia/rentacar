﻿using System;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Cliente
    {
        public virtual int Id { get; set; }
        public virtual DateTime Nascimento { get; set; }
        public virtual string Nome { get; set; }
        public virtual string Cpf { get; set; }
        public virtual string Telefone { get; set; }
        public virtual string Email { get; set; }
    }

    public class ClienteMap : ClassMap<Cliente>
    {
        public ClienteMap()
        {
            Table("cliente");
            Id(x => x.Id).Column("id");
            Map(x => x.Nascimento).Column("nascimento");
            Map(x => x.Nome).Column("nome");
            Map(x => x.Cpf).Column("nascimento");
            Map(x => x.Telefone).Column("telefone");
            Map(x => x.Email).Column("email");
        }
    }
}