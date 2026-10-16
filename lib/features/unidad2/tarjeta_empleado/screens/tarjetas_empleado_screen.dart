import 'package:flutter/material.dart';
import 'package:proyecto1_flutter_application/shared/widgets/widgets.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tarjeta de Empleado',
          style: TextStyle(color: Color.fromARGB(255, 16, 3, 56)),
        ),
      ),
      body: ListView(
        children: const [
          TarjetaEmpleado(nombre: 'Juan Pérez', colorFondo: Colors.blue),
          TarjetaEmpleado(nombre: 'María López', colorFondo: Colors.green),
          TarjetaEmpleado(nombre: 'Carlos García', colorFondo: Colors.orange),
          TarjetaEmpleado(nombre: 'Ana Martínez', colorFondo: Colors.red),
        ],
      ),
    );
  }
}
