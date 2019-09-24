import alumnos.*
import carreras.*

class Materia {
	
	var property otorgaCreditos
	var property estudiantesAnotados
	const property listaDeEspera = []
	var property requisito = nada
	var property anio 
	
	
	method cumpleRequisito(alumno) {
		return requisito.cumpleRequisito(alumno)
	}
}

class Correlativa {
	
	const property listaDeCorrelativas = #{}
	
	method cumpleRequisito(alumno) {
		return listaDeCorrelativas.all({materia=>alumno.materiasAprobadas().contains(materia)})
	}
	
}

class Credito {

	var property creditosNecesarios = 0
	
	method cumpleRequisito(alumno) {
		return (alumno.creditos() >= creditosNecesarios)
	}
}

class Anio {

	var property anio
	
	method cumpleRequisito(alumno) {
		return {materia=>materia.anio()}
	}
}

object nada {	
	
	method cumpleRequisito(alumno) {return true}
	
}
