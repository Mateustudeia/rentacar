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
            return business.Listar();
        }

        [HttpGet]
        public Veiculo Get(int id)
        {
            return business.BuscarPorId(id);
        }

        [HttpPost]
        public IList<Veiculo> FiltrarPorDataLocalidade(VeiculoDto filtro)
        {
            return business.DisponiveisEntreDatas(filtro.DataEmprestimo, filtro.DataDevolucao, filtro.Localidade);
        }

        [HttpPost]
        public void Salvar([FromBody]Veiculo veiculo)
        {
            if (veiculo.Chassis == null)
            {
                throw new InvalidDataException("Um dos campos obrigatórios está vazio.");
            }

            if(veiculo.Id == null){
                business.Salvar(veiculo);
            }
            else
            {
                Veiculo veiculoSalvo = business.BuscarPorId(veiculo.Id.GetValueOrDefault());

                veiculoSalvo.Localidade = veiculo.Localidade;
                veiculoSalvo.Modelo = veiculo.Modelo;
                veiculoSalvo.Chassis = veiculo.Chassis;
                veiculoSalvo.Diaria = veiculo.Diaria;

                business.Editar(veiculoSalvo);
            }

        }

        [HttpDelete]
        public void Excluir(int id)
        {
            business.Excluir(business.BuscarPorId(id));
        }
    }
}
