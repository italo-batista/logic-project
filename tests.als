
-- Testes

open signatures  as s
open functions
open constraints


-------- Asserts ---------

-- se um paciente não sente Dor Muscular ou Febre ou Cansaço ele não pode ter dengue
assert pacienteDengue {
	all m:Medico, t: Tempo| !some p:pacientesDoMedico[m] |
		(Dengue in p.doencas.t &&   (  (Febre !in p.sintomas.t) or (DorMuscular !in p.sintomas.t)  or (Cansaco !in p.sintomas.t)  )   )
}

-- se um paciente não sente Garganta Inflamada ou Febre ou Cansaço ele não pode ter dengue
assert pacienteGripe {
	all m:Medico, t: Tempo| !some p:pacientesDoMedico[m] |
		(Gripe in p.doencas.t &&   (  (Febre !in p.sintomas.t) or (GargantaInflamada !in p.sintomas.t)  or (Cansaco !in p.sintomas.t)  )   )
}

-- se um paciente não sente nenhum sintoma ele não pode ter Virose
assert pacienteVirose {
	all m:Medico, t: Tempo| !some p:pacientesDoMedico[m] |
		(Virose in p.doencas.t  && #(p.sintomas.t) != 1 )
}

-- Checa se é possível ter mais que dois erros
assert quantidadeDeErros{
	all t: Tempo | #(Suporte.erroInformado.t) <= 2
}

-- Checa se é possível solucionar o erro
assert adicionouExcluiu{
	not some t: Tempo | (#(Suporte.erroInformado.t) > 2 &&  #(Suporte.erroInformado.last) = 2)
}

-- Checa se é possível solucionar todos os erros
assert tudoSolucionado{
	not some t: Tempo | (#(Suporte.erroInformado.t) > 2 &&  #(Suporte.erroInformado.last) = 0)
}


-------- Checks ---------

--check pacienteDengue

--check pacienteGripe

--check pacienteVirose

--check quantidadeDeErros

--check adicionouExcluiu

--check tudoSolucionado
 
