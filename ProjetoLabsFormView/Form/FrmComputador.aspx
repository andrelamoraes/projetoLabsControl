<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmComputador.aspx.cs" Inherits="Form_FrmComputador" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
   <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <asp:Panel ID="pnlCadastrarLab" runat="server">
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Número de Série:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="input is-primary" ID="txtNumSerie" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O campo Número de série deve ser preenchido." ControlToValidate="txtNumSerie" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label0" runat="server" Text="Memória Ram:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="input is-primary" ID="txtMemRam" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMemRam" ErrorMessage="O campo Memória Ram deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Processador:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="input is-primary" ID="txtProcessador" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtProcessador" ErrorMessage="O campo Processador deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Placa Mãe:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="input is-primary" ID="txtPlacaMae" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPlacaMae" ErrorMessage="O campo Placa Mãe deve ser preenchido." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Status:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplStatusPc" runat="server">
                                <asp:ListItem Text="Bom" Value="Bom"></asp:ListItem>
                                <asp:ListItem Text="Precisa de Manutenção" Value="Precisa de Manutenção"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Laboratório:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplLaboratorios" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <asp:Button class="button is-primary is-outlined" ID="btnCadastrarPc" runat="server" Text="Cadastrar" OnClick="btnCadastrarPc_Click" />
                    <asp:Button class="button is-primary is-outlined" ID="BtnEditar" runat="server" Text="Editar" OnClick="BtnEditar_Click" /></td>
              
                </asp:Panel>
                <br />
                <asp:Panel ID="Panel2" runat="server">

                    <asp:GridView ID="GridView1" CssClass="table" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Computador" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>

                            <asp:BoundField DataField="id_Computador" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_Computador" />
                            <asp:BoundField DataField="nm_Computador" HeaderText="Nº_Série" SortExpression="nm_Computador" />
                            <asp:BoundField DataField="mRam_Computador" HeaderText="RAM" SortExpression="mRam_Computador" />
                            <asp:BoundField DataField="plMae_Computador" HeaderText="Placa_Mãe" SortExpression="plMae_Computador" />
                            <asp:BoundField DataField="processador_Computador" HeaderText="Processador" SortExpression="processador_Computador" />
                            <asp:BoundField DataField="st_Computador" HeaderText="Status" SortExpression="st_Computador" />
                            <asp:BoundField DataField="lb_Numero" HeaderText="Laboratório" SortExpression="lb_Numero" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="button is-danger is-outlined"/>
                            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="button is-link is-outlined" ShowSelectButton="True" />
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>"
                        SelectCommand="SELECT        dbo.tb_Computador.id_Computador, dbo.tb_Computador.nm_Computador, dbo.tb_Computador.mRam_Computador, dbo.tb_Computador.plMae_Computador, dbo.tb_Computador.processador_Computador, 
                         dbo.tb_Computador.st_Computador, dbo.tb_Laboratorio.lb_Numero
FROM            dbo.tb_Computador INNER JOIN
                         dbo.tb_Laboratorio ON dbo.tb_Computador.id_Laboratorio = dbo.tb_Laboratorio.id_Laboratorio"
                        DeleteCommand="DELETE FROM tb_Computador WHERE (id_Computador = @id_Computador)">
                        <DeleteParameters>
                            <asp:Parameter Name="id_Computador" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <br />
                </asp:Panel>
           </div>
        </div>
    </div>
</asp:Content>
