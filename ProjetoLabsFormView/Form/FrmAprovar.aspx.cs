using System;
using System.Linq;

public partial class Form_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.PageSize = 3;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        aprovarSolcitacao.Visible = true;
        btnAprovar.Visible = true;
        btnRecusar.Visible = true;

    }

    protected void btnAprovar_Click(object sender, EventArgs e)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            tb_Agendamento resultado = (from p in db.tb_Agendamentos
                                        where

           p.id_agendamento.Equals(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text))

                                        select p).FirstOrDefault();

            resultado.id_Status_Agendamento = 2;

            db.SubmitChanges();

        }

        Response.Redirect("FrmAprovar.aspx");
    }

    protected void btnRecusar_Click(object sender, EventArgs e)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            tb_Agendamento resultado = (from p in db.tb_Agendamentos
                                        where

           p.id_agendamento.Equals(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text))

                                        select p).FirstOrDefault();

            resultado.id_Status_Agendamento = 1002;

            db.SubmitChanges();

        }

        Response.Redirect("FrmAprovar.aspx");
    }


    protected void btnVoltar_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAgendamentos.aspx");
    }


}