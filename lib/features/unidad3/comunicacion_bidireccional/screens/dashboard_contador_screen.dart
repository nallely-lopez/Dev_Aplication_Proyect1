import 'package:flutter/material.dart';

import 'package:proyecto1_flutter_application/shared/widgets/widgets.dart';

import '../widgets/display_resultado.dart';

class DashboardContadorScreen extends StatefulWidget {
  const DashboardContadorScreen({super.key});

  @override
  State<DashboardContadorScreen> createState() =>
      _DashboardContadorScreenState();
}

class _DashboardContadorScreenState extends State<DashboardContadorScreen> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_contador > 0) _contador--;
    });
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Contador'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DisplayResultado(contador: _contador),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotonControl(
                  icono: Icons.remove,
                  onPressed: _decrementar,
                  colorFondo: Colors.redAccent,
                ),
                const SizedBox(width: 16),
                BotonControl(
                  icono: Icons.refresh,
                  onPressed: _reiniciar,
                  colorFondo: Colors.orangeAccent,
                ),
                const SizedBox(width: 16),
                BotonControl(
                  icono: Icons.add,
                  onPressed: _incrementar,
                  colorFondo: Colors.greenAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
