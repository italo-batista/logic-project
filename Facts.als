-------- Fatos (restrições) ---------

// o sistema possui exatamente dois gerentes
fact QntMedicos {
	all s : Sistema | #(s.gerentes) = 2
}


// cada médico tem até 3 pacientes
fact QntPacientes {
	all m : Medico | #(m.pacientes) <= 3
}
