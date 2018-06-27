<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmAprovar.aspx.cs" Inherits="Form_Home" %>


<asp:Content ID="BodyType" runat="server" ContentPlaceHolderID="content">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <div class="form-group">
                    <div class="row h-100 justify-content-center align-items-center">
                        <div class="form-horizontal" style="width: 50%">
                            <br />
                            <br />
                            <asp:Panel ID="aprovarSolcitacao" runat="server" Visible="false">
                                <asp:Label ID="Label1" runat="server" CssClass="Label" Text="Deseja aprovar a solicitação abaixo?"> </asp:Label>
                                <br />
                                <br />
                                <asp:Button ID="btnAprovar" runat="server" Text="Aprovar" OnClick="btnAprovar_Click" CssClass="button is-success is-outlined" />
                                <asp:Button ID="btnRecusar" runat="server" Text="Recusar" OnClick="btnRecusar_Click" CssClass="button is-danger is-outlined" />
                            </asp:Panel>
                        </div>
                    </div>
                    <br />

                    <asp:Panel ID="pnlSolicitacoes" runat="server">
                        <asp:GridView ID="GridView1" CssClass="table" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="id_agendamento" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="id_agendamento" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="id_agendamento" />
                                <asp:BoundField DataField="u_login" HeaderText="Usuário" SortExpression="u_login" />
                                <asp:BoundField DataField="ds_descricao" HeaderText="Descrição" SortExpression="ds_descricao" />
                                <asp:BoundField DataField="dt_agendamento" HeaderText="Data" SortExpression="dt_agendamento" DataFormatString="{0:d}" HtmlEncode="false" />
                                <asp:BoundField DataField="hr_HorarioInicial" HeaderText="Hora" SortExpression="hr_HorarioInicial" />
                                <asp:BoundField DataField="NomeStatus" HeaderText="Status" SortExpression="NomeStatus" />
                                <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="button is-link is-outlined" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LabsControl1ConnectionString %>" SelectCommand="SELECT        dbo.tb_Agendamento.id_agendamento, dbo.tb_Usuario.u_login, dbo.tb_Disciplina.ds_descricao, dbo.tb_Agendamento.dt_agendamento, dbo.tb_Horario.hr_HorarioInicial, dbo.Status_Agendamento.NomeStatus
FROM            dbo.Status_Agendamento INNER JOIN
                         dbo.tb_Agendamento ON dbo.Status_Agendamento.id_Status_Agendamento = dbo.tb_Agendamento.id_Status_Agendamento INNER JOIN
                         dbo.tb_Horario ON dbo.tb_Agendamento.id_Horario = dbo.tb_Horario.id_Horario INNER JOIN
                         dbo.tb_Usuario ON dbo.tb_Agendamento.id_usuario = dbo.tb_Usuario.id_Usuario INNER JOIN
                         dbo.tb_Disciplina ON dbo.tb_Agendamento.id_Disciplina = dbo.tb_Disciplina.id_Disciplina WHERE Status_Agendamento.NomeStatus='Aguardando Aprovação';"
                            DeleteCommand="DELETE FROM tb_Agendamento WHERE (id_agendamento = @id_agendamento)">
                            <DeleteParameters>
                                <asp:Parameter Name="id_agendamento" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnVoltar" runat="server" Text="Voltar" OnClick="btnVoltar_Click" CssClass="button is-primary is-outlined" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
