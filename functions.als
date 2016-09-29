
module sistema
open signatures  as s

-------- Funções ---------

fun pacientesDoMedico[m:Medico]: set Paciente {
	m.pacientes
}
