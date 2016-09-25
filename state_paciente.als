

-- TODO

pred enviouDoenca[p, t, t']{
	
}

pred init[t:Tempo]{
	no (Suporte.erroInformado).t
}

fact traces {
	init[first]
	all pre: Tempo - last | let pos = pre.next |
		some p: Paciente |	surgiuErro[e, pre, pos] or erroResolvido[e, pre, pos]
}
