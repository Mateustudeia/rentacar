using System;
using Repository.Entities;

namespace Api.Business.VeiculoBusiness
{
    public class VeiculoDto
    {
        public virtual DateTime DataEmprestimo { get; set; }
        public virtual DateTime DataDevolucao { get; set; }
        public virtual Localidade Localidade { get; set; }
    }
}