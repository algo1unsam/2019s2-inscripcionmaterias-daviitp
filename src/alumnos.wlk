import materias.*
import carreras.*

class Alumno {
	
	const property carrerasEnCurso = #{}
	const property materiasAprobadas = #{}
	const property materiasInscriptas = #{}
	var property creditosObtenidos = 0
	const property materiasYNotas = #{}
	
	method puedeAnotarAMateria(materia) {
		return (carrerasEnCurso.any({carrera=>carrera.carreraContieneMateria(materia)}) 
			and not self.estaInscripto(materia) 
			and not self.materiaEstaAprobada(materia)
			and self.cumpleRequisitoDeMateria(materia)
		)
	}
		
	method estaInscripto(materia) {
		return self.materiasInscriptas().contains(materia) 
	}
	
	method materiaEstaAprobada(materia) {
		return self.materiasAprobadas().contains(materia)
	}
	
	method anotarAMateria(materia) {		
		if (self.puedeAnotarAMateria(materia)){ 
			materiasInscriptas.add(materia)
		}		
	}
	
	method cumpleRequisitoDeMateria(materia) {
		return materia.cumpleRequisito(self)
	}
	
	method aprobarMateria(_materia,_nota) {
		self.materiasAprobadas().add(_materia)
		self.materiasYNotas().add(new Resultado(materia = _materia, nota = _nota ))
		self.sumarCreditos(_materia)
	}
	
	method sumarCreditos(materia) {
		creditosObtenidos = creditosObtenidos + materia.otorgaCreditos()		
	}
}

class Resultado {	
	var materia
	var nota	
	}			


