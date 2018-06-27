using System;


public partial class Usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCadastrarUsuario_Click(object sender, EventArgs e)
    {
        CadastrarUsuario();
    }

    private void CadastrarUsuario()
    {
        User usuario = new User();

        int perfil = 0;

        switch (dplPerfil.SelectedItem.Text)
        {
            case "Professor":
                perfil = 2;
                break;
            case "Administrador":
                perfil = 1;
                break;
        }

        usuario.cadastrarUsuario(txtUsuario.Text, txtSenha.Text, txtEmail.Text, perfil);
    }

}