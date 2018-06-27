<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Form_Login" %>

<!DOCTYPE html>

<html lang="pt-br">

<head runat="server">
    <title>Projeto Labs</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.1/css/bulma.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" />

</head>
<style>
    body {
        font-family: "Poppins", sans-serif !important;
        font-size: 14px !important;
        color: #333 !important;
        height:100%;
    }
    .form-horizontal {
    padding-top: 10%;
}
    .form-horizontal > section {
    background-color: #eceaea;
    border-radius: 10px;
    padding: 24px;
}
    .login-change {
        background-color: #FFF !important;
    }
    .label {
        padding-left: 18px;
    }
    footer#app-footer{
    background-color: #17a2b8 !important;
    clear: both;
    position: absolute;
    height: 83px;
    width: 100%;
    font-weight: bolder;
    bottom: 0;
    color: #FFF;
    }
    @media (min-width: 576px) .col-sm-10 {
    max-width: 100% !important;
}
    a.copyright h5 {
    padding: 17px;
}
</style>
<body>
    <form id="form2" runat="server">
        <div class="container">
            <div class="row h-100 justify-content-center align-items-center">
                <div class="form-horizontal" style="width: 50%">
   
                    <asp:Panel ID="pnlError" runat="server" Visible="false">
                        <div class="alert alert-danger"  role="alert">Usuário ou senha inválido!</div>
                    </asp:Panel>
                    <section>
                    <div class="form-group">
                        <div class="col-sm-2"></div>
                        <div class="page-header">
                            <h1>LabsControl
                                <img src="../Image/icon_portal.png" class="img-responsive" width="100" />
                            </h1>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNome" AssociatedControlID="txtUsuario" runat="server" Text="Nome" CssClass="label"></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtUsuario" runat="server" placeholder="Usuario" CssClass="input is-primary"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblInterface" AssociatedControlID="txtSenha" runat="server" Text="Senha" CssClass="label"></asp:Label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="input is-primary" placeholder="Senha"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-2 control-label"></div>
                        <div class="col-sm-10">
                            <asp:Button ID="btnLogin" runat="server" class="button is-primary is-outlined login-change" Text="Entrar" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                        </section>
                </div>
            </div>
        </div>
    </form>
    <footer id="app-footer">
        <div class="container">
        <a class="copyright">
            <h5>Copyright ® 2018 by GrupoTrembatec - All rights reserved.</h5>
        </a>
            </div>
    </footer>
</body>
</html>


