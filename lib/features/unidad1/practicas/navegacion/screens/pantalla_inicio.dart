import 'package:flutter/material.dart';

import 'pantalla_detalle.dart';

// Pantalla A: Origen que captura y envía el parámetro
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    super.dispose();
  }

  void _enviarDatos() {
    String nombre = _nombreController.text.trim();
    String apellido = _apellidoController.text.trim();

    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa un nombre válido'),
          backgroundColor: Colors.black87,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (apellido.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa un nombre válido'),
          backgroundColor: Colors.black87,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PantallaDetalle(nombreUsuario: nombre, apellidoUsuario: apellido),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantalla A: Inicio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Ingresa tu nombre',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _apellidoController,
              decoration: const InputDecoration(
                labelText: 'Ingresa tu apellido',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviarDatos,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Enviar a Pantalla B',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
