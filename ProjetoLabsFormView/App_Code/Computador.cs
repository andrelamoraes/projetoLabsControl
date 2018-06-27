using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Computador
/// </summary>
public class Computador
{
    public Computador()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void cadastrarComputador(String nomePC, 
                                    String mRam, 
                                    String processador,
                                    String plMae,String stPC, 
                                    int lab)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {

            tb_Computador novoComputador = new tb_Computador();

            novoComputador.nm_Computador = nomePC;
            novoComputador.plMae_Computador = plMae;
            novoComputador.st_Computador = stPC;
            novoComputador.mRam_Computador = mRam;
            novoComputador.processador_Computador = processador;
            novoComputador.id_Laboratorio = lab;


            db.tb_Computadors.InsertOnSubmit(novoComputador);
            db.SubmitChanges();
            db.Dispose();

        };
    }

    public int pegarIdLaboratorio(String labSelecionado)
    {

        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = (from labs in db.tb_Laboratorios
                             where labs.lb_Numero == labSelecionado
                             select labs.id_Laboratorio).FirstOrDefault();

            var res = Convert.ToInt32(resultado);

            return res;
        }

    }

    public void editarComputador(int idComputador,
        String txtNumSerie,
        String txtMemRam,
        String txtProcessador,
        String txtPlacaMae,
        String dplStatusPc,
        int idLaboratorio)
    {
        using (DataClassesDataContext banco = new DataClassesDataContext())
        {
            tb_Computador resultado = (from p in banco.tb_Computadors
                                     where p.id_Computador.Equals(idComputador)
                                     select p).SingleOrDefault();

            resultado.nm_Computador = txtNumSerie;
            resultado.mRam_Computador = txtMemRam;
            resultado.processador_Computador = txtProcessador;
            resultado.plMae_Computador = txtPlacaMae;
            resultado.st_Computador = dplStatusPc;
            resultado.id_Laboratorio = idLaboratorio;

            banco.SubmitChanges();
        }
    }
}