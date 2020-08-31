using System;
using Repository.Entities;

namespace Api.Business.AluguelBusiness
{
    public class AluguelDTO
    {
        public virtual string Cpf { get; set; }
        public virtual DateTime? DataEmprestimo { get; set; }
        public virtual DateTime? DataDevolucao { get; set; }
        public virtual Veiculo Veiculo { get; set; }
    }
}