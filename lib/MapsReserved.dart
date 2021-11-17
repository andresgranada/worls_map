import 'package:flutter/material.dart';
import 'package:worls_map/Models/Map.dart';
import 'package:localstorage/localstorage.dart';
import 'package:worls_map/services/http_service.dart';

import 'DetailReserved.dart';
import 'DrawerClass.dart';
import 'Models/MapReserved.dart';

class MapsReserved extends StatelessWidget {
  MapsReserved({Key key}) : super(key: key);
  final LocalStorage storage = LocalStorage('worlsApp');
  final HttpService httpService = HttpService();

  List<Map> maps = [];

  @override
  Widget build(BuildContext context) {
    // print(storage.getItem('user'));
    storage.ready.then((_) => {
      print(storage.getItem('user'))
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas reservados"),
      ),
      drawer: DrawerClass(),
      body: Center(
        child: FutureBuilder(
          future: httpService.getMapsByUser(storage.getItem('user')),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MapReserved> maps = snapshot.data;
              return ListView.builder(
                  itemCount: maps.length,
                  itemBuilder: (BuildContext context, int index) {
                    final map = maps[index];
                    return Card(
                        child: Padding(
                            padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Image.network(map.URL_Imagen),
                                    SizedBox(height: 30),
                                    Text(map.Titulo, style: TextStyle(
                                        fontSize: 25
                                    )),
                                    Transform.translate(offset: Offset(0,-110),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => DetailReserved(map),
                                              ));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(100, 50) // put the width and height you want
                                            ),
                                            child: Center(
                                              child: Text("Ver detalle"),
                                            )
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            )
                        )
                    );
                  }
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
