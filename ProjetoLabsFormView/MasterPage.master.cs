using System;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Sessao.UsuarioId == 0)
        {
            Response.Redirect("Login.aspx");
        }
    }

    public int getPerfil()
    {
        return Sessao.TipoUsuarioL;
    }
}
