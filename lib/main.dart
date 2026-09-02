import 'package:flutter/material.dart';
import 'principal.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget { //Clase que define la aplicación, es decir, cómo se ve y cómo se comporta la aplicación
  const MiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaPrincipal(),
    );
  }
}