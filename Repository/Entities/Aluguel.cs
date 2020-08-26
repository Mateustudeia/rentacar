using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;

namespace Repository.Entities
{
    public class Aluguel
    {
        public virtual int Id { get; set; }
        public virtual DateTime DataEmprestimo { get; set; }
        public virtual DateTime DataDevolucaoContratada { get; set; }
        public virtual DateTime DataDevolucao { get; set; }
        public virtual float ValorTotal { get; set; }
        public virtual Veiculo Veiculo { get; set; }
        public virtual IList<Cliente> Clientes { get; set; }

    }
    public class AluguelMap : ClassMap<Aluguel>
    {
        public AluguelMap()
        {
            Table("aluguel");
            Id(x => x.Id).Column("id");
            Id(x => x.DataEmprestimo).Column("data_emprestimo");
            Id(x => x.DataDevolucaoContratada).Column("data_devolucao_contratada");
            Id(x => x.DataDevolucao).Column("data_devolucao");
            Id(x => x.ValorTotal).Column("valor_total");
            References(x => x.Veiculo);
            HasManyToMany(x => x.Clientes).Table("cliente_aluguel").ParentKeyColumn("aluguel_id").ChildKeyColumn("client_id");
        }
    }
}
