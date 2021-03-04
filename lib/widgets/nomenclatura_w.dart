import 'package:flutter/material.dart';
import 'package:calculo_vigas/models/nomenclatura.dart';

class NomenclaturaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Nomenclatura",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: nomenclatura_list.length,
              itemBuilder: (BuildContext context, int index) {
                Nomenclatura nomenclatura = nomenclatura_list[index];
                return Container(
                  child: Row(children: <Widget>[
                    Container(
                      width: 50,
                      child: Center(
                        child: Text(
                          '${nomenclatura.simbolo}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text('${nomenclatura.descripcion}',
                            overflow: TextOverflow.clip))
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
