
open signatures  as s
module sistema

-------- Funções ---------

fun pacientesDoMedico[m:Medico]: set Paciente {
	m.pacientes
}
