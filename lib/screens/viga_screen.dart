import 'package:calculo_vigas/models/viga_generator.dart';
import 'package:calculo_vigas/models/vigas/viga1.dart';
import 'package:calculo_vigas/models/vigas_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:calculo_vigas/widgets/viga_widget.dart';

class VigaScreen extends StatefulWidget {
  final DatosVigas vigasDatos;

  VigaScreen({this.vigasDatos});

  @override
  _VigaScreenState createState() => _VigaScreenState();
}

class _VigaScreenState extends State<VigaScreen> with VigaGenerator {
  List<Vigaclass> calculos = [];
  @override
  Widget build(BuildContext context) {
    Future<Null> _showList() async {
      int selected = await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            return new SimpleDialog(
              title: const Text('Selecciona una opcion'),
              children: widget.vigasDatos.nombreCalculos.map((value) {
                return new SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        widget.vigasDatos.nombreCalculos.indexOf(
                            value)); //here passing the index to be return on item selection
                  },
                  child: new Text('Calcular $value'), //item value
                );
              }).toList(),
            );
          });
      setState(() {
        if (selected != null) onAddViga(selected);
      });
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.vigasDatos.tiulo),
            // Permite al usuario revelar el app bar si comienza a desplazarse
            // hacia arriba en la lista de elementos
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: Container(
                padding: EdgeInsets.only(top: 50),
                height: MediaQuery.of(context).size.width + 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Hero(
                  tag: 'diagrama',
                  child: SvgPicture.asset(
                    widget.vigasDatos.imageURL,
                    fit: BoxFit.cover,
                  ),
                )),
            // Aumentar la altura inicial de la SliverAppBar más de lo normal
            expandedHeight: MediaQuery.of(context).size.width + 100,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite_border),
                tooltip: 'Guardar',
                onPressed: () {/* ... */},
              ),
            ],
          ),
          // A continuación, crea un SliverList
          SliverList(
            // Para ello, se utiliza un delegado para crear elementos a medida que
            // se desplazan por la pantalla.
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: FlatButton(
                    onPressed: () => _showList(),
                    padding: EdgeInsets.all(15.0),
                    color: Colors.blueGrey,
                    child: Text(
                      'Agregar Calculo',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.5,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: calculos.length,
                  itemBuilder: (_, int index) => calculos[index],
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDelete(Viga _viga) {
    setState(() {
      var find = calculos.firstWhere(
        (it) => it.viga == _viga,
        orElse: () => null,
      );
      if (find != null) calculos.removeAt(calculos.indexOf(find));
    });
  }

  void onAddViga(int index) {
    var _viga = vigaret(1);
    calculos.add(Vigaclass(
      viga: _viga,
      onDelete: () => onDelete(_viga),
      index: index,
    ));
  }
}
