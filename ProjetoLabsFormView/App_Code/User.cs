using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public User()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void cadastrarUsuario(String login, String senha, String email, int tipo)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            tb_Usuario novoUsuario = new tb_Usuario();

            novoUsuario.u_login = login;
            novoUsuario.u_senha = senha;
            novoUsuario.u_email = email;
            novoUsuario.id_TipoUsuario = tipo;

            db.tb_Usuarios.InsertOnSubmit(novoUsuario);
            db.SubmitChanges();
        };
    }
}