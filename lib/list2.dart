import 'dart:convert';
import 'package:flutter/material.dart';
import 'item.dart'; 

class JsonListViewScreen2 extends StatefulWidget {
  const JsonListViewScreen2({Key? key}) : super(key: key);

  @override
  _JsonListViewScreenState2 createState() => _JsonListViewScreenState2();
}

class _JsonListViewScreenState2 extends State<JsonListViewScreen2> {
  late Future<List<ScrumItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = loadItems();
  }

  Future<List<ScrumItem>> loadItems() async {
    try {
      String jsonString =
          await DefaultAssetBundle.of(context).loadString('assets/data_scrum.json');
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((item) => ScrumItem.fromJson(item)).toList();
    } catch (e) {
      debugPrint('Error cargando el archivo JSON: $e');
      throw Exception('No se pudieron cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Uso de archivos JSON',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 200, 0, 255),
      ),
      body: FutureBuilder<List<ScrumItem>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 166, 0, 255)),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Color.fromARGB(255, 255, 0, 230)),
              ),
            );
          } else {
            List<ScrumItem>? items = snapshot.data;
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Aquí puedes agregar la acción que deseas realizar
                    print('Elemento presionado: ${items[index].name}');
                  },
                  child: Card(
                    color: Colors.orange[50],
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(
                        items[index].name,
                        style: TextStyle(color: Color.fromARGB(255, 255, 0, 157)),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
