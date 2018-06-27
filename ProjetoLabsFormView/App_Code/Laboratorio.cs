using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Laboratorio
/// </summary>
public class Laboratorio
{
    public Laboratorio()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void cadastrarLaboratorio
        (String lb_Numero, int lb_Capacidade, String projetor, String arcondicionado)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {

            tb_Laboratorio novoLaboratorio = new tb_Laboratorio();

            novoLaboratorio.lb_Numero = lb_Numero;
            novoLaboratorio.lb_Capacidade = lb_Capacidade;
            novoLaboratorio.lb_Projeto = projetor;
            novoLaboratorio.lb_Arcondicionado = arcondicionado;

            db.tb_Laboratorios.InsertOnSubmit(novoLaboratorio);
            db.SubmitChanges();
            db.Dispose();

        };
    }

    public void editarLaboratorio
    (int idLaboratorio,String lb_Numero, int lb_Capacidade, String projetor, String arcondicionado)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            tb_Laboratorio resultado = (from p in db.tb_Laboratorios
                                     where p.id_Laboratorio.Equals(idLaboratorio)
                                     select p).SingleOrDefault();



            resultado.lb_Numero = lb_Numero;
            resultado.lb_Capacidade = lb_Capacidade;
            resultado.lb_Projeto = projetor;
            resultado.lb_Arcondicionado = arcondicionado;

            db.SubmitChanges();
            db.Dispose();

        };
    }
}