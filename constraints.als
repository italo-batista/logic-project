
-- Restrições do Sistema

open signatures
open functions

-------- Predicados -------------------

-- o sistema possui exatamente dois gerentes
pred qntGerentes[] {
	#(Gerente) = 2
}

-- não há paciente sem médico
pred pacienteSemMedico[p:Paciente] {
	#(p.~(pacientes ) ) != 0
}

-- todo médico foi cadastrado por um gerente
pred medicoCadastrado[m:Medico, g:Gerente] {
	m in g.cadastrou
}

-- o paciente está com dengue, se somente se, possui os sintomas específicos
pred isDengue[doencas: Doenca, sintomas:Sintoma] {
	(DorMuscular in sintomas and Febre in sintomas and Cansaco in sintomas) <=> Dengue in doencas
}

-- o paciente está com gripe, se somente se, possui os sintomas específicos
pred isGripe[doencas: Doenca, sintomas:Sintoma] {
	(GargantaInflamada in sintomas and Febre in sintomas and Cansaco in sintomas) <=> Gripe in doencas
}

-- o paciente está com virose, se e somente se, está com um sintoma
pred isVirose[doencas: Doenca, sintomas:Sintoma] {
	(#sintomas = 1 ) <=> Virose in doencas
}

pred checkDoenca[doencas: Doenca, sintomas:Sintoma] {
	isDengue[doencas, sintomas]
	isGripe[doencas, sintomas]
	isVirose[doencas, sintomas]
}

// se o paciente está doente tem que obdecer os predicados de doenças
pred doente [p:Paciente] {
	all t: Tempo | checkDoenca[p.doencas.t, p.sintomas.t] 
}

-------- Fatos (restrições) ---------

fact {

	qntGerentes[]

	-- todo médico o intem até três pacientes
	all m : Medico | #(pacientesDoMedico[m]) <= 3
	
	-- nao há paciente sem médico
	all p : Paciente | pacienteSemMedico[p]
	
	-- não há medico sem gerente
	all m : Medico | one g : Gerente | medicoCadastrado[m, g]
	
	-- condições de doença
	all p:Paciente | doente[p]

}
