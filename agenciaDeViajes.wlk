class Pack{
    const duracion 
    const coordinador
    const beneficios = [traslados, seguros, accesoVIP ]
    method duracion() = duracion// en dias
    method precioBase() = 50000
    method costosBeneficios(){
        return beneficios.sum({b => b.costo()})
    }
    method beneficios() = beneficios
    method coordinador() = coordinador
    method precioFinal(){
        return self.precioBase() + self.costosBeneficios()
    }
    method esPremiun()
    method quitarBenedicio(unBeneficio){
        beneficios.remove(unBeneficio)
    }
}

class PackNacional inherits Pack{
    const provinciaDestino
    const actividades = [cabalgata, trecking]
    method destino() = provinciaDestino
    method actividades() = actividades
    override method esPremiun(){
        return self.duracion() > 10 and coordinador.esAltamenteCalificado()
    }
    
}

class PackInternaiconal inherits Pack{
    const paisDestino
    const escalas
    method paisDestino() = paisDestino
    method cantidadDeEscalas() = escalas
    method esLugarDeInteres() = false
    override method precioFinal(){
        return super() * 1.2 
    }
    override method esPremiun(){
        return self.esLugarDeInteres() and self.duracion() > 20 and self.cantidadDeEscalas() == 0
    }
}

class PackProvincial inherits PackNacional{
    const ciudadesAVisitar = []
    method ciudadesAVisitar() = ciudadesAVisitar
    override method esPremiun(){
        return (actividades.size() >= 4) and (ciudadesAVisitar.size() > 5) and beneficios.size() >=3
    }
    override method precioFinal(){
        return if (self.esPremiun()) super() * 1.05 else super()
    }
}

class Coordinador{
    const cantidadViajesRealizados = 0
    const añosDeExperiencia = 1
    const roles = ["Guia", "Asistente logistico", "Acompañante"]
    var rol = "Guia"
    method cantidadViajesRealizados() = cantidadViajesRealizados
    method estaMotivado() = true
    method añosDeExperiencia() = añosDeExperiencia
    method rol() = rol
    method cambiarRol(nuevoRol){
        if (nuevoRol == roles.any()) rol = nuevoRol else self.error("Rol Inexistente")
    }
    method esAltamenteCalificado(){
        return (self.cantidadViajesRealizados() > 20) and (self.guiaCalificado() or self.asistenteCalificado())
    }
    method guiaCalificado(){
        return rol == "Guia" and self.estaMotivado()
    }
    method asistenteCalificado(){
        return rol == "Asistente logistico" and (self.añosDeExperiencia() > 3)
    }
    
}
const juan = new Coordinador(cantidadViajesRealizados = 50, añosDeExperiencia = 3, rol = "Asistente logistico")
const packCba = new PackProvincial(provinciaDestino = "Cordoba", duracion = 10, coordinador = juan, ciudadesAVisitar = ["cruz del eje", "cordoba", "rosario"])

object traslados{
    method tipo() = "Traslados privados"
    method estaVigente() = true
    method costo() = 9000 //en pesos    
}

object accesoVIP{
    method tipo() = "Acceso a salas VIP"
    method estaVigente() = false
    method costo() = 25000 //en pesos    
}

object seguros{
    method tipo() = "Seguros adicionales"
    method estaVigente() = true
    method costo() = 12000 //en pesos    
}

object cabalgata{

}

object trecking{

}