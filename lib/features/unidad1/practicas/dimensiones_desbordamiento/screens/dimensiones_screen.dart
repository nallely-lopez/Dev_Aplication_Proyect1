import 'package:flutter/material.dart';
import 'package:proyecto1_flutter_application/shared/widgets/widgets.dart';

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotonControl(
                      icono: Icons.play_arrow,
                      onPressed: () {
                        print('presionado');
                      },
                      colorFondo: const Color.fromARGB(255, 174, 178, 107),
                    ),
                    BotonControl(
                      icono: Icons.play_arrow,
                      onPressed: () {
                        print('presionado');
                      },
                      colorFondo: const Color.fromARGB(255, 56, 142, 217),
                    ),
                    BotonControl(
                      icono: Icons.play_arrow,
                      onPressed: () {
                        print('presionado');
                      },
                      colorFondo: const Color.fromARGB(255, 86, 203, 71),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  TarjetaEmpleado(
                    nombre: 'Juan Pérez',
                    colorFondo: Colors.blue,
                  ),
                  TarjetaEmpleado(
                    nombre: 'María López',
                    colorFondo: Colors.green,
                  ),
                ],
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
