import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worls_map/Models/MapReserved.dart';

class DetailReserved extends StatelessWidget {
  const DetailReserved(this.map);
  final MapReserved map;

  @override
  Widget build(BuildContext context) {
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
                  Text("Fecha del préstamo:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Fecha_Prestamo, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Fecha Devolución:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Fecha_Devolucion, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Text("Estado:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(map.Estatus, style: TextStyle(fontSize: 20))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
