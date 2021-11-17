import 'dart:convert';
import 'package:worls_map/Models/Map.dart';
import 'package:http/http.dart' as http;
import 'package:worls_map/Models/MapReserved.dart';

class HttpService {
  final String urlService = "http://192.168.1.13/mapoteca";

  Future<List<Map2>> getMaps() async {
    http.Response res = await http.get(urlService+"/crud/mapas/obtener_mapas.php");

    List<dynamic> body = jsonDecode(res.body);

    List<Map2> maps = body.map((dynamic item) => Map2.fromJson(item)).toList();

    return maps;
  }

  Future<List<MapReserved>> getMapsByUser(int idUser) async {
    print(idUser);
    http.Response res = await http.get(urlService+"/crud/mapas/mapas_usuario.php?id="+idUser.toString());

    List<dynamic> body = jsonDecode(res.body);

    List<MapReserved> maps = body.map((dynamic item) => MapReserved.fromJson(item)).toList();

    return maps;
  }

  Future<List<Map2>> getMapsByUserHistorial(int idUser) async {
    http.Response res = await http.get(urlService+"/crud/usuarios/historial_usuario.php?id="+idUser.toString());

    List<dynamic> body = jsonDecode(res.body);
    List<Map2> maps = body.map((dynamic item) => Map2.fromJson(item)).toList();

    return maps;
  }

  Future<int> login(user, password) async {
    final response = await http.post(
      Uri.parse(urlService+"/crud/usuarios/loginUsuario.php"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user': user,
        'password': password,
      }),
    );

    if (response.body == "false") {
      return null;
    } else {
      return Map2.fromJson(jsonDecode(response.body)).ID;
    }

    print(response.body);
    // print(Map2.fromJson(jsonDecode(response.body)));

  }

}