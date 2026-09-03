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
          padding: const EdgeInsets.all(16.0), // Margen exterior respecto a los bordes de la pantalla
          child: Card(
            elevation: 8, // Sombra que genera el efecto flotante
            shape: RoundedRectangleBorder( // Forma de la tarjeta
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
              ),
            child: const Padding(
                padding: EdgeInsets.all(20.0), // Margen interno de la tarjeta
               child: Column(
                  mainAxisSize: MainAxisSize.min, // La tarjeta solo ocupa el alto que necesita
                  children: [
                    Text('Aquí irá la cabecera con el avatar'),
                  ],
               ),
            ),
          ),
        ),
      ),
    );
  }
}