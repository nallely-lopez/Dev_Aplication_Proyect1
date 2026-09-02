import 'package:flutter/material.dart';

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anatomía de Flutter'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.star, color: Color.fromARGB(255, 220, 217, 65)),
            title: Text('Elemento 1', 
              style: TextStyle(color: Color.fromARGB(255, 146, 31, 199), fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Descripción del elemento 1'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.star, color: Color.fromARGB(255, 220, 217, 65)),
            title: Text('Elemento 2', 
              style: TextStyle(color: Color.fromARGB(255, 146, 31, 199), fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Descripción del elemento 2'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.star, color: Color.fromARGB(255, 220, 217, 65)),
            title: Text('Prueba 3', 
              style: TextStyle(color: Color.fromARGB(255, 146, 31, 199), fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Descripción de la prueba 3'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.star, color: Color.fromARGB(255, 220, 217, 65)),
            title: Text('Prueba 4', 
              style: TextStyle(color: Color.fromARGB(255, 146, 31, 199), fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Descripción de la prueba 4'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}