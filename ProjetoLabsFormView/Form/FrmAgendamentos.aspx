<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmAgendamentos.aspx.cs" Inherits="Form_FrmAgendamento" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 50%">
                <div class="form-group">
                    <asp:Panel ID="pnlsucesso" runat="server" Visible="false">
                        <div class="alert alert-success" role="alert">Solicitação enviada, aguarde a aprovação!</div>
                    </asp:Panel>
                    <asp:Panel ID="pnlError" runat="server" Visible="false">
                        <div class="alert alert-danger" role="alert">Insira os dados corretamente !</div>
                    </asp:Panel>
                </div>
                <br />
                <div class="form-group">
                    <asp:Button ID="btnExibirAprovacoes" class="button is-primary is-outlined" runat="server" Text="Aprovações Pendentes" OnClick="btnExibirAprovacoes_Click" Visible="false" />
                    <asp:Button ID="btnCadAgendamento" runat="server" Text="Cadastrar Novo Agendamento" OnClick="btnCadAgendamento_Click" CssClass="button is-primary is-outlined" />
                </div>
                <asp:Panel ID="pnlAgendamento" runat="server" Visible="false">
                    <div class="form-group">
                        <asp:Label CssClass="label" ID="Label3" runat="server" Text="Disciplina:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplDisciplina" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label CssClass="label" ID="Label5" runat="server" Text="Laboratório:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplLabs" runat="server" OnSelectedIndexChanged="dplLabs_SelectedIndexChanged" OnTextChanged="dplLabs_TextChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label CssClass="label" ID="Label4" runat="server" Text="Data:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox CssClass="input is-primary" ID="txtData" runat="server" MaxLength="5" Width="100"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton1" runat="server" Width="30px" OnClick="ImageButton1_Click" ImageUrl="~/Image/Calendar.png" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label CssClass="label" ID="Label2" runat="server" Text="Horario:  "></asp:Label>
                        <div class="col-sm-10">
                            <asp:DropDownList CssClass="button is-primary is-outlined" ID="dplHorarioInicial" AutoPostBack="true" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender" BackColor="#FFFFFF" BorderColor="White" BorderWidth="0px" Font-Names="Comic Sans MS" Font-Size="9pt" ForeColor="#48D1CC" Height="190px" NextPrevFormat="ShortMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#48D1CC" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#B0E0E6" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="0px" Font-Bold="True" Font-Size="12pt" ForeColor="#48D1CC" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <br />
                    <asp:Button ID="btnCadastrarPc" class="button is-primary is-outlined" runat="server" Text="Solicitar Agendamento" OnClick="btnCadastrarPc_Click" />
                    <asp:Button ID="btnLimpar" class="button is-primary is-outlined" runat="server" Text="Limpar" OnClick="btnLimpar_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
