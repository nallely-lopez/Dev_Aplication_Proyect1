import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pantalla_registro.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _matriculaController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _iniciarSesion() {
    String matricula = _matriculaController.text.trim();
    String password = _passwordController.text.trim();

    if (matricula.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor completa la matrícula y la contraseña'),
          backgroundColor: Colors.black87,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (matricula.length != 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La matrícula debe tener exactamente 8 dígitos'),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PantallaRegistro()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // CONTAINER 1: Barra superior morada
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              color: Colors.deepPurple,
              child: const Center(
                child: Text(
                  'Acceso al Sistema',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // CONTAINER 2: Sección central con campos de entrada
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: _matriculaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Matrícula (8 dígitos)',
                        prefixIcon: Icon(Icons.badge, color: Colors.deepPurple),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // CONTAINER 3: Zona inferior con botones en extremos
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PantallaRegistro(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.person_add,
                      color: Colors.deepPurple,
                    ),
                    label: const Text(
                      'Registrar',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepPurple),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _iniciarSesion,
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    label: const Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
