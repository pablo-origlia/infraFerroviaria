class VagonDePasajeros {

  const property largo
  const property ancho
  var property conBanio = false
  var property estaOrdenado = false

  method cantidadMaximaDePasajeros() {
    var cantidad = largo * if(ancho > 3){10}else{8}
    cantidad -= if(not estaOrdenado){15}else{0}
    return cantidad
  }

  method cantidadMaximaDeCarga() = if (conBanio) {
    300
  } else {
    800
  }

  method pesoMaximo() {
    return 2000 + 80 * self.cantidadMaximaDePasajeros() + self.cantidadMaximaDeCarga()
  }

  method hacerMantenimiento() {
    self.estaOrdenado(true)
  }

}

class VagonDeCarga {

  var property cargaMaximaIdeal
  var property cantidadDeMaderasSueltas = 0
  const property conBanio = false
  const property cantidadMaximaDePasajeros = 0

  method cantidadMaximaDeCarga() = cargaMaximaIdeal - 400 * cantidadDeMaderasSueltas

  method pesoMaximo() = 1500 + self.cantidadMaximaDeCarga()

  method hacerMantenimiento() {
    cantidadDeMaderasSueltas -= cantidadDeMaderasSueltas.min(2)
  }

}

class VagonDormitorio {

  var property cantidadDeCompartimientos
  var property cantidadDeCamas
  const property conBanio = true
  const property cantidadMaximaDeCarga = 1200

  method cantidadMaximaDePasajeros() = cantidadDeCompartimientos * cantidadDeCamas

  method pesoMaximo() = 4000 + (80 * self.cantidadMaximaDePasajeros()) + cantidadMaximaDeCarga

  method hacerMantenimiento() {
  }

}

