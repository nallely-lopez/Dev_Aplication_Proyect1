import 'package:flutter/material.dart';

class Dimensiones extends StatelessWidget {
  const Dimensiones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anatomía de Pantalla',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'Zona 1: Altura fija (150px)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'Zona 2: Flexible (Expanded)',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.deepOrange,
            child: const Center(
              child: Text(
                'Zona 3: Altura fija (100px)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
