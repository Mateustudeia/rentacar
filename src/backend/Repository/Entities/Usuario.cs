using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Usuario
    {
        public virtual int Id { get; set; }
        public virtual String Login { get; set; }
        public virtual String Senha { get; set; }
    }

    public class UsuarioMap : ClassMap<Usuario>
    {
        public UsuarioMap()
        {
            Table("usuario");
            Id(x => x.Id).Column("id").GeneratedBy.Identity();
            Map(x => x.Login).Column("user");
            Map(x => x.Senha).Column("passwd");
        }
    }
}
