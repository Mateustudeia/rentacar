using Repository.Entities;
using Repository.Repositories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentacar
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VeiculoRepositorio veiculoRepositorio = new VeiculoRepositorio();
            IList<Veiculo> veiculos = veiculoRepositorio.Consultar();
            VeiculosGridView.DataSource = veiculos;
            VeiculosGridView.DataBind();
        }
    }
}