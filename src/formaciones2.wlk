import vagones.*
import locomotoras.*

class Formacion {

  const vagones = []
  const locomotoras = []
  var estaOrganizada = true

  method estaOrganizada() = estaOrganizada

  method agregarVagon(vagon) {
    if (vagones.size() > 0 and vagones.last().cantidadMaximaDePasajeros() == 0 and vagon.cantidadMaximaDePasajeros() > 0) {
      estaOrganizada = false
    }
    vagones.add(vagon)
  }

  method agregarLocomotora(locomotora) {
    locomotoras.add(locomotora)
  }

  method cantidadMaximaDePasajeros() {
    return vagones.sum({ unVagon => unVagon.cantidadMaximaDePasajeros() })
  }

  method cantidadVagonesPopulares() = vagones.count({ unVagon => unVagon.cantidadMaximaDePasajeros() > 50 })

  method formacionCargera() = vagones.all({ unVagon => unVagon.cantidadMaximaDeCarga() > 1000 })

  method dispersionDePeso() = (vagones.max({ unVagon => unVagon.pesoMaximo() }) - vagones.min({ unVagon => unVagon.pesoMaximo() }))

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

  method velocidadMaxima() = locomotoras.min({ unaLocomotora => unaLocomotora.velocidadMaxima() }).velocidadMaxima()

  method esEficiente() = locomotoras.all({ unaLocomotora => unaLocomotora.esEficiente() })

  method puedeMoverse() = locomotoras.sum({ unaLocomotora => unaLocomotora.pesoArrastre() }) >= (locomotoras.sum({ unaLocomotora => unaLocomotora.peso() }) + vagones.sum({ unVagon => unVagon.pesoMaximo() }))

  method kilosDeEmpujeFaltantes() = (locomotoras.sum({ unaLocomotora => unaLocomotora.peso() }) + vagones.sum({ unVagon => unVagon.pesoMaximo() }) - locomotoras.sum({ unaLocomotora => unaLocomotora.pesoArrastre() })).max(0)

}

