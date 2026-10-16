import 'package:flutter/material.dart';

class DisplayResultado extends StatelessWidget {
  final int contador;

  const DisplayResultado({super.key, required this.contador});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 4),
        boxShadow: const [
          BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Text(
        '$contador',
        style: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
