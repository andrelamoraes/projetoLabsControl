using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_FrmLogoff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Sessao.UsuarioId = 0;
        Sessao._TipoUsuario = 0;
        Response.Redirect("Login.aspx");
    }
}