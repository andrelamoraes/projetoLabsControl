<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmLaboratorio.aspx.cs" Inherits="Form_FrmLaboratorio" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <br />

                <div class="form-group">
                    <asp:Label ID="lblNumeroLaboratorio" AssociatedControlID="txtNumeroLaboratorio" CssClass="label" runat="server" Text="Numero do Laboratorio: "></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNumeroLaboratorio" placeholder="Nome do Laboratorio" CssClass="input is-primary" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNumeroLaboratorio" ErrorMessage="O campo Laboratório deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCapacidade" AssociatedControlID="txtCapacidade" CssClass="label" runat="server" Text="Capacidade: "></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCapacidade" placeholder="Capacidade" CssClass="input is-primary" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCapacidade" ErrorMessage="O campo Capacidade deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblArcondicionado" CssClass="label" runat="server" Text="Ar Condicionado: "></asp:Label>
                    <div class="col-sm-10">
                        <asp:RadioButton ID="rdSimAr" class="radio" Text="Sim" runat="server" GroupName="Arconde" />
                        <asp:RadioButton ID="rdNaoAr" class="radio" Text="Não" runat="server" GroupName="Arconde" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblProjetor" CssClass="label" AssociatedControlID="rdSimPj" runat="server" Text="Projetor: "></asp:Label>
                    <div class="col-sm-10">
                        <asp:RadioButton ID="rdSimPj" class="radio" Text="Sim" runat="server" GroupName="Projetor" />
                        <asp:RadioButton ID="rdNaoPj" class="radio" Text="Não" runat="server" GroupName="Projetor" />
                    </div>
                </div>
                <asp:Button ID="btnCadastrarLab" class="button is-primary is-outlined" runat="server" Text="Cadastrar" OnClick="btnCadastrarLab_Click" />
                <asp:Button ID="btnEditar" class="button is-primary is-outlined" runat="server" Text="Editar" OnClick="btnEditar_Click" />
                <br />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="id_Laboratorio" GridLines="None" DataSourceID="SqlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>

                        <asp:BoundField DataField="id_Laboratorio" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_Laboratorio" />
                        <asp:BoundField DataField="lb_Numero" HeaderText="Nome" SortExpression="lb_Numero" />
                        <asp:BoundField DataField="lb_Capacidade" HeaderText="Capacidade" SortExpression="lb_Capacidade" />
                        <asp:BoundField DataField="lb_Arcondicionado" HeaderText="ArCondicionado" SortExpression="lb_Arcondicionado" />
                        <asp:BoundField DataField="lb_Projeto" HeaderText="Projetor" SortExpression="lb_Projeto" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="button is-danger is-outlined">
                            <ControlStyle CssClass="button is-danger is-outlined" />
                        </asp:CommandField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="button is-link is-outlined">
                            <ControlStyle CssClass="button is-link is-outlined" />
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>" SelectCommand="SELECT        id_Laboratorio, lb_Numero, lb_Capacidade, lb_Arcondicionado, lb_Projeto
FROM            dbo.tb_Laboratorio"
                    DeleteCommand="DELETE FROM tb_Laboratorio WHERE (id_Laboratorio = @id_Laboratorio)">
                    <DeleteParameters>
                        <asp:Parameter Name="id_Laboratorio" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
