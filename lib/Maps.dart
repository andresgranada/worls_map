import 'package:flutter/material.dart';
import 'package:worls_map/Detail.dart';
import 'package:worls_map/DrawerClass.dart';
import 'package:worls_map/Models/Map.dart';
import 'package:worls_map/services/http_service.dart';

class Maps extends StatelessWidget {
  Maps({Key key}) : super(key: key);

  final HttpService httpService = HttpService();

  // httpService.getMaps();

  @override
  Widget build(BuildContext context) {
    // print(httpService.getMaps());
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas"),
        // automaticallyImplyLeading: false,
      ),
      drawer: DrawerClass(),
      body: Center(
        child: FutureBuilder(
          future: httpService.getMaps(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Map2> maps = snapshot.data;
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
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
                                        builder: (context) => Detail(map),
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
