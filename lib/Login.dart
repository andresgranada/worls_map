import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worls_map/services/http_service.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Maps.dart';

class Login extends StatelessWidget {
  Login ();
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Iniciar sesión"),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Worls Map", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30),
                  TextFormField(decoration: InputDecoration(labelText: "Usuario"), controller: user,),
                  TextFormField(decoration: InputDecoration(labelText: "Contraseña"), obscureText: true, controller: password),
                  // SizedBox(height: 20),
                  TextButton(
                    onPressed: (){print("Click");},
                    child: Text("Registrarse"),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                      onPressed: () {
                        loggedIn(httpService, context, user.text, password.text);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50) // put the width and height you want
                      ),
                      child: Center(
                        child: Text("Entrar"),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

void loggedIn (httpService, context, user, password) {
  final LocalStorage storage = new LocalStorage('worlsApp');
  if(user == '' || password == ''){
    showShortToast("Favor llenar todos los campos");
  } else {
    httpService.login(user, password).then((value) => {
      if(value != null){
        storage.setItem('user', value),
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Maps(),
        )),
      } else {
        showShortToast("El usuario o la contraseña son incorrectos")
      }
    });
  }
}

void showShortToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIos: 2,
      backgroundColor: Colors.red,
  );
}
