using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormBootstrapCrud
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public DataTable Datatable { get; set; } = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                CarregarRepeater();
            }
        }

        public void CarregarRepeater()
        {
            Datatable = CriarDataTable();
            if (Datatable != null)
            {
                if (Datatable.Rows.Count > 0)
                {
                    //AtualizarRepeater(Datatable, dtDados);
                    AtualizarRepeater(Datatable, dtAccordion);

                }
                else
                    // Senão avisa o usuário que não foram encontrados registros para a pesquisa
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Não foram encontrados registros para a pesquisa realizada!');", true);


            }
        }

        protected void AtualizarRepeater(DataTable dataTable, Repeater repeater)
        {
            if (dataTable.Rows.Count > 0)
            {
                repeater.DataSource = dataTable;
                repeater.DataBind();
            }
        }
        private DataTable CriarDataTable()
        {
            var datatable = new DataTable();
            datatable.Columns.Add("Id", typeof(int));
            datatable.Columns.Add("Aplicacao", typeof(string));
            datatable.Columns.Add("TipoOrdem", typeof(string));
            datatable.Columns.Add("Cnpj", typeof(string));
            datatable.Columns.Add("Data", typeof(string));
            datatable.Columns.Add("Hora", typeof(string));
            datatable.Columns.Add("Cateira", typeof(string));
            datatable.Columns.Add("Risco", typeof(string));
            datatable.Columns.Add("Tipo", typeof(string));
            datatable.Columns.Add("Preco", typeof(string));
            datatable.Columns.Add("Segmento", typeof(string));
            datatable.Columns.Add("Cotas", typeof(string));
            datatable.Columns.Add("Custodiante", typeof(string));
            datatable.Columns.Add("ValorTotal", typeof(string));
            datatable.Columns.Add("Gestor", typeof(string));


            for (int i = 1; i < 10; i++)
            {
                var tipoOrdem = "COMPRA";

                if (i % 2 == 0)
                    tipoOrdem = "VENDA";


                datatable.Rows.Add(i,
                    "Aplicacao_ASDFASFASFASFASFASFDASDFASFASFASFASDFSADF" + i,
                    tipoOrdem,
                    "72.299.964/0001-93",
                    DateTime.Now.ToShortDateString(),
                    DateTime.Now.ToShortTimeString(),
                    "Cateira_" + i,
                    "Risco_" + i,
                    "Tipo_" + i,
                    "Preco_" + i,
                    "Segmento_" + i,
                    string.Format("{0:000.0}", (i * 102.53).ToString()),
                    "Custodiante_" + i,
                    string.Format("{0:000.0}", (i * 1132.53).ToString()),
                    "Gestor_" + i

                    );
            }

            //datatable.Rows.Add(1, "Macoratti", "agenda@yahoo.com");
            //datatable.Rows.Add(2, "Jefferson", "agenda@bol.com.br");
            //datatable.Rows.Add(3, "Janice", "agenda@uol.com.br");
            //datatable.Rows.Add(4, "Jessica", "agenda.cat@uol.com.br");
            //datatable.Rows.Add(5, "Miriam", "agenda.codes@uol.com.br");
            return datatable;
        }

        protected void dtAccordion_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                //Code for btnTestSeries button clicked  
                var id = e.CommandArgument.ToString();
                Response.Write("<script>alert('Test Series Button Clicked " + id + "  ')</script>");
            }
        }

        protected void dtAccordion_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label tipoOrdem = ((Label)e.Item.FindControl("lblTipoOrdem")) as Label;

                if (tipoOrdem.Text == "COMPRA")
                    tipoOrdem.ForeColor = System.Drawing.Color.Red;
                else
                    tipoOrdem.ForeColor = System.Drawing.Color.Green;
            }
        }

        protected void dtAccordion_ItemCreated(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}