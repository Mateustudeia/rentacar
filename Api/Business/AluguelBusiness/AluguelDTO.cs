using System;
using System.Collections.Generic;
using System.Drawing;

namespace Api.Business.AluguelBusiness
{
    public class AluguelDTO
    {
        public virtual string Cpf { get; set; }
        public virtual DateTime? DataEmprestimo { get; set; }
        public virtual DateTime? DaraDevolucao { get; set; }
        public virtual IList<int> Veiculos { get; set; }

        //{
        //    Cpf: null,
        //    DataEmprestimo: null,
        //    DataDevolucao: null,
        //    Veiculos: [],
        //}
    }
}