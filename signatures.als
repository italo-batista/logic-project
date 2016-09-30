
module sistema
open util/ordering[Tempo] 

-- Signatures

sig Tempo{} -- possibilita a modelagem dinâmica

sig Medico {
	pacientes : some Paciente  -- cada medico deve possuir pelo menos um paciente
}

sig Paciente {
	sintomas : set Sintoma -> Tempo,
	doencas : set Doenca -> Tempo
}

sig Gerente {
	cadastrou : set Medico -> Tempo
}

one sig Suporte {
	erroInformado: set Erro -> Tempo
}

-- sintomas
abstract sig Sintoma {}

one sig Febre extends Sintoma {}

one sig DorMuscular extends Sintoma {}

one sig GargantaInflamada extends Sintoma {}

one sig Cansaco extends Sintoma {}

one sig BolhasNaPele extends Sintoma {}

-- doenças 
abstract sig Doenca {}

one sig Dengue extends Doenca {}

one sig Catapora extends Doenca {}

one sig Gripe extends Doenca {}

-- erros
abstract sig Erro{}

one sig TelaAzul extends Erro{}

one sig SistemaLento extends Erro{}

one sig RedeInstavel extends Erro{}



