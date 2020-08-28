using System.Collections.Generic;
using System.IO;
using System.Web.Http;
using Api.Business.VeiculoBusiness;
using Repository.Entities;

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

        [HttpPost]
        public void Cadastra([FromBody]Veiculo veiculo)
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

        public void Excluir(int id)
        {
            business.excluir(business.buscarPorId(id));
        }
    }
}
