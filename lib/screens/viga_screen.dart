import 'dart:convert';
import 'package:calculo_vigas/models/vigas_model.dart';
import 'package:calculo_vigas/models/database_saved_vigas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class VigaScreen extends StatefulWidget {
  final DatosVigas vigasDatos;
  final int indice;
  final Map dbData;

  VigaScreen({this.vigasDatos, this.indice, this.dbData});

  @override
  _VigaScreenState createState() => _VigaScreenState();
}

class _VigaScreenState extends State<VigaScreen> {
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  Map variables = new Map();
  Parser par = Parser();
  String resultados = '';
  int _id = 0;
  var saved = false;
  Icon _fav = Icon(Icons.favorite_border);

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(widget.vigasDatos.listCalculos);
    _selectedItem = _dropdownMenuItems[0].value;
    if (widget.dbData != null) {
      resultados = widget.dbData['resultados'];
      variables = jsonDecode(widget.dbData['variables']);
      saved = true;
      _id = widget.dbData['_id'];
      _fav = Icon(Icons.favorite, color: Colors.red);
    }
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.nombre),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
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
                  tag: widget.dbData == null
                      ? widget.vigasDatos.imageURL
                      : widget.dbData['_id'],
                  child: SvgPicture.asset(
                    widget.vigasDatos.imageURL,
                    fit: BoxFit.cover,
                  ),
                )),
            // Aumentar la altura inicial de la SliverAppBar más de lo normal
            expandedHeight: MediaQuery.of(context).size.width + 100,
            actions: <Widget>[
              IconButton(
                icon: _fav,
                tooltip: 'Guardar',
                onPressed: () {
                  setState(() {
                    if (!saved) {
                      _savedb();
                      _fav = Icon(Icons.favorite, color: Colors.red);
                      saved = true;
                      print('guardado');
                    } else {
                      _deletedb();
                      _fav = Icon(Icons.favorite_border);
                      saved = false;
                      print("desguardado");
                    }
                  });
                },
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
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ListItem>(
                          hint: Text("Seleccionar Calculo"),
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value;
                              print(_selectedItem.nombre);
                            });
                          }),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: widget.vigasDatos.nomvar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: TextFormField(
                            initialValue:
                                variables[widget.vigasDatos.nomvar[index]] ==
                                        null
                                    ? ''
                                    : variables[widget.vigasDatos.nomvar[index]]
                                        .toString(),
                            keyboardType: TextInputType.number,
                            onChanged: (v) =>
                                variables[widget.vigasDatos.nomvar[index]] =
                                    double.parse(v),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  'Valor de ' + widget.vigasDatos.nomvar[index],
                            ),
                          ));
                    }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () => _calcular(),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.all(15.0)),
                    child: Text(
                      'Calcular',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      resultados,
                      style: GoogleFonts.nanumMyeongjo(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //****Revisar caso de no ingresar un campo necesitado y mande null****
  _calcular() {
    setState(() {
      resultados += _selectedItem.nombre +
          ' = ' +
          _selectedItem.formula.replaceAll(new RegExp('\\*'), '×') +
          "\n";
      Expression exp = par.parse(_selectedItem.formula);
      ContextModel cm = ContextModel();
      for (var i = 0; i < widget.vigasDatos.nomvar.length; i++) {
        Variable v = Variable(widget.vigasDatos.nomvar[i]);
        cm.bindVariable(v, Number(variables[widget.vigasDatos.nomvar[i]]));
      }
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      resultados += _selectedItem.nombre + ' = ' + eval.toString() + "\n\n";
    });
  }

  _savedb() async {
    Viga vigadb = Viga();
    vigadb.resultados = resultados;
    vigadb.fecha = DateFormat('dd-MM-yyyy').add_jm().format(DateTime.now());
    vigadb.indice = widget.indice;
    vigadb.variables = jsonEncode(variables);
    DatabaseHelper helper = DatabaseHelper.instance;
    _id = await helper.insert(vigadb);
    print('inserted row: $_id');
  }

  _deletedb() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    _id = await helper.delete(_id);
    print('deleted row: $_id');
  }
}
