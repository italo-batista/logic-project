// COMENTE QUALQUER ALTERAÇÃO/INSERÇÃO ADICIONADA A ESTE ARQUIVO

module sistema

sig Sistema {
	medicos : set Medico,
	pacientes : set Paciente, 
	gerentes : set Gerente,
	suporte: one Suporte,
	cadastros: set Cadatro
}

sig Medico {
	cadastro : one Cadastro,
	pacientes : some Paciente // cada medico deve possuir pelo menos um paciente
}

sig Paciente {
	cadastro : one Cadastro,
	sintomas : set Sintoma
}

sig Gerente {
}

sig Suporte {
	email: one Email,
	telefone: one Telefone
}

sig Cadastro {	
		nome: one Nome,
		nascimento: one Nascimento,
		email: one Email,
		senha: one Senha
}

sig Nome {}

sig Nascimento {}

sig Email {}

sig Senha {}

sig Telefone {}

abstract sig Sintoma {
}

sig Febre extends Sintoma {
}

sig DorMuscular extends Sintoma {
}

sig GargantaInflamada extends Sintoma {
}

sig Cansaco extends Sintoma {
}


-------- Funções ---------

// paciente informa sintoma (o novo sintoma é adicionado aos seus sintomas
fun InformarSintoma [p:Paciente]: Sintoma {
	p.sintomas
}


-------- Fatos (restrições) ---------

// o sistema possui exatamente dois gerentes
fact QntMedicos {
	all s : Sistema | #(s.gerentes) = 2
}


// cada médico tem até 3 pacientes
fact QntPacientes {
	all m : Medico | #(m.pacientes) <= 3
}



pred show[] {
}

run show
