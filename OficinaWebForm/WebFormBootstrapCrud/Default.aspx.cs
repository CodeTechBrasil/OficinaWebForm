using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormBootstrapCrud
{
    public partial class _Default : Page
    {
        public string SomenteNumero { get; set; }
        public string SomenteNumerico { get; set; }
        public DataTable Datatable { get; set; } = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                txtSomenteNumero.Text = "123578";
                txtNumeroDecimal.Text = "25578.58";
                txtNumeroMoeda.Text = "4585.35";

                CarregarGrid();
                PreencherDllMetodo();
                CarregarRepeater();
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            SomenteNumero = FormatarCampoInteiro(txtSomenteNumero.Text);
            SomenteNumerico = FormatarCampoNumerico(txtNumeroDecimal.Text);
        }

        private string FormatarCampoNumerico(string texto)
        {
            var resultado = texto.Replace("R$ ", "").Replace(".", "").Replace(",", ".");

            if (string.IsNullOrEmpty(resultado)) return "0.00";

            return resultado;
        }

        private string FormatarCampoInteiro(string texto)
        {
            if (string.IsNullOrEmpty(texto)) return "0";

            return texto;
        }

        protected void btnScript_Click(object sender, EventArgs e)
        {
            var script = "<script> alert('Teste Agenda!');  </script>";
            //ScriptManager.RegisterClientScriptBlock(this, GetType(), nameof(script), script, false);
            //ScriptManager.RegisterStartupScript(this, GetType(), "msg", "viewName();", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "msgs", "chamandoClick();", true);
        }

        protected void btnOculto_Click(object sender, EventArgs e)
        {
            var chegouAqui = "Chegou Aqui e disparou o evento.";
            var script = "<script> alert('" + chegouAqui + "');  </script>";
            ScriptManager.RegisterClientScriptBlock(this, GetType(), nameof(script), script, false);
        }

        protected void ddlAtivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var value = ddlAtivo.SelectedValue.ToString();
        }

        protected void dgvTemplate_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "editar":
                    //Faz Isto

                    break;
                case "excluir":
                    //Excluir
                    break;

                case "visualizar":
                    //vizualizar
                    break;
            }
        }

        protected void dgvTemplate_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            //AlternarCorGrid(dgvTemplate, e, 1);
        }

        public void CarregarGrid()
        {
            Datatable = CriarDataTable();
            if (Datatable != null)
            {
                if (Datatable.Rows.Count > 0)
                    AtualizarGrid(Datatable, dgvTemplate);
                else
                    // Senão avisa o usuário que não foram encontrados registros para a pesquisa
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Não foram encontrados registros para a pesquisa realizada!');", true);


            }
        }

        public void CarregarRepeater()
        {
            Datatable = CriarDataTable();
            if (Datatable != null)
            {
                if (Datatable.Rows.Count > 0)
                    AtualizarRepeater(Datatable, dtDados);
                else
                    // Senão avisa o usuário que não foram encontrados registros para a pesquisa
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alert", "alert('Não foram encontrados registros para a pesquisa realizada!');", true);


            }
        }

        private DataTable CriarDataTable()
        {
            var datatable = new DataTable();
            datatable.Columns.Add("Id", typeof(int));
            datatable.Columns.Add("Nome", typeof(string));
            datatable.Columns.Add("Email", typeof(string));
            datatable.Rows.Add(1, "Macoratti", "agenda@yahoo.com");
            datatable.Rows.Add(2, "Jefferson", "agenda@bol.com.br");
            datatable.Rows.Add(3, "Janice", "agenda@uol.com.br");
            datatable.Rows.Add(4, "Jessica", "agenda.cat@uol.com.br");
            datatable.Rows.Add(5, "Miriam", "agenda.codes@uol.com.br");
            return datatable;
        }

        public static Color AlternarCorGrid(DataGrid grid, DataGridItemEventArgs e, int celula)
        {
            return e.Item.BackColor = (e.Item.ItemIndex > 0) ? (grid.Items[e.Item.ItemIndex - 1].Cells[celula].Text != e.Item.Cells[celula].Text) ?
                            (grid.Items[e.Item.ItemIndex - 1].BackColor == Color.LightGray) ? Color.White : Color.LightGray
                            : grid.Items[e.Item.ItemIndex - 1].BackColor : Color.White;
        }

        private void PreencherDllMetodo()
        {
            AtualizarDropDown(ddlMetodo, CriarDataTable(), "Nome", "Id", "--Selecione--");
        }

        public static void AtualizarDropDown(DropDownList ddl, DataTable dt, string text, string value, string textItemZero)
        {
            ddl.DataSource = dt;
            ddl.DataTextField = text;
            ddl.DataValueField = value;
            ddl.DataBind();
            //-> Cria o ListItem que será inserido na posição Zero
            var lst = new ListItem();
            lst.Text = textItemZero;
            lst.Value = "";
            //-> Insere o ListItem na posição Zero
            ddl.Items.Insert(0, lst);
        }

        private void OrdernarColunaGrid(DataGrid dataGrid, DataTable dataTable, string coluna)
        {
            //Método para ordenar as colunas
            var filter = dataTable.DefaultView.Sort;
            if (filter.ToUpper().Contains("ASC"))
                filter = "DESC";
            else
                filter = "ASC";

            dataTable.DefaultView.Sort = coluna + " " + filter;
            AtualizarGrid(dataTable, dataGrid);
        }

        protected void dgvTemplate_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            if (Datatable.Rows.Count > 0)
                OrdernarColunaGrid(dgvTemplate, Datatable, "Id");
        }

        protected void AtualizarGrid(DataTable dataTable, DataGrid dataGrid)
        {
            if (dataTable.Rows.Count > 0)
            {
                dataGrid.DataSource = dataTable;
                dataGrid.DataBind();
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

        protected void grdRPIP_EditCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void grdRPIP_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

        }

        protected void grdRPIP_UpdateCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void grdRPIP_CancelCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void grdRPIP_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }
 
    }
}