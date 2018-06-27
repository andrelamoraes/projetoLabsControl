using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Sessao
{

    public static int UsuarioLogado;
    public static int TipoUsuarioL;

    public static Int32 UsuarioId
    {
        get { return Sessao.UsuarioLogado; }
        set { Sessao.UsuarioLogado = value;}
    }

    public static Int32 _TipoUsuario
    {
        get { return Sessao._TipoUsuario; }
        set { Sessao.TipoUsuarioL = value; }
    }
}