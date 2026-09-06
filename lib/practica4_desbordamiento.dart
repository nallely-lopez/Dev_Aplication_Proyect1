import 'package:flutter/material.dart';

class Desbordamiento extends StatelessWidget {
  const Desbordamiento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solución de Overflow',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'Zona 1: 300px',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.amber,
            child: const Center(
              child: Text(
                'Zona 2: 300px',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.deepOrange,
            child: const Center(
              child: Text(
                'Zona 3: 300px',
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
