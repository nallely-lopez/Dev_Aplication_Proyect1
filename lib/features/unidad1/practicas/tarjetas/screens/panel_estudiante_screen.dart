import 'package:flutter/material.dart';
import '../widgets/tarjeta_info.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  // Función utilitaria para mostrar un SnackBar dinámico según la tarjeta
  void _mostrarMensaje(BuildContext context, String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panel del Estudiante',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          // INSTANCIA 1: Promedio General (Acento Morado)
          TarjetaInfo(
            titulo: 'Promedio General',
            subtitulo: 'Calificación acumulada: 95.4 / 100',
            icono: Icons.grade,
            colorAcento: Colors.deepPurple,
            textoBoton: 'Consultar Calificaciones',
            onAccion: () {
              _mostrarMensaje(
                context,
                'Accediendo al historial de calificaciones...',
                Colors.deepPurple,
              );
            },
          ),

          // INSTANCIA 2: Semestre y Carrera (Acento Verde azulado / Teal)
          /*  TarjetaInfo(
            titulo: 'Semestre Actual',
            subtitulo: '7° Semestre - Ing. en Sistemas Computacionales',
            icono: Icons.school,
            colorAcento: Colors.teal,
            textoBoton: 'Ver Avance Reticular',
            onAccion: () {
              _mostrarMensaje(
                context,
                'Cargando avance de la retícula escolar...',
                Colors.teal,
              );
            },
          ),*/

          // INSTANCIA 3: Estado Administrativo (Acento Ámbar / Naranja)
          TarjetaInfo(
            titulo: 'Estado de Inscripción',
            subtitulo: 'Alumno regular activo - Periodo 2026-2027',
            icono: Icons.verified_user,
            colorAcento: Colors.deepOrange,
            textoBoton: 'Descargar Comprobante',
            onAccion: () {
              _mostrarMensaje(
                context,
                'Generando comprobante de reinscripción...',
                Colors.deepOrange,
              );
            },
          ),
        ],
      ),
    );
  }
}
