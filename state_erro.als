
module sistema
open signatures as s


-------- Modelagem dinâmica de erro --------

-- surgimento de novos erros
pred surgiuErro[e: Erro, t, t': Tempo] {
	(Suporte.erroInformado).t' = (Suporte.erroInformado). t + e
}

-- manutenção de erros 
pred erroResolvido[e: Erro, t, t': Tempo] {
	e in Suporte.erroInformado.t
	(Suporte.erroInformado).t' = (Suporte.erroInformado).t - e
}

-- no início do sistema não há erros
pred init[t:Tempo]{
	no (Suporte.erroInformado).t
}

fact traces {
	init[first]
	all pre: Tempo - last | let pos = pre.next |
		some e: Erro |	surgiuErro[e, pre, pos] or erroResolvido[e, pre, pos]
}



