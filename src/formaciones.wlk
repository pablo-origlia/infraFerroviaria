import vagones.*

class Formacion {

  const property vagones = []
  var estaOrganizada = true

  method estaOrganizada() = estaOrganizada

  method agregarVagon(vagon) {
    if (vagones.size() > 0 and vagones.last().cantidadMaximaDePasajeros() == 0 and vagon.cantidadMaximaDePasajeros() > 0) {
      estaOrganizada = false
    }
    vagones.add(vagon)
  }

  method cantidadMaximaDePasajeros() = vagones.sum({ unVagon => unVagon.cantidadMaximaDePasajeros() })

  method cantidadVagonesPopulares() = vagones.count({ unVagon => unVagon.cantidadMaximaDePasajeros() > 50 })

  method formacionCargera() = vagones.all({ unVagon => unVagon.cantidadMaximaDeCarga() > 1000 })

  method dispersionDePeso() = (vagones.max({ unVagon => unVagon.pesoMaximo() }).pesoMaximo() - vagones.min({ unVagon => unVagon.pesoMaximo() }).pesoMaximo())

  method cantidadDeBanios() = vagones.count({ unVagon => unVagon.conBanio() })

  method hacerMantenimiento() {
    vagones.forEach({ unVagon => unVagon.hacerMantenimiento()})
  }

  method estaEquilibrada() {
    const vagonesConPasajeros = vagones.filter({ unVagon => unVagon.cantidadMaximaDePasajeros() > 0 })
    return ( vagonesConPasajeros.max({ unVagon => unVagon.cantidadMaximaDePasajeros() }).cantidadMaximaDePasajeros() - vagonesConPasajeros.min({ unVagon => unVagon.cantidadMaximaDePasajeros() }).cantidadMaximaDePasajeros()
    ) < 20
  }

  method cantidadVagonesConPasajeros() = vagones.count({ unVagon => unVagon.cantidadMaximaDePasajeros() > 0 })

}

