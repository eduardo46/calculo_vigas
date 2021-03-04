import 'package:calculo_vigas/screens/viga_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculo_vigas/models/vigas_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calculo_vigas/models/database_saved_vigas.dart';

DatabaseHelper helper = DatabaseHelper.instance;

class ListaVigasGuardadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Expanded(
            child: FutureBuilder(
              future: helper.queryVigas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      DatosVigas datosvigas =
                          datosvigass[snapshot.data[index]['indice']];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VigaScreen(
                                      vigasDatos: datosvigas,
                                      resultado: snapshot.data[index]
                                          ['resultados'],
                                    ))),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                              height: 170,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    150.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        //Titulo
                                        Container(
                                          width: 120.0,
                                          child: Text(
                                            datosvigas.tiulo,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      datosvigas.subtitulo,
                                      style: TextStyle(
                                          fontSize: 17.0, color: Colors.grey),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      snapshot.data[index]['fecha'],
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40.0,
                              top: 15.0,
                              bottom: 15.0,
                              child: Hero(
                                tag: datosvigas.imageURL,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: SvgPicture.asset(
                                    datosvigas.imageURL,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Container(
                    alignment: AlignmentDirectional.center,
                    child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
/* */