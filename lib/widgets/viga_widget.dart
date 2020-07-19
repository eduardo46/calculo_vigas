import 'package:flutter/material.dart';

typedef OnDelete();
typedef OnCalcular();

class Viga {
  String valorw;
  String valorl;
  String result;
  Viga({this.valorw = '', this.valorl = '', this.result = ''});
}

class Vigaclass extends StatefulWidget {
  final Viga viga;
  final state = _VigaclassState();
  final OnDelete onDelete;
  final OnCalcular onCalcular;
  final int kkk;
  Vigaclass({Key key, this.viga, this.onDelete, this.onCalcular, this.kkk})
      : super(key: key);
  @override
  _VigaclassState createState() => state;
}

class _VigaclassState extends State<Vigaclass> {
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    switch (widget.kkk) {
      case 1:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
          child: Form(
            key: form,
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
                              onChanged: (v) => widget.viga.valorw = v,
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
                              onChanged: (v) => widget.viga.valorl = v,
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
                              onPressed: () => algo(),
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
                              child: Text('C = ' + widget.viga.result),
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
                    onPressed: widget.onDelete,
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
        break;
      default:
        return null;
    }
  }

  void algo() {
    setState(() {
      widget.viga.result =
          (int.parse(widget.viga.valorl) * int.parse(widget.viga.valorw))
              .toString();
    });
  }
}
