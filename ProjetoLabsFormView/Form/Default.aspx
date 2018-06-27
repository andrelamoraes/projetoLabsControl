<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Default.aspx.cs" Inherits="Form_Default" %>

<asp:Content ID="BodyType" ContentPlaceHolderID="content" runat="server">
    <br />
<div class="container">
        <div class="row h-100 justify-content-center align-items-center">
            <div class="form-horizontal" style="width: 70%">
    <%--<div class="container m-2 p-0">
        <div class="row">
            <div class="col-sm-9 rounded">--%>
                <iframe
                  width="100%"
                  height="100%"
                  frameborder="0" style="border:0"
                  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyClUCP2j7wFtEZMy6Qkq33MeYjsM6hlV60
                    &q=Universidade Castelo Branco, Realengo, Brasil" allowfullscreen>
                </iframe>
            </div>
            <div class="col-sm-3">
                <div class="card">
                    <div class="card-header">
                        Olá, <% if (returnTipoUsuario() == 1)
                                 { %> Administrador <% }
                            else
                            { %>
                        Professor <% }; %>!
                    </div>
                    <div class="card-body">
                        <p>Seja bem vindo ao sistema de gerenciamento de laboratórios da UCB.</p>
                    </div>
                    <div class="card-footer"></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>