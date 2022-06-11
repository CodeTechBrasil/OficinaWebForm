using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


public class Utilitarios
{
    /// <summary>
    /// Método responsável por atualizar os Drop Down's existentes numa página
    /// </summary>
    /// <param name="ddl"> DropDown que será atualizado.</param>
    /// <param name="dt"> DataTable que será Source do DropDownList.</param>
    /// <param name="text"> Variável que seta a Coluna que será utilizada como DataTextField do DropDown.</param>
    /// <param name="value"> Variável que seta a Coluna que será utilizada como DataValueField do DropDown.</param>
    /// <param name="textItemZero"> Variável que seta o valor que será inserido na linha Zero.</param>
    public static void AtualizaDropDown(DropDownList ddl, DataTable dt, string text, string value, string textItemZero)
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

    public static string RetirarAcentos(string texto)
    {
        string comAcentos = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
        string semAcentos = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";
        for (int i = 0; i < comAcentos.Length; i++)
            texto = texto.Replace(comAcentos[i].ToString(), semAcentos[i].ToString());

        return texto;
    }

    public static string ObterCaminhoWEB()
    {
        string CaminhoWEB = HttpContext.Current.Request.ApplicationPath;
        if (CaminhoWEB.Equals("/") == false)
            return HttpContext.Current.Request.ApplicationPath + "/";

        return CaminhoWEB;
    }

    /// <summary>
    /// Método responsavel por Alternar cor baseado no valor passado:  
    /// </summary>
    /// <param name="grid">Sempre passar este parametro: (Datagrid)sender</param>
    /// <param name="e">Sempre passar este parametro: e </param>
    /// <param name="celula">A celula para ter como base o valor, para alternar as cores</param>
    /// <returns></returns>
    public static Color AlternarCorGrid(DataGrid grid, DataGridItemEventArgs e, int celula)
    {
        return e.Item.BackColor = (e.Item.ItemIndex > 0) ? (grid.Items[e.Item.ItemIndex - 1].Cells[celula].Text != e.Item.Cells[celula].Text) ?
                        (grid.Items[e.Item.ItemIndex - 1].BackColor == Color.LightGray) ? Color.White : Color.LightGray
                        : grid.Items[e.Item.ItemIndex - 1].BackColor : Color.White;
    }
}
