import 'package:calculo_vigas/models/vigas/viga1.dart';
import 'package:flutter/material.dart';

typedef OnDelete();

class Vigaclass extends StatefulWidget {
  final Viga viga;
  final state = _VigaclassState();
  final OnDelete onDelete;
  final int index;
  Vigaclass({Key key, this.viga, this.onDelete, this.index}) : super(key: key);
  @override
  _VigaclassState createState() => state;
}

class _VigaclassState extends State<Vigaclass> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return widget.viga.agregarwidget(widget.index, calcular, widget.onDelete);
  }

  void calcular() {
    setState(() {
      widget.viga.calcular(widget.index);
    });
  }
}
