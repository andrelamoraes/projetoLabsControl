using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form_FrmAgendamento : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            pegarListaLabs();
            txtData.Enabled = false;
            pegarListaDisciplina();
            Calendar1.Visible = false;


        }

        if (Sessao.TipoUsuarioL == 1)
        {
            btnExibirAprovacoes.Visible = true;
        }
    }

    void pegarListaLabs()
    {
        List<String> Labs;

        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = from labs in db.tb_Laboratorios
                            select labs.lb_Numero;

            Labs = resultado.ToList();
        }


        dplLabs.DataSource = Labs;
        dplLabs.DataBind();
    }

    void listarDisponibilidade()
    {


        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            Computador c = new Computador();

            var idLab = c.pegarIdLaboratorio(dplLabs.SelectedItem.Text);

            var horarios = from p in db.tb_Horarios select p;


            foreach (var item in horarios)
            {
                var agendamento = from p in db.tb_Agendamentos
                                  where p.dt_agendamento == DateTime.Parse(txtData.Text)
                                  && p.id_Horario == item.id_Horario && p.id_laboratorio == idLab
                                  select p;

                if (agendamento.Count() == 0)
                {
                    dplHorarioInicial.Items.Add(Convert.ToString(item.hr_HorarioInicial));
                }

                dplHorarioInicial.DataBind();

            }

        }

    }

    void pegarListaDisciplina()
    {
        List<String> disciplinas;
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = (from a in db.tb_Disciplinas select a.ds_descricao).ToList();
            disciplinas = resultado;
        }

        dplDisciplina.DataSource = disciplinas;
        dplDisciplina.DataBind();


    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        if (Calendar1.Visible)
        {
            Calendar1.Visible = false;
        }

        else
        {
            Calendar1.Visible = true;
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        txtData.Text = Calendar1.SelectedDate.ToShortDateString().ToString();
        Calendar1.Visible = false;
        txtData.Enabled = false;
        dplLabs.Enabled = false;
        listarDisponibilidade();
    }

    void cadastrarAgendamento()
    {
        Computador c = new Computador(); Agendamento ag = new Agendamento();

        var idLab = c.pegarIdLaboratorio(dplLabs.SelectedItem.Text);

        using (DataClassesDataContext db = new DataClassesDataContext())
        {

            var horarios = from p in db.tb_Horarios select p;


            foreach (var item in horarios)
            {
                var agendamento = (from p in db.tb_Agendamentos
                                   where p.dt_agendamento == DateTime.Parse(txtData.Text)
                                   && p.id_Horario == item.id_Horario && idLab == p.id_laboratorio
                                   select p);
                try
                {
                    if (agendamento.Count() == 0)
                    {
                        ag.cadastrarAgendamento(DateTime.Parse(txtData.Text),
                        pegarIdHorario(),
                        c.pegarIdLaboratorio(dplLabs.SelectedItem.Text),
                        pegarIdDisciplina());
                        // enviarEmail();
                        pnlsucesso.Visible = true;

                    }
                }
                catch (Exception)
                {
                    pnlsucesso.Visible = false;
                    pnlError.Visible = true;
                }
            }
            dplHorarioInicial.DataBind();
        }

    }

    private void limparcampos()
    {
        txtData.Text = string.Empty;
        dplHorarioInicial.DataSource = "";
        dplHorarioInicial.DataBind();
    }

    int pegarIdHorario()
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = (from p in db.tb_Horarios
                             where p.hr_HorarioInicial == TimeSpan.Parse(dplHorarioInicial.SelectedItem.Text)
                             select p.id_Horario).FirstOrDefault();

            return resultado;
        }

    }

    int pegarIdDisciplina()
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            var resultado = (from p in db.tb_Disciplinas
                             where p.ds_descricao == dplDisciplina.SelectedItem.Text
                             select p.id_Disciplina).FirstOrDefault();

            return resultado;
        }
    }

    void enviarEmail()
    {
        MailMessage mailObj = new MailMessage("grupotrembatec@outlook.com",
            "dedehmoraes@hotmail.com");

        mailObj.Subject = "Agendamento Laboratorio " + dplLabs.SelectedItem.Text;
        mailObj.Body = "Sua solicitação foi enviada e será aprovada pelo setor de agendamento de laboratórios em no máximo 2 horas.";



        try
        {
            SmtpClient SMTPServer = new SmtpClient("smtp.live.com");
            SMTPServer.Port = 587;
            SMTPServer.EnableSsl = true;
            SMTPServer.Credentials = new System.Net.NetworkCredential("grupotrembatec@outlook.com", "Evp2018.1");
            SMTPServer.UseDefaultCredentials = false;
            SMTPServer.Send(mailObj);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnCadastrarPc_Click(object sender, EventArgs e)
    {
        cadastrarAgendamento();
        limparcampos();
    }

    protected void dplLabs_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtData.Text = "";
    }

    protected void dplLabs_TextChanged(object sender, EventArgs e)
    {
        txtData.Text = "";
    }

    protected void btnLimpar_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAgendamento.aspx");
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime pastday = e.Day.Date;
        DateTime date = DateTime.Now;
        int year = date.Year;
        int month = date.Month;
        int day = date.Day;
        DateTime today = new DateTime(year, month, day);
        if (pastday.CompareTo(today) < 0)
        {
            e.Day.IsSelectable = false;
        }
    }

    protected void btnExibirAprovacoes_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmAprovar.aspx");
    }

    protected void btnCadAgendamento_Click(object sender, EventArgs e)
    {
        if (pnlAgendamento.Visible)
        {
            pnlAgendamento.Visible = false;
        }

        else
        {
            pnlAgendamento.Visible = true;
        }
    }
}