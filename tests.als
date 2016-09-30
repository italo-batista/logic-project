
open signatures  as s
open functions
open constraints

-- Testes

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

-- checa se é possível ter mais que dois erros
assert quantidadeDeErros{
	all t: Tempo | #(Suporte.erroInformado.t) <= 2
}

-- checa se é possível solucionar o erro
assert adicionouExcluiu{
	not some t: Tempo | (#(Suporte.erroInformado.t) > 2 &&  #(Suporte.erroInformado.last) = 2)
}

-- checa se é possível solucionar todos os erros
assert tudoSolucionado{
	not some t: Tempo | (#(Suporte.erroInformado.t) > 2 &&  #(Suporte.erroInformado.last) = 0)
}

-- nenhum medico foi cadastrado por mais de um gerente
assert medicoDuplamenteCadastrado {
	all m:Medico | one g1:Gerente | all g2:(Gerente-g1) | all t:Tempo | m in g1.cadastrou.t && m !in g2.cadastrou.t 
}

assert medicoNaoOrfao {
	all m:Medico | some g:Gerente | all t:Tempo | m in g.cadastrou.t
}

-------- Checks ---------

--check pacienteDengue

--check pacienteGripe

--check pacienteVirose

--check quantidadeDeErros

--check adicionouExcluiu

--check tudoSolucionado

--check medicoDuplamenteCadastrado
 
--check medicoNaoOrfao

--check medicoCadastradoUmaVez
