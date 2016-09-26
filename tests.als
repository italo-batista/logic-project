
-- Testes

open signatures
open functions
open constraints


-------- Asserts ---------

assert pacienteDoente {
	all m:Medico, t: Tempo| !some p:pacientesDoMedico[m] |
		(Doenca in p.doencas.t && ( (Cansaco !in p.sintomas.t) or (DorMuscular !in p.sintomas.t) )  )
	// não existe um paciente tal que ele está doente ou não sente cansaço ou dor muscular
}


-- Checa se é possível ter mais que dois erros
assert quantidadeDeErros{
	not some t: Tempo | #Suporte.erroInformado.t > 2 
}

-- Checa se é possível solucionar o erro
assert adicionouExcluiu{
	not some t: Tempo | (#Suporte.erroInformado.t > 2 &&  #Suporte.erroInformado.last = 2)
}

-- Checa se é possível solucionar todos os erros
assert tudoSolucionado{
	not some t: Tempo | (#Suporte.erroInformado.t > 2 &&  #Suporte.erroInformado.last = 0)
}

-------- Checks ---------

check pacienteDoente
