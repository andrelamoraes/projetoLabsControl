using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_FrmComputador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BtnEditar.Visible = false;
        if (!IsPostBack)
        {
            LerDropDrown();
        }

    }

    private void LerDropDrown()
    {
        List<String> Labs;

        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = from labs in db.tb_Laboratorios
                            select labs.lb_Numero;

            Labs = resultado.ToList();
        }


        dplLaboratorios.DataSource = Labs;
        dplLaboratorios.DataBind();
    }

    protected void btnCadastrarPc_Click(object sender, EventArgs e)
    {
        cadastrarPC();
    }

    private void cadastrarPC()
    {
        Computador pc = new Computador();

        pc.cadastrarComputador(txtNumSerie.Text,
            txtMemRam.Text,
            txtProcessador.Text,
            txtPlacaMae.Text,
            dplStatusPc.Text,
            pc.pegarIdLaboratorio(dplLaboratorios.SelectedItem.Text)
            );

        Response.Redirect("FrmComputador.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pegarGridView();
        btnCadastrarPc.Visible = false;
    }

    protected void BtnNovoComputador_Click(object sender, EventArgs e)
    {
        pnlCadastrarLab.Visible = true;
        btnCadastrarPc.Visible = true;
    }

    void pegarGridView()
    {
        pnlCadastrarLab.Visible = true;
        BtnEditar.Visible = true;

        txtMemRam.Text = GridView1.SelectedRow.Cells[1].Text;
        txtPlacaMae.Text = GridView1.SelectedRow.Cells[2].Text;
        txtProcessador.Text = GridView1.SelectedRow.Cells[3].Text;
        txtNumSerie.Text = GridView1.SelectedRow.Cells[4].Text;
        dplLaboratorios.SelectedItem.Text = GridView1.SelectedRow.Cells[6].Text;
    }

    protected void BtnEditar_Click(object sender, EventArgs e)
    {
        editarPC();
    }

    private void editarPC()
    {

        Computador pc = new Computador();
        pc.editarComputador(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text), 
            txtNumSerie.Text,
            txtMemRam.Text, 
            txtProcessador.Text,
            txtPlacaMae.Text,
            dplStatusPc.SelectedItem.Text,
            pc.pegarIdLaboratorio(dplLaboratorios.SelectedItem.Text));
        Response.Redirect("FrmComputador.aspx");
    }
}