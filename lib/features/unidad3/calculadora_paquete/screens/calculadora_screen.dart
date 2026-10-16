import 'package:flutter/material.dart';
import 'package:mi_paquete_mat/mi_paquete_mat.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora básica')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final resultado = CalculadoraBasica.sumar(10, 5);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('El resultado de la suma es $resultado'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Sumar 10 + 5'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final resultado = CalculadoraBasica.restar(10, 5);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('El resultado de la resta es $resultado'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Restar 10 - 5'),
            ),
          ],
        ),
      ),
    );
  }
}
