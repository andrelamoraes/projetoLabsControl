<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmSoftware.aspx.cs" Inherits="GridView_GrdSoftware" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <br />
                <asp:Panel ID="pnlCadastrarUsuario" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lblNome" AssociatedControlID="txtNome" CssClass="label" runat="server" Text="Nome: "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtNome" placeholder="Nome do Software" CssClass="input is-primary" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O campo Nome deve ser preenchido." ControlToValidate="txtNome" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblInterface" CssClass="label" runat="server" Text="Interface"></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtInterface" CssClass="input is-primary" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="O campo Interface deve ser preenchido." ControlToValidate="txtInterface" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDescricao" CssClass="label" runat="server" Text="Descrição "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtDescricao" CssClass="input is-primary" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="O campo Descrição deve ser preenchido." ControlToValidate="txtDescricao" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblVersao" CssClass="label" runat="server" Text="Versão: "></asp:Label></>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtVersao" CssClass="input is-primary" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtVersao" ErrorMessage="O campo Versão deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    </div>
                    
                    <asp:Button ID="btnCadastrarUsuario" class="button is-primary is-outlined" runat="server" Text="Salvar"  OnClick="btnSalvarOnClick" />
                    <asp:Button ID="BtnEditar" runat="server" Text="Editar" class="button is-primary is-outlined" OnClick="btnEditarOnClick" /></>
                    <asp:Button ID="btnLimpar" class="button is-primary is-outlined" runat="server" Text="Limpar" />
                </asp:Panel>

                <asp:GridView CssClass="table" GridLines="None" ID="GridSoftware" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Software" DataSourceID="SqlDataSource1" AllowPaging="True" Height="254px" Width="728px" OnSelectedIndexChanged="GridSoftware_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="id_Software" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_Software" />
                        <asp:BoundField DataField="sf_nome" HeaderText="Nome" SortExpression="sf_nome" />
                        <asp:BoundField DataField="sf_interface" HeaderText="Interface" SortExpression="sf_interface" />
                        <asp:BoundField DataField="sf_descricao" HeaderText="Descricao" SortExpression="sf_descricao" />
                        <asp:BoundField DataField="sf_versao" HeaderText="Versao" SortExpression="sf_versao" />
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="button is-danger is-outlined" ShowDeleteButton="True" />
                        <asp:CommandField ButtonType="Button" ControlStyle-CssClass="button is-link is-outlined" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>" OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT * FROM [tb_Software]" DeleteCommand="DELETE FROM [tb_Software] WHERE [id_Software] = @original_id_Software" InsertCommand="INSERT INTO [tb_Software] ([sf_nome], [sf_interface], [sf_descricao], [sf_versao]) VALUES (@sf_nome, @sf_interface, @sf_descricao, @sf_versao)" UpdateCommand="UPDATE [tb_Software] SET [sf_nome] = @sf_nome, [sf_interface] = @sf_interface, [sf_descricao] = @sf_descricao, [sf_versao] = @sf_versao WHERE [id_Software] = @original_id_Software">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id_Software" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="sf_nome" Type="String" />
                        <asp:Parameter Name="sf_interface" Type="String" />
                        <asp:Parameter Name="sf_descricao" Type="String" />
                        <asp:Parameter Name="sf_versao" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sf_nome" Type="String" />
                        <asp:Parameter Name="sf_interface" Type="String" />
                        <asp:Parameter Name="sf_descricao" Type="String" />
                        <asp:Parameter Name="sf_versao" Type="String" />
                        <asp:Parameter Name="original_id_Software" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
