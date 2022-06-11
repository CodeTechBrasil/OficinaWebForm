<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormBootstrapCrud.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>

    <div class="row">
        <div class="col-12">
             <asp:Label runat="server" CssClass="text-danger" Text="Digite o Texto"></asp:Label>
             <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="row">
            <div class="col">
                <asp:Button runat="server" OnClick="btnClicar_Click" ID="btnClicar" />
            </div>
        </div>
    </div>
</asp:Content>
