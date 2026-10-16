import 'package:flutter/material.dart';

import 'features/unidad3/enClase/widgetPer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'FlutterGram',

      home: const Dimensiones(),
    );
  }
}
