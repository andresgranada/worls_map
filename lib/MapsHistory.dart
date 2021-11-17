import 'package:flutter/material.dart';
import 'package:worls_map/Models/Map.dart';
import 'package:worls_map/services/http_service.dart';
import 'package:localstorage/localstorage.dart';

import 'DrawerClass.dart';

class MapsHistory extends StatelessWidget {
  MapsHistory({Key key}) : super(key: key);
  final HttpService httpService = HttpService();
  final LocalStorage storage = LocalStorage('worlsApp');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de mapas"),
      ),
      drawer: DrawerClass(),
      body: Center(
        child: FutureBuilder(
          future: httpService.getMapsByUserHistorial(storage.getItem('user')),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Map2> maps = snapshot.data;
              return ListView.builder(
                  itemCount: maps.length,
                  itemBuilder: (BuildContext context, int index) {
                    final map = maps[index];
                    return Card(
                        child: Padding(
                            padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0, bottom: 25.0),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Image.network(map.URL_Imagen),
                                    SizedBox(height: 15),
                                    Text(map.Titulo, style: TextStyle(
                                        fontSize: 25
                                    )),
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
