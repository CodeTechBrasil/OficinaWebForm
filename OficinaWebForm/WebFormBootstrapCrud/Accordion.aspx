<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accordion.aspx.cs" Inherits="WebFormBootstrapCrud.Accordion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

    <link rel="stylesheet" href="Content/accordion.css" />
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <table style="background-color: lightgray; color: black; width: 100%; margin-bottom: 1px; padding: 5px;">
                <thead>
                    <tr>
                        <td style="padding-left: 10px; width: 150px;">
                            <asp:Label runat="server">Visualizar</asp:Label></td>
                        <td style="width: 150px;">
                            <asp:Label runat="server">Data da Aplicação</asp:Label></td>
                        <td style="width: 250px;" colspan="4">
                            <asp:Label runat="server">Aplicação</asp:Label></td>
                        <td>
                            <asp:Label runat="server">Quantidade de Cotas</asp:Label></td>
                        <td>
                            <asp:Label runat="server">Tipo de Origem</asp:Label></td>
                    </tr>
                </thead>
            </table>
            <table>
                <tr>
                    <%-- SEGUNDO ACCORDION --%>
                    <asp:Repeater ID="dtAccordion" runat="server" OnItemCommand="dtAccordion_ItemCommand">
                        <ItemTemplate>
                            <div class="accordion">

                                <%-- COMEÇA O ACCORDION --%>
                                <div class="accordion-item">
                                    <table class="accordion-header">
                                        <tr>
                                            <td style="padding-left: 20px; width: 150px;">
                                                <a class="iconColor" style="width: 10px;">
                                                    <asp:ImageButton Width="20" ImageUrl="~/Content/Image/search_icon.png" ID="btnView" class="iconColor" CommandName="view" runat="server" CommandArgument='<%# Eval("Id") %>' />
                                                </a>
                                            </td>

                                            <td style="width: 150px;">
                                                <asp:Label runat="server"> <%# DataBinder.Eval(Container.DataItem, "Data") %></asp:Label>

                                            </td>

                                            <td style="width: 250px;" colspan="4">
                                                <asp:Label runat="server"> <%# DataBinder.Eval(Container.DataItem, "Aplicacao") %></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label runat="server"> <%# DataBinder.Eval(Container.DataItem, "Cotas") %></asp:Label>
                                            </td>

                                            <td>
                                                <asp:Label runat="server"> <%# DataBinder.Eval(Container.DataItem, "TipoOrdem") %></asp:Label>
                                            </td>
                                            <td>
                                                <button class="iconColor" style="float: right !important;">
                                                    <i class="fas fa-angle-down"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                             <div class="accordion-body">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server">Hora:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">CNPJ:&nbsp <%# DataBinder.Eval(Container.DataItem, "Cnpj") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Preço da Cota:&nbsp <%# DataBinder.Eval(Container.DataItem, "Preco") %></asp:Label>
                                                    </td>

                                                    <td>
                                                        <asp:Label runat="server">Classificação de Risco:&nbsp <%# DataBinder.Eval(Container.DataItem, "Risco") %></asp:Label>
                                                    </td>
                                                </tr>

                                                <%-- linha 02 --%>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server">Tipo:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Tipo:&nbsp <%# DataBinder.Eval(Container.DataItem, "Tipo") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Valor Total:&nbsp <%# DataBinder.Eval(Container.DataItem, "ValorTotal") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Segmento:&nbsp <%# DataBinder.Eval(Container.DataItem, "ValorTotal") %></asp:Label>
                                                    </td>
                                                </tr>

                                                <%-- linha 02 --%>
                                                <tr>
                                                    <td>
                                                        <asp:Label runat="server">Tipo:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Tipo:&nbsp <%# DataBinder.Eval(Container.DataItem, "Tipo") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Cateira:&nbsp <%# DataBinder.Eval(Container.DataItem, "Cateira") %></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server">Gestor:&nbsp <%# DataBinder.Eval(Container.DataItem, "Gestor") %></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        </tr>
                                    </table>

                                </div>

                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>


        </div>
    </form>

    <script src="Scripts/accordion.js"></script>
</body>
</html>
