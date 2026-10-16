import 'package:flutter/material.dart';

class BotonControl extends StatelessWidget {
  final IconData icono;
  final VoidCallback onPressed;
  final Color colorFondo;
  const BotonControl({
    super.key,
    required this.icono,
    required this.onPressed,
    this.colorFondo = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorFondo,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(3, 3)),
          ],
        ),
        child: Icon(icono, size: 32, color: Colors.black),
      ),
    );
  }
}
