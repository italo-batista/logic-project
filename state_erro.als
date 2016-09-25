

module sistema

open signatures

pred surgiuErro[e: Erro, t, t': Tempo]{
	(Suporte.erroInformado).t' = (Suporte.erroInformado). t + e
}

pred init[t:Tempo]{
	no (Suporte.erroInformado).t
}

fact traces {
	init[first]
	all pre: Tempo - last | let pos = pre.next |
		some e: Erro |	surgiuErro[e, pre, pos]
}

