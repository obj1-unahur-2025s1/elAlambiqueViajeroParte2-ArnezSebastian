object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    //var rapido = true
    const rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    //var patente = "AB123JK"
    const patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    //method patenteValida() = patente.head() == "A"
    method patenteValida() = patente == "AB123JK"
    method velocidad() = 100
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    //var gangsters = 7
    const gangsters = ["Jose", "Fernando", "Joaquin", "Charly", "Pancho", "Milei", "Orlando"] //43 en total
    //var cantidadDeGangsters = gangsters.size()
    const cantidadDeGangsters = gangsters.size()
    //method puedeFuncionar() = gangsters.even()
    method puedeFuncionar() = not gangsters.isEmpty()
    //method rapido() = gangsters > 6
    method rapido() = cantidadDeGangsters > 6
    /*
    method desgaste(){
        gangsters = gangsters -1
    }
    */
    method desgaste() {
        if(self.puedeFuncionar()) {
            const gangsterAEliminar = gangsters.anyOne()
            //gangsters.remove(gangsterAEliminar)
            self.bajar(gangsterAEliminar)
        }
    }
    method subir(gangsterNuevo) {
        gangsters.add(gangsterNuevo)
    }
    method bajar(unGangster) {
        gangsters.remove(unGangster)
    }
    method patenteValida() = chatarra.rapido() 
    method velocidad() = gangsters.sum({gangster => gangster.length()})
}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
    method velocidad() = 80
}

object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
    method velocidad() = convertido.velocidad()
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    method rapido() = true
    //method puedeFuncionar() = not moto.rapido()
    method puedeFuncionar() = not self.rapido()
    method desgaste() { }
    method velocidad() = 50
    method patenteValida() = false
}

object centroDeInscripcion {
    //const vehiculosPendientes = #{alambiqueVeloz, antigualla, chatarra, convertible, moto}
    //const vehiculosPendientes = #{}
    const vehiculosInscriptos = []
    const vehiculosRechazados = [] 
    var ciudadSede = buenosAires
    //method vehiculosInscriptos() = vehiculosInscriptos
    /*
    method puedeCompetir(vehiculoNuevo) {
        return ciudadSede.puedeLlegar(vehiculoNuevo)
    }
    */
    /*
    method añadirVehiculo(nuevoVehiculo) {
        vehiculosPendientes.add(nuevoVehiculo)
    }
    method verificarVehiculos() {
        //if(not vehiculosInscriptos.isEmpty() && not vehiculosRechazados.isEmpty()) {
        vehiculosInscriptos.clear()
        vehiculosRechazados.clear()
        const vehiculosAInscribir = vehiculosPendientes.filter({vehiculo => ciudadSede.puedeLlegar(vehiculo)})
        const vehiculosARechazar = vehiculosPendientes.filter({vehiculo => not ciudadSede.puedeLlegar(vehiculo)})
        vehiculosInscriptos.addAll(vehiculosAInscribir)
        vehiculosRechazados.addAll(vehiculosARechazar)
    }
    */
    /*
    method recibirVehiculo(vehiculoNuevo) {
        vehiculosPendientes.add(vehiculoNuevo)
        self.verificarVehiculo(vehiculoNuevo)
    }
    method verificarVehiculo(vehiculoAVerificar) {
        if(ciudadSede.puedeLlegar(vehiculoAVerificar)) {
            vehiculosInscriptos.add(vehiculoAVerificar)
        }
        else {
            vehiculosRechazados.add(vehiculoAVerificar)
        }
    }
    
    method cambiarDeSedeA(ciudadNueva) {
        ciudadSede = ciudadNueva
        vehiculosInscriptos.clear()
        vehiculosRechazados.clear()
        //self.verificarVehiculos()
        vehiculosPendientes.forEach({unVehiculo => unVehiculo.verificarVehiculo(unVehiculo)})
    }
    */
    method verificarVehiculo(vehiculoAVerificar) {
        if(ciudadSede.puedeLlegar(vehiculoAVerificar)) {
            vehiculosInscriptos.add(vehiculoAVerificar)
        }
        else {
            vehiculosRechazados.add(vehiculoAVerificar)
        }
    }
    method cambiarDeSedeA(ciudadNueva) {
        ciudadSede = ciudadNueva
        //self.verificarVehiculos()
        const listaCompleta = vehiculosRechazados + vehiculosInscriptos
        vehiculosInscriptos.clear()
        vehiculosRechazados.clear()
        listaCompleta.forEach({vehiculo => self.verificarVehiculo(vehiculo)})
    }
    method indicarLugarADondeIr() {
        vehiculosInscriptos.forEach({vehiculo => vehiculo.desgaste()})
    }
    method identificarGanador() {
        self.indicarLugarADondeIr()
        const vehiculoGanador = vehiculosInscriptos.max({vehiculo => vehiculo.velocidad()})
        return vehiculoGanador
    } 
}

object maldadAscendente {
    method rapido() = true
    const trampas = ["bomba", "trampaParaOsos", "aceiteResbaladizo"] // cant de letras de cada palabra: 5, 14 y 17, dando 36 en total
    var combustible = 300
    //var cantidadDeTrampas = trampas.size()
    method puedeFuncionar() = self.tieneTrampas() && self.tieneCombustible()
    method tieneCombustible() = combustible >= 1
    //method tieneTrampas() = cantidadDeTrampas >= 1
    method tieneTrampas() = not trampas.isEmpty()
    method desgaste(){
        combustible = (combustible - 50).max(0)
        self.desplegarTrampas()
    }
    var velocidad = 110
    method velocidad() = velocidad
    method desplegarTrampas() {
        if(self.tieneTrampas()) {
            const trampaActual = trampas.first()
            velocidad = (velocidad - trampaActual.length()).max(0)
            trampas.remove(trampaActual)
            /*
            const trampaActual = trampas.first()
            if(trampaActual = "bomba") {
                velocidad = (velocidad - 40).max(0)
            }else if (trampaActual = "trampaParaOsos"){
                velocidad = (velocidad - 70).max(0)
            }
            else {
                velocidad = (velocidad - trampaActual.lenght()).max(0)
            }
            */
        }
    }
    method patenteValida() = false
}

object convertibleOmega {
    const posiblesVehiculos = [alambiqueVeloz, antigualla, chatarra ,convertible, moto]
    var vehiculoActual = posiblesVehiculos.first()
    /*
    method simularSer(vehiculoASimular) {
        posiblesVehiculos.findOrElse(vehiculoASimular, posiblesVehiculos.first())
    }
    method convertirEn(unVehiculo) {
        vehiculoActual = unVehiculo
    }
    */
    method convertirEnNuevoVehiculo() {
        if(posiblesVehiculos.size() > 1){
            posiblesVehiculos.remove(posiblesVehiculos.first())
            const vehiculoDisponible = posiblesVehiculos.first()
            vehiculoActual = vehiculoDisponible
        }
    }
    method puedeFuncionar() = vehiculoActual.puedeFuncionar()
    method rapido() = vehiculoActual.rapido()
    method velocidad() = vehiculoActual.velocidad()
    method patenteValida() = vehiculoActual.patenteValida()
    method desgaste() = vehiculoActual.desgaste()
}
