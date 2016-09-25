

module sistema

open signatures as s

-- Controla o surgimento de novos erros
pred surgiuErro[e: Erro, t, t': Tempo]{
	(Suporte.erroInformado).t' = (Suporte.erroInformado). t + e
}

pred erroResolvido[e: Erro, t, t': Tempo]{
	e in Suporte.erroInformado.t
	(Suporte.erroInformado).t' = (Suporte.erroInformado).t - e
}

pred init[t:Tempo]{
	no (Suporte.erroInformado).t
}

fact traces {
	init[first]
	all pre: Tempo - last | let pos = pre.next |
		some e: Erro |	surgiuErro[e, pre, pos] or erroResolvido[e, pre, pos]
}


--pred show[]{}

-- run show for 5

-- Checa se é possível ter mais que dois erros
assert quantidadeDeErros{
	not some t: Tempo | #Suporte.erroInformado.t > 2 
}

-- Checa se é possível solucionar o erro
assert adicionouExcluiu{
	not some t: Tempo | (#Suporte.erroInformado.t > 2 &&  #Suporte.erroInformado.last = 2)
}

-- Checa se é solucionar todos os erros
assert tudoSolucionado{
	not some t: Tempo | (#Suporte.erroInformado.t > 2 &&  #Suporte.erroInformado.last = 0)
}

check tudoSolucionado for 7

