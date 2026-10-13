class Pack{
    method duracion() // en dias
    method precioBase() = 50000
    method costosBeneficios()
    method beneficios()
    method coordinador()
    method precioFinal(){
        return self.precioBase() + self.costosBeneficios()
    }
}

class ViajeNacional inherits Pack{
    const provinciaDestino
    const actividades = ["Cabalgata", "Trecking"]
    method destino() = provinciaDestino
    method actividades() = actividades

}

class ViajeInternaiconal inherits Pack{
    const paisDestino
    const escalas
    method paisDestino() = paisDestino
    method cantidadDeEscalas() = escalas
    method esLugarDeInteres()
    override method precioFinal(){
        return super() * 1.2 
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
        return (self.cantidadViajesRealizados() > 20) and self.guiaCalificado() or self.asistenteCalificado()
    }
    method guiaCalificado(){
        return rol == "Guia" and self.estaMotivado()
    }
    method asistenteCalificado(){
        return rol == "Asistente logistico" and (self.añosDeExperiencia() > 3)
    }
    
}

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