<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormBootstrapCrud._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.3.3/inputmask/jquery.inputmask.min.js"></script>--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/autonumeric/2.0.13/autoNumeric.js" integrity="sha512-WpeS1P1hMiGI/jkZfdUn4VYz2DAQu9QbLWFEBs5Fm/JbfVoDMXxjCPq26A/d/dRYn18b8wEQTFVg+1TMY3ds1w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="Scripts/jquery.mask.min.js.js"></script>
    <script src="Scripts/formatar-textbox.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.1.1/css/fontawesome.min.css" integrity="sha384-zIaWifL2YFF1qaDiAo0JFgsmasocJ/rqu7LKYH8CoBEXqGbb9eO+Xi3s6fQhgFWM" crossorigin="anonymous">

    <style>
        .space-right {
            margin-right: 10px;
        }

        .space-top {
            margin-top: 10px !important;
        }

        .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
            padding-right: 2px !important;
            padding-left: 2px !important;
        }

        /*INICIO ACCORDION*/
        .accordion-toggle:after {
            font-family: 'FontAwesome';
            content: "\f078";
            float: right;
        }

        .accordion-opened .accordion-toggle:after {
            content: "\f054";
        }

        /*INICIO FIM*/
    </style>

    <script>
        /**
    * EFECTO PARA FLECHAS EN ACORDEON
    */
        //INICIO ACCORDION
        $(document).on('show', '.accordion', function (e) {
            //$('.accordion-heading i').toggleClass(' ');
            $(e.target).prev('.accordion-heading').addClass('accordion-opened');
        });

        $(document).on('hide', '.accordion', function (e) {
            $(this).find('.accordion-heading').not($(e.target)).removeClass('accordion-opened');
            //$('.accordion-heading i').toggleClass('fa-chevron-right fa-chevron-down');
        });

        //FIM ACCORDION

        function viewName() {
            const text = document.getElementById('txtSomenteNumero').value;
            alert(text);
        }
        /*
                Para chamar um evento click do webform através do javascript, tem que seguir alguns passos
                1-Criar um botão com o evento [btnOculto] com a propriedade [Style="display: none;"] para não aparecer na tela
                2-Criar o método javacript para chamar o evento (chamandoClick()) click do botão [btnOculto]
                3-No coding behind do evento principal, criar um script para chamar o método [chamandoClick()]
                    protected void btnScript_Click(object sender, EventArgs e)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "msgs", "chamandoClick();", true);
                    }
                4-Fazer a programação no evento coding behind [btnOculto_Click]
        
        */
        function chamandoClick() {
            var btn = "<%=btnOculto.ClientID %>";
            document.getElementById(btn).click();
        }
    </script>
    <%-- <script type="text/javascript">
       jQuery(function ($) {
           $("#txtData").mask("99/99/9999");

           $("#txtTelefone").mask("(099) 9999-9999");
           $("#txtCep").mask("99999-999");
           $("#txtCpf").mask("999.999.999-99");
           $("#txtCnpj").mask("99.999.999/9999-99");
       });
    </script>   --%>


    <div class="container">
        <div class="row" style="margin-top: 13px; margin-bottom: 20px;">

            <div class="col-md-2  col-sm-2">
                <asp:TextBox ID="txtSomenteNumeros" ClientIDMode="Static" runat="server" CssClass="form-control numero-inteiro"></asp:TextBox>
            </div>

            <div class="col-md-3 col-sm-3">
                <asp:TextBox ID="txtNumeroDecimals" ClientIDMode="Static" runat="server" CssClass="form-control numero-decimal"></asp:TextBox>
            </div>

            <div class="col-md-3 col-sm-3">
                <asp:TextBox ID="txtAltfanumericos" runat="server" CssClass="form-control numero-moeda"></asp:TextBox>
            </div>

            <div class="col-md-3 col-sm-3">
                <asp:TextBox ID="txtDatas" runat="server" CssClass="form-control data-formato"></asp:TextBox>
            </div>

        </div>
    </div>


    <table class="space-top">
        <tr>
            <td>
                <asp:TextBox ID="txtSomenteNumero" CssClass="form-control numero-inteiro space-right" Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtNumeroDecimal" CssClass="form-control numero-decimal " Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtNumeroMoeda" CssClass="form-control numero-moeda " Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr class="space-top">
            <td>
                <asp:TextBox ID="txtData" CssClass="form-control data-formato " Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtCpf" CssClass="form-control cpf-formato" Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtTelefone" CssClass="form-control telefone-formato" Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr class="space-top">
            <td>
                <asp:TextBox ID="txtCnpj" CssClass="form-control cnpj-formato" Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtCep" CssClass="form-control cep-formato" Width="300" ClientIDMode="Static" MaxLength="10" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr class="space-top">
            <td>
                <asp:Button ID="btnEnviar" runat="server" CssClass="btn btn-success space-top" Text="Enviar Dados" OnClick="btnEnviar_Click" />
            </td>
            <td>
                <asp:Button ID="btnScript" runat="server" CssClass="btn btn-success space-top" Text="Enviar Dados" OnClick="btnScript_Click" />
            </td>

            <td>
                <asp:Button ID="btnOculto" Style="display: none;" runat="server" CssClass="btn btn-success space-top" Text="Enviar Dados" OnClick="btnOculto_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-6">
            <label>DropDownList</label>
            <asp:DropDownList ID="ddlAtivo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAtivo_SelectedIndexChanged"
                DataTextField="Status">
                <asp:ListItem Value="">---Selecione---</asp:ListItem>
                <asp:ListItem Value="A" Text="ATIVO" />
                <asp:ListItem Value="I" Text="INATIVO" />
            </asp:DropDownList>
        </div>
        <div class="col-md-6">
            <label>DropDownList - Método</label>
            <asp:DropDownList ID="ddlMetodo" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-12">
            <label>DataGrid</label>
            <asp:DataGrid ID="dgvTemplate" runat="server" AutoGenerateColumns="false" Width="100%" CssClass="table table-hover"
                OnItemCommand="dgvTemplate_ItemCommand"
                OnItemDataBound="dgvTemplate_ItemDataBound"
                AllowSorting="true" OnSortCommand="dgvTemplate_SortCommand">
                <HeaderStyle Font-Bold="True" ForeColor="Black" BackColor="#E0DFE3" BorderColor="#CCCCCC" />
                <Columns>

                    <%-- COLUNA COM BOTÃO EXCLUIR --%>
                    <asp:TemplateColumn>
                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:ImageButton CausesValidation="false" ID="btnExcluir" ImageUrl="~/Images/icones/delete.gif"
                                runat="server" CommandName="excluir" ToolTip="Clique aqui excluir este registro"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <%-- COLUNA COM BOTÃO EDITAR --%>
                    <asp:TemplateColumn>
                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:ImageButton CausesValidation="false" ID="btnAlterar" ImageUrl="~/Images/icones/alterar.gif"
                                runat="server" CommandName="editar" ToolTip="Clique aqui editar este registro"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <%-- COLUNA COM BOTÃO VISUALIZAR --%>
                    <asp:TemplateColumn>
                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:ImageButton CausesValidation="false" ID="btnVisualizar" ImageUrl="~/Images/icones/visualizar.gif"
                                runat="server" CommandName="visualizar" ToolTip="Clique aqui visualizar este registro"></asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Id" SortExpression="dgvTemplate_SortCommand">
                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:Label ID="Id" runat="server">   <%# DataBinder.Eval(Container.DataItem, "Id", "") %> </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <%-- COLUNAS QUE SERÃO MOSTRADA NO GRID --%>
                    <%--<asp:BoundColumn DataField="Id" Visible="true" HeaderText="Código" SortExpression="dgvTemplate_SortCommand" />--%>
                    <asp:BoundColumn DataField="Nome" Visible="true" HeaderText="Nome" />
                    <asp:BoundColumn DataField="Email" Visible="true" HeaderText="Email" />
                </Columns>

                <PagerStyle Mode="NumericPages" Visible="true" />
            </asp:DataGrid>
        </div>
    </div>


    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-lg-12">
            <asp:Repeater ID="dtDadoss" runat="server">
                <ItemTemplate>
                    <div style="padding: 5px">
                        <%# DataBinder.Eval(Container.DataItem, "Id") %>
                    </div>
                    <div style="padding: 5px">
                        <%# DataBinder.Eval(Container.DataItem, "Nome") %>
                    </div>
                    <div style="padding: 5px">
                        <%# DataBinder.Eval(Container.DataItem, "Email") %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="accordion" id="accordion2">
                <asp:Repeater ID="dtDados" runat="server">
                    <ItemTemplate>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Collapsible Group Item #1
                                </a>
                            </div>
                            <div id="collapseOne" class="accordion-body collapse">
                                <div class="accordion-inner">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <%# DataBinder.Eval(Container.DataItem, "Id") %>
                                        </div>
                                         <div class="col-lg-8">
                                              <%# DataBinder.Eval(Container.DataItem, "Nome") %>
                                        </div>
                                         <div class="col-lg-4">
                                              <%# DataBinder.Eval(Container.DataItem, "Email") %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>


</asp:Content>
