
module sistema
open signatures  as s

-------- Modelagem dinâmica de paciente --------

-- um sintoma só aparece no tempo t + 1 se não existiu no tempo t, um sintoma por tempo
pred registrarSintoma[t, t':Tempo, p: Paciente, s: Sintoma]{
	s in p.sintomas.t' and not (s in p.sintomas.t) <=> (p.sintomas).t' = (p.sintomas).t + s
}

-- quando um sintoma desaparecer no tempo t nao pode ter aparecido outro sintoma no tempo t
pred desapareceuSintoma[t, t': Tempo, p: Paciente]{
	(p.sintomas.t + p.sintomas.t') = p.sintomas.t
}

-- sistema inicial
pred init[t:Tempo]{
	all p:Paciente |  #(p.sintomas).t = 0
}

fact traces {
	init[first]
	all pre: Tempo - last | let pos = pre.next |
		all p: Paciente, s: Sintoma | registrarSintoma[pre, pos, p, s] or desapareceuSintoma[pre, pos, p] 
}
