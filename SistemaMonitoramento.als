
// COMENTE QUALQUER ALTERAÇÃO/INSERÇÃO ADICIONADA A ESTE ARQUIVO


module sistema


sig Sistema {
	gerentes : set Gerente
	medicos : set Medico
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
	cadastro : one Cadastro
	pacientes : some Paciente // cada medico deve possuir pelo menos um paciente
}


sig Paciente {
	cadastro : one Cadastro
	sintomas : set Sintoma
}



pred show[] {
}

run show
