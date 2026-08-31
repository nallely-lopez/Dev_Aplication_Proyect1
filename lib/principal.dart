import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _ultimoEvento = 'Ninguno';

  void _incrementCounter() {
    setState(() {
      _counter++;
      _ultimoEvento = 'Botón flotante presionado (+1)';
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _ultimoEvento = 'Botón ElevatedButton presionado (-1)';
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _ultimoEvento = 'Presión prolongada: Contador a 0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra el último evento ejecutado
            Text(
              'Último evento: $_ultimoEvento',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            const Text('Veces presionado / valor actual:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),

            // Evento con ElevatedButton (onPressed)
            ElevatedButton.icon(
              onPressed: _decrementCounter,
              icon: const Icon(Icons.remove),
              label: const Text('Restar 1'),
            ),
            const SizedBox(height: 20),

            // Eventos táctiles avanzados con GestureDetector
            GestureDetector(
              onTap: () {
                setState(() {
                  _counter += 5;
                  _ultimoEvento = 'Toque simple (+5)';
                });
              },
              onDoubleTap: () {
                setState(() {
                  _counter += 10;
                  _ultimoEvento = 'Doble toque (+10)';
                });
              },
              onLongPress: _resetCounter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Caja táctil:\n• 1 Tap: +5\n• Doble Tap: +10\n• Mantener presionado: Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
      // Evento estándar del FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}