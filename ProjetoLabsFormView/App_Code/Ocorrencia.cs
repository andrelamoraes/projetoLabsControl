using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ocorrencia
/// </summary>
public class Ocorrencia
{
    public Ocorrencia()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void cadastrarOcorrencia(String ocorrencia,String LabsNome)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var idLaboratorio = Convert.ToInt32((from p in db.tb_Laboratorios where p.lb_Numero.Equals(LabsNome) select p.id_Laboratorio).FirstOrDefault());

            tb_Ocorrencia novaOcorrencia = new tb_Ocorrencia();

            novaOcorrencia.oc_descricao = ocorrencia;
            novaOcorrencia.id_Laboratorio = idLaboratorio;
            novaOcorrencia.id_Usuario = Sessao.UsuarioLogado;

            db.tb_Ocorrencias.InsertOnSubmit(novaOcorrencia);
            db.SubmitChanges();
            db.Dispose();

        };
    }
}