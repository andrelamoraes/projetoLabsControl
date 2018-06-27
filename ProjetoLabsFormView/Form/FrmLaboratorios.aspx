<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="FrmLaboratorios.aspx.cs" Inherits="Form_FrmLaboratorios" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="container">
            <div class="form-horizontal" style="width: 50%">
                <div class="form-group">
                    <asp:Label ID="lblNumeroLaboratorio" AssociatedControlID="txtNumeroLaboratorio" CssClass="label" runat="server" Text="Numero do Laboratorio: "></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtNumeroLaboratorio" placeholder="Nome do Laboratorio" CssClass="input is-primary" runat="server"></asp:TextBox>
                    </div>
                    <div />
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
            </div>
        </div>
    </div>
</asp:Content>
