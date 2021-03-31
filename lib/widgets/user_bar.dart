import 'package:flutter/material.dart';
import 'package:calculo_vigas/screens/login_screen.dart';

class UsuarioActual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: <Widget>[
      SizedBox(height: 20.0),
      Icon(Icons.account_circle_sharp),
      Text("Sin Usuario"),
      ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginScreen())),
          child: Text("Iniciar Sesion"))
    ]));
  }
}
