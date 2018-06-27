using System;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Summary description for Util
/// </summary>
public class Util
{
    public Util()
    {

    }

    public bool validarLogin(String usuario, String senha)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = (from p in db.tb_Usuarios where p.u_login.Equals(usuario) && p.u_senha.Equals(senha) select p).FirstOrDefault();
            
            List<tb_Usuario> resultado2  = (from p in db.tb_Usuarios where p.u_login.Equals(usuario) select p).ToList();

            if (resultado != null)
            {
                foreach (var item in resultado2)
                {

                    Sessao.UsuarioId = item.id_Usuario;
                    Sessao.TipoUsuarioL = item.id_TipoUsuario;
                }

                return true;
            }
            else
            {
                return false;
            }
        }
    }




}