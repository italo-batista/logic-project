
-- Testes


-------- Asserts ---------

open signatures
open functions
open constraints

assert pacienteDoente {
	!some p:Paciente |
		(Doenca in p.doencas && ( (Cansaco !in p.sintomas) or (DorMuscular !in p.sintomas) )  )
	// não existe um paciente tal que ele está doente e não sente cansaço ou dor muscular
}

check pacienteDoente
