
-- Restrições do Sistema

open signatures
open functions

-------- Predicados -------------------

// o sistema possui exatamente dois gerentes
pred qntGerentes[] {
	#(Gerente) = 2
}

// não há paciente sem médico
pred pacienteSemMedico[p:Paciente] {
	#(p.~(pacientes ) ) != 0
}

// Todo médico foi cadastrado por um gerente
pred medicoCadastrado[m:Medico, g:Gerente] {
	m in g.cadastrou
}

pred teste [p:Paciente] {
	(Doenca in (p.doencas)) implies	( (Cansaco in p.sintomas) && (DorMuscular in p.sintomas) )
	--(Doenca !in (p.doencas)) implies	( (Cansaco !in p.sintomas) && (DorMuscular !in p.sintomas) )
}

-------- Fatos (restrições) ---------

fact {

	qntGerentes[]

	// todo médico o intem até três pacientes
	--all m : Medico | #(pacientesDoMedico[m]) <= 3

--	all p : Paciente | pacienteSemMedico[p]

	all m : Medico | one g : Gerente | medicoCadastrado[m, g]

	all p:Paciente | teste[p]

}
