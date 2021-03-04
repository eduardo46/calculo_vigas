class Nomenclatura {
  String simbolo;
  String descripcion;

  Nomenclatura({this.simbolo, this.descripcion});
}

// ignore: non_constant_identifier_names
List<Nomenclatura> nomenclatura_list = [
  Nomenclatura(simbolo: 'R', descripcion: 'Modulo de elasticidad (en Kgs/cm²)'),
  Nomenclatura(
      simbolo: 'I', descripcion: 'Momento de inercia en la viga (en cm)'),
  Nomenclatura(simbolo: 'Mmax', descripcion: 'Momento Maximo (en Kg, cm)'),
  Nomenclatura(
      simbolo: 'M₁',
      descripcion:
          'Momento maximo en la seccion izquierda de la viga (en kg, cm)'),
  Nomenclatura(
      simbolo: 'M₂',
      descripcion:
          'Momento maximo en la seccion derecha de la viga (en kg, cm)'),
  Nomenclatura(
      simbolo: 'M₃',
      descripcion:
          'Momento maximo positivo en la viga con las condiciones de momentos extremos conbinados (en kg, cm'),
  Nomenclatura(
      simbolo: 'Mx',
      descripcion:
          'Momento a la distancia \"x\" del extremo de la viga (en Kg, cm)'),
  Nomenclatura(simbolo: 'P', descripcion: 'Carga concentrada (en kg)'),
  Nomenclatura(
      simbolo: 'P₁',
      descripcion:
          'Carga concentrada más cercana a la reaccion izquierda (en kg)'),
  Nomenclatura(
      simbolo: 'P₂',
      descripcion:
          'Carga concentrada mas cercana a la reaccion derecha y de diferente magnitud a P (en Kg)'),
  Nomenclatura(
      simbolo: 'R',
      descripcion:
          'Reaccion extrema de la viga para cualquier condicion de carga simetrica (en Kg)'),
  Nomenclatura(
      simbolo: 'R₁',
      descripcion: 'Reaccion extrema izquierda de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'R₂',
      descripcion: 'Reaccion derecha o intermedia de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'R₃', descripcion: 'Reaccion derecha de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'V',
      descripcion:
          'Corte vertical maximo para cualquier condicion de carga simetrica (en Kg)'),
  Nomenclatura(
      simbolo: 'V₁',
      descripcion:
          'Corte vertical maximo en la seccion izquierda de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'V₂',
      descripcion:
          'Corte vertical en el punto de reaccion derecho, o a la izquierda del punto de reaccion intermedia de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'V₃',
      descripcion:
          'Corte vertical en el punto de reaccion derecho, o a la derecha del punto de reaccion intermedia de la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'Vx',
      descripcion:
          'Corte vertical a la distancia \"x\" del extremo izquierdo de la viga (en Kg)'),
  Nomenclatura(simbolo: 'W', descripcion: 'Carga total en la viga (en Kg)'),
  Nomenclatura(
      simbolo: 'a',
      descripcion: 'Distancia medida a lo largo de la viga (en cm)'),
  Nomenclatura(
      simbolo: 'b',
      descripcion:
          'Distancia medida a lo largo de la viga, la cual puede ser mayor o menor que \"a\" (en cm)'),
  Nomenclatura(
      simbolo: 'l',
      descripcion:
          'Longitud total de la viga entre los puntos de reaccion (en cm)'),
  Nomenclatura(
      simbolo: 'w',
      descripcion:
          'Carga uniformemente distribuida por unidad de longitud (Kg/cm)'),
  Nomenclatura(
      simbolo: 'w₁',
      descripcion:
          'Carga uniformemente distribuida por unidad de longitud mas cercana a la reaccion izquierda (en Kg/cm)'),
  Nomenclatura(
      simbolo: 'w₂',
      descripcion:
          'Carga uniformemente distribuida por unidad de longitud mas cercana a la reaccion derecha, y de diferente magnitud que \"w₁\" (en Kg/cm)'),
  Nomenclatura(
      simbolo: 'x',
      descripcion:
          'Cualquier distacia medida a lo largo de la viga desde la reaccion izquierda (en cm)'),
  Nomenclatura(
      simbolo: 'x₁',
      descripcion:
          'Cualquier distancia medida a lo largo de la seccion sobresaliente de la viga desde el punto de reaccion mas cercano (en cm)'),
  Nomenclatura(simbolo: '∆max', descripcion: 'Deflexion maxima (en cm)'),
  Nomenclatura(
      simbolo: 'Δa', descripcion: 'Deflexion en el punto de la carga (en cm)'),
  Nomenclatura(
      simbolo: 'Δx',
      descripcion:
          'Deflexion a la distancia \"x\" de la reaccion izquierda (en cm)'),
  Nomenclatura(
      simbolo: 'Δx₁',
      descripcion:
          'Deflexion de la seccion sobresaliente de la viga a cualquier distancia de la reaccion mas cercana (en cm)')
];
