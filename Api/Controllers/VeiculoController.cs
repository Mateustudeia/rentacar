using System;
using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using Api.Business.VeiculoBusiness;
using Repository.Entities;
using Repository.Repositories;

namespace Api.Controllers
{
    public class VeiculoController : ApiController
    {
        VeiculoBus business = new VeiculoBus();

        [HttpGet]
        public IEnumerable<Veiculo> Listar()
        {
            return business.listar();
        }

        public Veiculo Get(int id)
        {
            return business.buscarPorId(id);
        }

        public IList<Veiculo> filtrarPorDataLocalidade(Localidade localidade, DateTime DataEmprestimo,
            DateTime DataDevolucao)
        {
            return business.disponiveisEntreDatas(DataEmprestimo, DataDevolucao, localidade);
        }

        [HttpPost]
        public void Salvar([FromBody]Veiculo veiculo)
        {
            if (veiculo.Chassis != null)
            {
                business.salvar(veiculo);
            }
            else
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }
        }

        [HttpDelete]
        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
