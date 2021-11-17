import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worls_map/Models/Map.dart';

class Detail extends StatelessWidget {
  const Detail(this.map);
  final Map2 map;

  @override
  Widget build(BuildContext context) {
    print(map.ID);
    print("Detalle");
    return Scaffold(
      appBar: AppBar(
        title: Text(map.Titulo)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.network(map.URL_Imagen),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Título:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Titulo, style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Empresa:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Empresa, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Tipo:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Tipo, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Zona geográfica:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Zona_Geografica, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Escala:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Escala, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Disponible:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Disponible == 1 ? "Si" : "No", style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
