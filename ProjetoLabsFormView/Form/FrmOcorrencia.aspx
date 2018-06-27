<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmOcorrencia.aspx.cs" Inherits="Form_FrmOcorrencia" %>

<asp:Content ID="BodyType" runat="server" ContentPlaceHolderID="content">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <div class="form-group">
                    <br />
                    <asp:Label ID="lblLabs" CssClass="label" runat="server" AssociatedControlID="dplLabs" Text="Laboratório"></asp:Label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="dplLabs" runat="server" CssClass="button is-primary is-outlined"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblOcorrência" AssociatedControlID="txtArea" CssClass="label" runat="server" Text="Ocorrência "></asp:Label>
                    <div class="col-sm-10">
                        <textarea id="txtArea" textmode="Multiline" name="s1" cols="20" rows="5" class="textarea is-primary" placeholder="Digite a ocorrência de no máximo 300 caractéres. " draggable="false" runat="server"></textarea>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtArea" ErrorMessage="O campo Ocorrência deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />
                <asp:Button ID="btnCadastrarUsuario" class="button is-primary is-outlined" runat="server" Text="Salvar" OnClientClick="return valOcorrencia()" OnClick="btnSalvarOcorrencia_Click" />
                <asp:Button ID="btnLimpar" class="button is-primary is-outlined" runat="server" Text="Limpar" />
                <br />
                <asp:GridView ID="GridView1" CssClass="table" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Ocorrencia" DataSourceID="SqlDataSource1" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="id_Ocorrencia" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_Ocorrencia" />
                        <asp:BoundField DataField="u_login" HeaderText="Usuário" SortExpression="u_login" />
                        <asp:BoundField DataField="lb_Numero" HeaderText="Laboratório" SortExpression="lb_Numero" />
                        <asp:BoundField DataField="oc_descricao" HeaderText="Descrição" SortExpression="oc_descricao" />
                        <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="button is-link is-outlined"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>" DeleteCommand="DELETE FROM [tb_Ocorrencia] WHERE [id_Ocorrencia] = @id_Ocorrencia" InsertCommand="INSERT INTO [tb_Ocorrencia] ([oc_descricao]) VALUES (@oc_descricao)" SelectCommand="SELECT        dbo.tb_Ocorrencia.id_Ocorrencia, dbo.tb_Usuario.u_login, dbo.tb_Laboratorio.lb_Numero, dbo.tb_Ocorrencia.oc_descricao
FROM            dbo.tb_Ocorrencia INNER JOIN
                         dbo.tb_Laboratorio ON dbo.tb_Ocorrencia.id_Laboratorio = dbo.tb_Laboratorio.id_Laboratorio INNER JOIN
                         dbo.tb_Usuario ON dbo.tb_Ocorrencia.id_Usuario = dbo.tb_Usuario.id_Usuario"
                    UpdateCommand="UPDATE [tb_Ocorrencia] SET [oc_descricao] = @oc_descricao WHERE [id_Ocorrencia] = @id_Ocorrencia">
                    <DeleteParameters>
                        <asp:Parameter Name="id_Ocorrencia" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="oc_descricao" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="oc_descricao" Type="String" />
                        <asp:Parameter Name="id_Ocorrencia" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
