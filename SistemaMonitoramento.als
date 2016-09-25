// COMENTE QUALQUER ALTERAÇÃO/INSERÇÃO ADICIONADA A ESTE ARQUIVO

module sistema


sig Medico {
	pacientes : some Paciente // cada medico deve possuir pelo menos um paciente
}

sig Paciente {
	sintomas : set Sintoma
}

sig Gerente {
	cadastrou : set Medico
}

one sig Suporte {

}

abstract sig Sintoma {
}

lone sig Febre extends Sintoma {
}

lone sig DorMuscular extends Sintoma {
}

lone sig GargantaInflamada extends Sintoma {
}

lone sig Cansaco extends Sintoma {
}


-------- Funções ---------
fun pacientesDoMedico[m:Medico]: set Paciente {
	m.pacientes
}


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


-------- Fatos (restrições) ---------

fact {

	qntGerentes[]

	all m : Medico | #(pacientesDoMedico[m]) <= 3

	all p : Paciente | pacienteSemMedico[p]

	all m : Medico | one g : Gerente | medicoCadastrado[m, g]
}


-------- Asserts ---------------------------



-------- Checks ----------------------------



pred show[] {
}

run show for 5
