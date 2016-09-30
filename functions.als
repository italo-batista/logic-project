
module sistema
open signatures  as s

-------- Funções ---------

fun pacientesDoMedico[m:Medico]: set Paciente {
	m.pacientes
}

fun sintomasDoPaciente[p: Paciente, t: Tempo]: set Sintoma {
	p.sintomas.t
}

fun doencasDoPaciente[p: Paciente, t: Tempo]: set Doenca {
	p.doencas.t
}
