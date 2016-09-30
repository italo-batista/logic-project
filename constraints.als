
open signatures  as s
open functions


-- Restrições do Sistema


-------- Predicados -------------------

-- o sistema possui exatamente dois gerentes
pred qntGerentes[] {
	#(Gerente) = 2
}

-- não há paciente sem médico
pred pacienteSemMedico[p:Paciente] {
	#(p.~(pacientes ) ) != 0
}

-- não há medico sem gerente
pred medicoCadastrado[m:Medico, g1:Gerente, g2:Gerente, t:Tempo] {
	m in g1.cadastrou.t
	m in g1.cadastrou.t => m !in g2.cadastrou.t
}

-- o paciente está com dengue se, e somente se, possui os sintomas específicos
pred isDengue[doencas: Doenca, sintomas:Sintoma] {
	(DorMuscular in sintomas and Febre in sintomas and Cansaco in sintomas) <=> Dengue in doencas
}

-- o paciente está com gripe, se somente se, possui os sintomas específicos
pred isGripe[doencas: Doenca, sintomas:Sintoma] {
	(GargantaInflamada in sintomas and Febre in sintomas and Cansaco in sintomas) <=> Gripe in doencas
}

-- o paciente está com virose, se e somente se, está com um sintoma
pred isCatapora[doencas: Doenca, sintomas:Sintoma] {
	(BolhasNaPele in sintomas and Febre in sintomas and Cansaco in sintomas) <=> Catapora in doencas
}

pred checkDoenca[doencas: Doenca, sintomas:Sintoma] {
	isDengue[doencas, sintomas]
	isGripe[doencas, sintomas]
	isCatapora[doencas, sintomas]
}

-- se o paciente está doente, ele tem que obdecer os predicados de doenças
pred diagnostico[p:Paciente] {
	all t: Tempo | checkDoenca[doencasDoPaciente[p, t],sintomasDoPaciente[p, t]]
}


-------- Fatos (restrições) ---------

fact {

	qntGerentes[]

	-- todo médico tem até três pacientes
	all m : Medico | #(pacientesDoMedico[m]) <= 3
	
	-- nao há paciente sem médico
	all p : Paciente | pacienteSemMedico[p]

	-- todo médico foi cadastrado por um único gerente 
	all m:Medico | one g1:Gerente | all g2:(Gerente - g1) | all t:Tempo| medicoCadastrado[m, g1, g2, t]
	
	-- diagnostico de doença (ou não) de paciente
	all p:Paciente | diagnostico[p]

	-- não há mais que dois erros no sistema em um mesmo instante
	not some t: Tempo | #(Suporte.erroInformado.t) > 2 
}
