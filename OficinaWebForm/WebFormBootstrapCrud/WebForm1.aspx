<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebFormBootstrapCrud.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>


<body>

    <style>
        .card-header .title {
            font-size: 12px;
            color: #000;
        }

        .card-header .accicon {
            float: right !important;
            font-size: 20px;
            width: 1.2em;
        }

        .card-header {
            cursor: pointer;
            border-bottom: none;
        }

        .card {
            border: 1px solid #ddd;
        }

        .card-body {
            border-top: 1px solid #ddd;
        }

        .card-header:not(.collapsed) .rotate-icon {
            transform: rotate(180deg);
        }

        .font-label {
            font-size: 12px !important;
        }
    </style>


    <form id="form1" runat="server">


        <div class="accordion" id="accordionExample">

            <asp:Repeater ID="dtAccordion" runat="server" OnItemCommand="dtAccordion_ItemCommand" OnItemDataBound="dtAccordion_ItemDataBound" OnItemCreated="dtAccordion_ItemCreated">

                <ItemTemplate>

                    <div class="card">
                        <div class="card-header" data-toggle="collapse" data-target="#collapse<%# DataBinder.Eval(Container.DataItem, "Id") %>" aria-expanded="true">
                            <table>
                                <tr>
                                    <td>
                                        <span class="title" style="margin-left: 10px; margin-right: 20px">
                                            <a class="iconColor" style="width: 10px;">
                                                <asp:ImageButton Width="20" ImageUrl="~/Content/Image/search_icon.png" ID="btnView" class="iconColor" CommandName="view" runat="server" CommandArgument='<%# Eval("Id") %>' />
                                            </a>
                                        </span>
                                    </td>

                                    <td>
                                        <span class="title" style="margin-right: 10px">
                                            <asp:Label Width="100" runat="server"> <%# DataBinder.Eval(Container.DataItem, "Data") %></asp:Label>
                                        </span>
                                    </td>

                                    <td>
                                        <span class="title" style="margin-right: 10px">
                                            <asp:Label Width="550" runat="server"> <%# DataBinder.Eval(Container.DataItem, "Aplicacao") %></asp:Label>
                                        </span>
                                    </td>


                                    <td>
                                        <span class="title" style="margin-right: 10px">
                                            <asp:Label Width="250" runat="server"> <%# DataBinder.Eval(Container.DataItem, "Cotas") %></asp:Label>
                                        </span>
                                    </td>

                                    <td>
                                        <span class="title">
                                            <asp:Label ID="lblTipoOrdem" runat="server" Text='<%#Eval("TipoOrdem")%>'></asp:Label>
                                        </span>


                                    </td>
                                    <td></td>
                                    <span class="accicon"><i class="fas fa-angle-down rotate-icon"></i></span>
                                </tr>
                            </table>

                        </div>


                        <div id="collapse<%# DataBinder.Eval(Container.DataItem, "Id") %>" class="collapse show" data-parent="#accordionExample">
                            <div class="card-body">
                                <table>

                                    <%-- linha 01 --%>
                                    <tr>
                                        <td>
                                            <span class="title" style="margin-left: 00px; margin-right: 50px">
                                                <a class="iconColor" style="width: 10px;">
                                                    <asp:ImageButton  Width="20" Visible="false" ImageUrl="~/Content/Image/search_icon.png" ID="ImageButton1" class="iconColor" CommandName="view" runat="server" CommandArgument='<%# Eval("Id") %>' />
                                                </a>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Width="100" CssClass="font-label" runat="server">Hora:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>

                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Width="550" CssClass="font-label" runat="server">CNPJ:&nbsp <%# DataBinder.Eval(Container.DataItem, "Cnpj") %></asp:Label>
                                            </span>
                                        </td>


                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Width="250" CssClass="font-label" runat="server">Preço da Cota:&nbsp <%# DataBinder.Eval(Container.DataItem, "Preco") %></asp:Label>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title">
                                                <asp:Label CssClass="font-label" runat="server">Classificação de Risco:&nbsp <%# DataBinder.Eval(Container.DataItem, "Risco") %></asp:Label>
                                            </span>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <%-- linha 02 --%>
                                    <tr>
                                        <td>
                                            <span class="title" style="margin-left: 00px; margin-right: 50px">
                                                <a class="iconColor" style="width: 10px;">
                                                    <asp:ImageButton Width="20" Visible="false" ImageUrl="~/Content/Image/search_icon.png" ID="ImageButton2" class="iconColor" CommandName="view" runat="server" CommandArgument='<%# Eval("Id") %>' />
                                                </a>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Visible="false" Width="100" CssClass="font-label" runat="server">Hora:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>

                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Visible="false" Width="550" CssClass="font-label" runat="server">Tipo:&nbsp <%# DataBinder.Eval(Container.DataItem, "Tipo") %></asp:Label>
                                            </span>
                                        </td>


                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Width="250" CssClass="font-label" runat="server">Valor Total:&nbsp <%# DataBinder.Eval(Container.DataItem, "ValorTotal") %></asp:Label>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title">
                                                <asp:Label CssClass="font-label" runat="server">Segmento:&nbsp <%# DataBinder.Eval(Container.DataItem, "Segmento") %></asp:Label>
                                            </span>
                                        </td>
                                        <td></td>
                                    </tr>

                                     <%-- linha 03 --%>
                                    <tr>
                                        <td>
                                            <span class="title" style="margin-left: 00px; margin-right: 50px">
                                                <a class="iconColor" style="width: 10px;">
                                                    <asp:ImageButton Width="20" Visible="false" ImageUrl="~/Content/Image/search_icon.png" ID="ImageButton3" class="iconColor" CommandName="view" runat="server" CommandArgument='<%# Eval("Id") %>' />
                                                </a>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Visible="false" Width="100" CssClass="font-label" runat="server">Hora:&nbsp <%# DataBinder.Eval(Container.DataItem, "Hora") %></asp:Label>

                                            </span>
                                        </td>

                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label  Width="550" CssClass="font-label" runat="server">Tipo de Investimento:&nbsp <%# DataBinder.Eval(Container.DataItem, "Tipo") %></asp:Label>
                                            </span>
                                        </td>


                                        <td>
                                            <span class="title" style="margin-right: 10px">
                                                <asp:Label Width="250" CssClass="font-label" runat="server">Cateira:&nbsp <%# DataBinder.Eval(Container.DataItem, "Cateira") %></asp:Label>
                                            </span>
                                        </td>

                                        <td>
                                            <span class="title">
                                                <asp:Label CssClass="font-label" runat="server">Gestor:&nbsp <%# DataBinder.Eval(Container.DataItem, "Gestor") %></asp:Label>
                                            </span>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                    </div>
                </ItemTemplate>

            </asp:Repeater>

        </div>
    </form>
</body>
</html>
