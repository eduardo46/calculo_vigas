import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:calculo_vigas/widgets/nomenclatura_w.dart';
import 'package:calculo_vigas/widgets/lista_vigas.dart';
import 'package:calculo_vigas/widgets/lista_saved_vigas.dart';
import 'package:calculo_vigas/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListaVigas(),
    NomenclaturaWidget(),
    ListaVigasGuardadas(),
    LoginScreen()
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
            textColor: Colors.green,
            title: 'Nomenclatura',
            icon: Icon(Icons.functions),
          ),
          FancyItem(
            textColor: Colors.red,
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
