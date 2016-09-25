
-- Signatures

module sistema

open util/ordering[Tempo] 

sig Tempo{}

sig Medico {
	pacientes : some Paciente  -- cada medico deve possuir pelo menos um paciente
}

sig Paciente {
	sintomas : set Sintoma,
	doencas : lone Doenca
}

abstract sig Sintoma {
}

one sig Febre extends Sintoma {
}

one sig DorMuscular extends Sintoma {
}

one sig GargantaInflamada extends Sintoma {
}

one sig Cansaco extends Sintoma {
}

one sig Doenca {
}

sig Gerente {
	cadastrou : set Medico
}

one sig Suporte {
	erroInformado: set Erro -> Tempo
}

abstract sig Erro{}

one sig telaAzul extends Erro{}

one sig sistemaLento extends Erro{}

one sig redeInstavel extends Erro{}



