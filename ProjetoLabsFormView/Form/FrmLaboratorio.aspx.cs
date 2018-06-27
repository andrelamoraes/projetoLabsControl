using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_FrmLaboratorio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnEditar.Visible = false;
        GridView1.PageSize = 3;
    }

    protected void btnCadastrarLab_Click(object sender, EventArgs e)
    {
        cadastrarLab();

        Response.Redirect("FrmLaboratorio.aspx");
    }

    void cadastrarLab()
    {
        Laboratorio lb = new Laboratorio();
        String projetor; String arconde;
        if (rdSimPj.Checked)
        { projetor = "Sim"; }
        else
        { projetor = "Nao"; }

        if (rdSimAr.Checked)
        { arconde = "Sim"; }
        else
        { arconde = "Nao"; }

        lb.cadastrarLaboratorio(txtNumeroLaboratorio.Text, Convert.ToInt32(txtCapacidade.Text), projetor, arconde);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        rdSimPj.Checked = false;
        rdNaoPj.Checked = false;
        rdSimAr.Checked = false;
        rdNaoAr.Checked = false;
        pegarGridView();
    }

    void pegarGridView()
    {
        btnEditar.Visible = true;
        btnCadastrarLab.Visible = false;

        switch (GridView1.SelectedRow.Cells[3].Text.Trim())
        {
            case "Sim":
                rdNaoAr.Checked = false;
                rdSimAr.Checked = true;
                break;
            case "Nao":
                rdSimAr.Checked = false;
                rdNaoAr.Checked = true;
                break;
        }

        switch (GridView1.SelectedRow.Cells[4].Text.Trim())
        {
            case "Sim":
                rdNaoPj.Checked = false;
                rdSimPj.Checked = true;

                break;
            case "Nao":
                rdSimPj.Checked = false;
                rdNaoPj.Checked = true;

                break;
        }

        txtNumeroLaboratorio.Text = GridView1.SelectedRow.Cells[1].Text;
        txtCapacidade.Text = GridView1.SelectedRow.Cells[2].Text;


    }

    protected void btnEditar_Click(object sender, EventArgs e)
    {
        editarLaboratorio();

        Response.Redirect("FrmLaboratorio.aspx");
    }

    void editarLaboratorio()
    {
        Laboratorio lb = new Laboratorio();

        String projetor; String arconde;
        if (rdSimPj.Checked)
        { projetor = "Sim"; }
        else
        { projetor = "Nao"; }

        if (rdSimAr.Checked)
        { arconde = "Sim"; }
        else
        { arconde = "Nao"; }

        lb.editarLaboratorio(Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text), txtNumeroLaboratorio.Text, Convert.ToInt32(txtCapacidade.Text), projetor, arconde);


    }

}
