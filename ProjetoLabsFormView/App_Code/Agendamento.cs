using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Agendamento
{
    public Agendamento()
    {

    }

    public bool cadastrarAgendamento(DateTime data,
                                     int horario,
                                     int laboratorio,
                                     int disciplina)
    {
        using (DataClassesDataContext db = new DataClassesDataContext())
        {
            tb_Agendamento novoAgendamento = new tb_Agendamento();

            novoAgendamento.id_usuario = Sessao.UsuarioLogado;
            novoAgendamento.id_Horario = horario;
            novoAgendamento.id_laboratorio = laboratorio;
            novoAgendamento.id_Status_Agendamento = 1;
            novoAgendamento.id_Disciplina = disciplina;
            novoAgendamento.dt_agendamento = data;

            db.tb_Agendamentos.InsertOnSubmit(novoAgendamento);
            db.SubmitChanges();

            return true;

        }
    }
}