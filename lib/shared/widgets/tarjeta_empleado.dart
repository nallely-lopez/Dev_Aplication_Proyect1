import 'package:flutter/material.dart';

class TarjetaEmpleado extends StatelessWidget {
  final String nombre;
  final Color colorFondo;

  const TarjetaEmpleado({
    super.key,
    required this.nombre,
    this.colorFondo = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Card(
        color: colorFondo,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person, size: 32),
              ),
              const SizedBox(height: 12),
              Text(
                nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
