
-- Testes

open signatures
open functions
open constraints


-------- Asserts ---------

assert pacienteDoente {
	all m:Medico | !some p:pacientesDoMedico[m] |
		(Doenca in p.doencas && ( (Cansaco !in p.sintomas) or (DorMuscular !in p.sintomas) )  )
	// não existe um paciente tal que ele está doente ou não sente cansaço ou dor muscular
}


-------- Checks ---------

check pacienteDoente
