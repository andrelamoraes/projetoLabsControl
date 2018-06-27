using System;


public partial class GridView_GrdSoftware : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BtnEditar.Visible = false;
    }

    protected void btnEditarOnClick(object sender, EventArgs e) 
    {
        editarSoftware();
    }

    protected void btnSalvarOnClick(object sender, EventArgs e)
    {
  
        salvarSofware();   

    }

    private void editarSoftware()
    {
        Sofware sft = new Sofware();

        sft.editarSofware(Convert.ToInt32(GridSoftware.SelectedRow.Cells[0].Text),
                            txtNome,
                            txtDescricao,
                            txtInterface,
                            txtVersao);

        Response.Redirect("FrmSoftware.aspx");
    }

    private void salvarSofware()
    {
        Sofware sft = new Sofware();

        sft.cadastrarSoftware(txtNome, txtDescricao, txtInterface, txtVersao);
        Response.Redirect("FrmSoftware.aspx?msg='Usuário cadastrado;'");
    }

    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        pnlCadastrarUsuario.Visible = true;
        BtnEditar.Visible = false;
        btnCadastrarUsuario.Visible = true;

    }

    protected void GridSoftware_SelectedIndexChanged(object sender, EventArgs e)
    {
        pegarGridView();
    }

    void pegarGridView()
    {
        pnlCadastrarUsuario.Visible = true;
        BtnEditar.Visible = true;
        btnCadastrarUsuario.Visible = false;

        txtNome.Text = GridSoftware.SelectedRow.Cells[1].Text;
        txtInterface.Text = GridSoftware.SelectedRow.Cells[2].Text;
        txtDescricao.Text = GridSoftware.SelectedRow.Cells[3].Text;
        txtVersao.Text = GridSoftware.SelectedRow.Cells[4].Text;
    }
}