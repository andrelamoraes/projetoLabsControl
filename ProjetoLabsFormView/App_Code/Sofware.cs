using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Sofware
/// </summary>
public class Sofware
{
    public Sofware()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void editarSofware(int idSoftware,
        TextBox txtNome,
        TextBox txtDescricao,
        TextBox txtInterface,
        TextBox txtVersao)
    {
        using (DataClassesDataContext banco = new DataClassesDataContext())
        {
            tb_Software resultado = (from p in banco.tb_Softwares
                                     where p.id_Software.Equals(idSoftware)
                                     select p).SingleOrDefault();


            resultado.sf_nome = txtNome.Text;
            resultado.sf_descricao = txtDescricao.Text;
            resultado.sf_interface = txtInterface.Text;
            resultado.sf_versao = txtVersao.Text;

            banco.SubmitChanges();
        }

    }

    public void cadastrarSoftware(
        TextBox txtNome,
        TextBox txtDescricao,
        TextBox txtInterface,
        TextBox txtVersao)
    {
        using (DataClassesDataContext banco = new DataClassesDataContext())
        {
            tb_Software novoCadastro = new tb_Software();

                novoCadastro.sf_nome = txtNome.Text;
                novoCadastro.sf_descricao = txtDescricao.Text;
                novoCadastro.sf_interface = txtInterface.Text;
                novoCadastro.sf_versao = txtVersao.Text;

                banco.tb_Softwares.InsertOnSubmit(novoCadastro);
                banco.SubmitChanges();
        }
    }
}