import alumnos.*
import materias.*

class Carrera {
	
	const property materiasDeCarrera = #{}
	
	method carreraContieneMateria(materia) {
		return self.materiasDeCarrera().contains(materia)
	}
}
