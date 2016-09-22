// COMENTE QUALQUER ALTERAÇÃO/INSERÇÃO ADICIONADA A ESTE ARQUIVO

module sistema

sig Sistema {
	gerentes : set Gerente,
	medicos : set Medico,
	pacientes : set Paciente
}

// medicos ou pacientes precisam de usuario e senha (cadastro) para acessar o sistema
// gerentes adicionam medicos adicionando cadastro de medicos ao sistema
// paciente se cadastram no sistema se cadastrando
sig Cadastro {	
}

sig Gerente {
}

sig Medico {
	cadastro : one Cadastro,
	pacientes : some Paciente // cada medico deve possuir pelo menos um paciente
}

sig Paciente {
	cadastro : one Cadastro,
	sintomas : set Sintoma
}

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
