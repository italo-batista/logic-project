
module sistema
open signatures  as s
open constraints as c


-------- Modelagem dinâmica de medico --------

-- se um medico foi cadastrado uma vez por um gerente em um tempo t, ele nao pode ser cadastrado novamentepor outro gerente em um novo tempo
pred cadastradoUmaVez[t,t':Tempo, m:Medico, g:Gerente] {
	m in g.cadastrou.t && m in g.cadastrou.t'
}

-- sistema inicial

pred init[t:Tempo]{
	//	no Medico
}

fact traces {

	init[first]

	all pre: Tempo - last | let pos = pre.next |
		all m:Medico | some g:Gerente | cadastradoUmaVez[pre,pos,m,g]
}
