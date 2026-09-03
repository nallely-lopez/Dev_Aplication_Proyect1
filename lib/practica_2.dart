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
      body: const Center(
        child: Text('Aquí irá la tarjeta'),
      ),
    );
  }
}