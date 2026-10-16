import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Herramientas de API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApiTestScreen(),
    );
  }
}

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  Map<String, dynamic>? _postData;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _consumirApi() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      final response = await http.get(
        url,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        setState(() {
          _postData = jsonDecode(response.body) as Map<String, dynamic>;
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Error del servidor: Código ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Fallo de conexión: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Contenedor 1: Encabezado institucional
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              color: Colors.deepPurple,
              child: const Center(
                child: Text(
                  'Prueba de Herramientas de API',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Contenedor 2: Visualización dinámica de datos
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.deepPurple,
                        )
                      : _errorMessage != null
                      ? Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        )
                      : _postData != null
                      ? Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID: ${_postData!['id']} | UserID: ${_postData!['userId']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _postData!['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _postData!['body'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Text(
                          'Presione el botón para consultar el endpoint JSON validado en Postman.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                ),
              ),
            ),
            // Contenedor 3: Barra inferior de acciones
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _consumirApi,
                icon: const Icon(Icons.cloud_download, color: Colors.white),
                label: const Text(
                  'Consultar Endpoint JSON',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
