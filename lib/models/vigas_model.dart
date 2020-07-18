class DatosVigas {
  String tiulo;
  String subtitulo;
  String imageURL;
  String vigaImport;

  DatosVigas({this.tiulo, this.subtitulo, this.imageURL, this.vigaImport});
}

List<DatosVigas> datosvigass = [
  DatosVigas(
      tiulo: 'Viga Simple',
      subtitulo: 'Con Carga Uniformente Distribuida',
      imageURL: 'assets/images/DIAGRAMA1.svg',
      vigaImport: 'package:calculo_vigas/widgets/viga_widget.dart')
];
