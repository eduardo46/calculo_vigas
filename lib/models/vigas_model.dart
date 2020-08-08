class DatosVigas {
  String tiulo;
  String subtitulo;
  String imageURL;
  List<String> nombreCalculos;
  DatosVigas({this.tiulo, this.subtitulo, this.imageURL, this.nombreCalculos});
}

List<DatosVigas> datosvigass = [
  DatosVigas(
    tiulo: 'Viga Simple',
    subtitulo: 'Con Carga Uniformente Distribuida',
    imageURL: 'assets/images/DIAGRAMA1.svg',
    nombreCalculos: [
      'C',
      'R',
      'Vx',
      'Max (en el centro)',
      'Mx',
      'ΔMax (En el centro)'
    ],
  )
];
