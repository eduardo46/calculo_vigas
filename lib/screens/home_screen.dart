import 'package:calculo_vigas/screens/viga_screen.dart';
import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculo_vigas/models/vigas_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calculo_vigas/models/nomenclatura.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget _buildlistavigas() {
  return SafeArea(
    child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            itemCount: datosvigass.length,
            itemBuilder: (BuildContext context, int index) {
              DatosVigas datosvigas = datosvigass[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VigaScreen(
                              vigasDatos: datosvigas,
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
                        padding: EdgeInsets.fromLTRB(150.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              datosvigas.subtitulo,
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Hero(
                          tag: 'diagrama',
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
          ),
        ),
      ],
    ),
  );
}

Widget _buildnomenclatura() {
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

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    _buildlistavigas(),
    _buildnomenclatura(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.brown)
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: FancyBottomBar(
        type: FancyType.FancyV1, // Fancy Bar Type
        items: [
          FancyItem(
            textColor: Colors.orange,
            title: 'Vigas',
            icon: Icon(Icons.home),
          ),
          FancyItem(
            textColor: Colors.red,
            title: 'Nomenclatura',
            icon: Icon(Icons.functions),
          ),
          FancyItem(
            textColor: Colors.green,
            title: 'Guardados',
            icon: Icon(Icons.favorite),
          ),
          FancyItem(
            textColor: Colors.brown,
            title: 'Cuenta',
            icon: Icon(Icons.account_circle),
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
