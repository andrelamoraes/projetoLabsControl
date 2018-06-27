<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmUsuario.aspx.cs" Inherits="Usuario" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <asp:Panel ID="pnlCadastrarUsuario" runat="server">
                    <br />
                    <div class="form-group">
                        <asp:Label ID="Label1" AssociatedControlID="txtEmail" CssClass="label" runat="server" Text="Email"></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtEmail" CssClass="input is-primary" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNome" AssociatedControlID="txtUsuario" placeholder="Senha" CssClass="label" runat="server" Text="Usuário: "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtUsuario" CssClass="input is-primary" placeholder="Nome de Usuario" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="txtSenha" AssociatedControlID="txtPass" CssClass="label" placeholder="Senha" runat="server" Text="Senha"></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtPass" CssClass="input is-primary" runat="server" placeholder="Senha" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" AssociatedControlID="dplPerfil" CssClass="label" runat="server"></asp:Label>
                        <div class="col-sm-10">
                            <asp:Label ID="Label3" CssClass="label" runat="server" Text="Perfil"></asp:Label>
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplPerfil" runat="server">
                                <asp:ListItem>Professor</asp:ListItem>
                                <asp:ListItem>Administrador</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <asp:Button ID="btnCadastrarUsuario" class="button is-primary is-outlined" runat="server" Text="Salvar" OnClick="btnCadastrarUsuario_Click" />
                            <asp:Button ID="btnLimpar" class="button is-primary is-outlined" runat="server" Text="Limpar" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" CssClass="table" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Usuario" DataSourceID="SqlDataSource1" AllowPaging="True">
                    <Columns>

                        <asp:BoundField DataField="id_Usuario" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_Usuario" />
                        <asp:BoundField DataField="u_email" HeaderText="Email" SortExpression="u_email" />
                        <asp:BoundField DataField="u_login" HeaderText="Usuario" SortExpression="u_login" />
                        <asp:BoundField DataField="tu_descricao" HeaderText="Perfil" SortExpression="tu_descricao" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="button is-danger is-outlined" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="button is-link is-outlined" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>" SelectCommand="SELECT        dbo.tb_Usuario.id_Usuario, dbo.tb_Usuario.u_email, dbo.tb_Usuario.u_login, dbo.tb_TipoUsuario.tu_descricao
FROM            dbo.tb_Usuario INNER JOIN
                         dbo.tb_TipoUsuario ON dbo.tb_Usuario.id_TipoUsuario = dbo.tb_TipoUsuario.id_TipoUsuario"
                    DeleteCommand="DELETE FROM tb_Usuario WHERE (id_Usuario = @id_Usuario)">
                    <DeleteParameters>
                        <asp:Parameter Name="id_Usuario" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
    </div>

</asp:Content>
