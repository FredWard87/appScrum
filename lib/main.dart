import 'package:flutter/material.dart';
import 'list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Scrum Elements',
            style: TextStyle(
              color: Colors.deepPurpleAccent, // Color del texto
              fontSize: 26.0, // Tamaño del texto
              fontWeight: FontWeight.bold, // Negrita
            ),
          ),
          centerTitle: true, // Centrar el título
          backgroundColor: Colors.purpleAccent, // Color de fondo
          elevation: 0, // Eliminar sombra
        ),
        body: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: JsonListViewScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
