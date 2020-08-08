import 'package:flutter/material.dart';

class Viga {
  String valorw;
  String valorl;
  String valorc;
  String valorr;
  String valorx;
  double valore;
  String valorvx;
  String valormmax;
  String valormx;
  String valordmax;
  String valordx;

  Viga(
      {this.valorw = '',
      this.valorl = '',
      this.valorc = '',
      this.valordmax = '',
      this.valordx = '',
      this.valormmax = '',
      this.valormx = '',
      this.valorr = '',
      this.valorvx = '',
      this.valorx = '',
      this.valore = 9.8});

  Widget vigax(Function calculo, borrar) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (v) => valorw = v,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Valor de w',
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (v) => valorl = v,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Valor de l',
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => calculo(0),
                          padding: EdgeInsets.all(15.0),
                          color: Colors.blue,
                          child: Text(
                            'Calcular',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(valorc),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: 50,
              child: Center(
                  child: IconButton(
                onPressed: borrar,
                icon: Icon(
                  Icons.clear,
                  size: 30.0,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget vigaz(Function calculo, borrar) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (v) => valorw = v,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Valor de w',
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (v) => valorl = v,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Valor de l',
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (v) => valorx = v,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Valor de x',
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => calculo(),
                          padding: EdgeInsets.all(15.0),
                          color: Colors.blue,
                          child: Text(
                            'Calcular',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(valorc),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: 50,
              child: Center(
                  child: IconButton(
                onPressed: borrar,
                icon: Icon(
                  Icons.clear,
                  size: 30.0,
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget agregarwidget(int index, Function onDelete, calcular) {
    switch (index) {
      case 0:
        return vigax(calcular, onDelete);
        break;
      case 1:
        return vigax(calcular, onDelete);
        break;
      case 2:
        return vigaz(calcular, onDelete);
        break;
      case 3:
        return vigax(calcular, onDelete);
        break;
      case 4:
        return vigaz(calcular, onDelete);
        break;
      case 5:
        return vigaz(calcular, onDelete);
        break;
      case 6:
        return vigaz(calcular, onDelete);
        break;
      default:
        return Container(width: 0.0, height: 0.0);
    }
  }

  void calcular(int index) {
    switch (index) {
      case 0:
        valorc = (int.parse(valorl) * int.parse(valorw)).toString();
        break;
      case 1:
        valorr = ((int.parse(valorl) * int.parse(valorw)) / 2).toString();
        break;
      case 2:
        valorvx =
            (int.parse(valorw) * ((int.parse(valorl) / 2) - int.parse(valorx)))
                .toString();
        break;
      case 3:
        valormmax =
            ((int.parse(valorl) * (int.parse(valorw) ^ 2)) / 8).toString();
        break;
      case 4:
        valormx = (((int.parse(valorl) * int.parse(valorx)) / 2) *
                (int.parse(valorl) - int.parse(valorx)))
            .toString();
        break;
      case 5:
        valordmax = ((5 * (int.parse(valorw) * (int.parse(valorl) ^ 4))) /
                (304 * valore))
            .toString();
        break;
      case 6:
        valordx = (((int.parse(valorx) * int.parse(valorw)) / 24 * valore) *
                ((int.parse(valorl) ^ 3) -
                    (2 * int.parse(valorl) * (int.parse(valorx) ^ 2) +
                        (int.parse(valorx) ^ 3))))
            .toString();
        break;
    }
  }
}
