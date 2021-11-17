import 'package:flutter/material.dart';

import 'Login.dart';
import 'Maps.dart';
import 'MapsHistory.dart';
import 'MapsReserved.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass ();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text('Worls Map', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ),
          ListTile(
            title: const Text('Mapas'),
            onTap: () {
              selectedItem(context, 0);
            },
          ),
          ListTile(
            title: const Text('Mapas reservados'),
            onTap: () {
              selectedItem(context, 1);
            },
          ),
          ListTile(
            title: const Text('Historial de mapas'),
            onTap: () {
              selectedItem(context, 2);
            },
          ),
          ListTile(
            title: const Text('Cerrar sesión'),
            onTap: () {
              selectedItem(context, 3);
            },
          ),
        ],
      ),
    );
  }
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Maps(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MapsReserved(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MapsHistory(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login(),
      ));
      break;
  }
}
