import 'package:flutter/material.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Tarjeta de Contacto',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Margen exterior respecto a los bordes
          child: Card(
            elevation: 8, // Sombra que genera el efecto flotante
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Bordes redondeados
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0), // Margen interno de la tarjeta
              child: Column(
                mainAxisSize: MainAxisSize.min, // La tarjeta solo ocupa el alto necesario
                children: [
                  // 1. Cabecera horizontal (Avatar + Nombres)
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.indigo,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nallely López',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Ing. en Sistemas Computacionales',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // 2. Línea divisoria
                  Divider(
                    height: 24,
                    thickness: 1,
                    color: Colors.grey,
                  ),

                  // 3. Fila de Correo
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 20,
                        color: Colors.indigo,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'nallelylopez@gmail.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10), // Separación vertical

                  // 4. Fila de Teléfono
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.indigo,
                      ),
                      SizedBox(width: 12),
                      Text(
                        '+52 123 456 7890',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}