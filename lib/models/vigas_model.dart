class DatosVigas {
  String tiulo;
  String subtitulo;
  String imageURL;
  List<String> nomvar;
  List<ListItem> listCalculos;
  DatosVigas(
      {this.tiulo,
      this.subtitulo,
      this.imageURL,
      this.listCalculos,
      this.nomvar});
}

class ListItem {
  String nombre;
  String formula;
  ListItem(this.nombre, this.formula);
}

List<DatosVigas> datosvigass = [
  DatosVigas(
      tiulo: 'Viga Simple',
      subtitulo: 'Con Carga Uniformente Distribuida',
      imageURL: 'assets/images/DIAGRAMA.svg',
      listCalculos: [
        ListItem('C', 'w*l'),
        ListItem('R', '(w*l)/2'),
        ListItem('Vx', 'w*((l/2)-x)'),
        ListItem('Max (en el centro)', '(w*l^2)/8'),
        ListItem('Mx', '((w*x)/2)-(l-x)'),
        ListItem('ΔMax (En el centro)', '(5*w*(l^4))/(364*(E*I))'),
        ListItem('Δx', '((w*x)/(24*E*I))*((l^3)-(2*l*(x^2))+(x^3))')
      ],
      nomvar: [
        'w',
        'l',
        'x',
        'E',
        'I'
      ]),
  DatosVigas(
      tiulo: 'Viga Simple',
      subtitulo: 'Con Carga Aumentando Uniformente Hacia un Extremo',
      imageURL: 'assets/images/DIAGRAMA2.svg',
      listCalculos: [
        ListItem('C', '(16*W)/(9*√3)'),
        ListItem('R₁ = V₁', 'W/3'),
        ListItem('R₂ = V₂ max', '(2*W)/3'),
        ListItem('Vx', '(W/3)- ((W*x^2)/l^2)'),
        ListItem('M max', '((w*x)/2)-(l-x)'),
        ListItem('Mx', '((W*x)/(3*l^2))*(l^2-x^2)'),
        ListItem('Δ max', '0.01304*((W*l^3)/(E*I))'),
        ListItem('Δx', '') //Pendienteee
      ],
      nomvar: [
        'W',
        'l',
        'x',
        'E',
        'I'
      ]),
  DatosVigas(
      tiulo: 'Viga Simple',
      subtitulo: 'Con Carga Aumentando Uniformente Hacia un Centro',
      imageURL: 'assets/images/DIAGRAMA3.svg',
      listCalculos: [
        ListItem('C', '(4*W)/3'),
        ListItem('R₁ = V₁', 'W/3'),
        ListItem('R₂ = V₂ max', '(2*W)/3'),
        ListItem('Vx', '(W/3)- ((W*x^2)/l^2)'),
        ListItem('M max', '((w*x)/2)-(l-x)'),
        ListItem('Mx', '((W*x)/(3*l^2))*(l^2-x^2)'),
        ListItem('Δ max', '0.01304*((W*l^3)/(E*I))'),
        ListItem('Δx', '')
      ],
      nomvar: [
        'W',
        'l',
        'x',
        'E',
        'I'
      ])
];
