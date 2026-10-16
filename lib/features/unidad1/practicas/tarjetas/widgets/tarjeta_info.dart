import 'package:flutter/material.dart';

class TarjetaInfo extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color colorAcento;
  final String textoBoton;
  final VoidCallback onAccion; 

  const TarjetaInfo({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.colorAcento,
    required this.textoBoton,
    required this.onAccion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FILA SUPERIOR: Icono + Textos informativos
            Row(
              children: [
                // Contenedor decorativo circular para el icono
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorAcento.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icono, color: colorAcento, size: 32),
                ),
                const SizedBox(width: 16),
                // Textos expandidos para evitar desbordamientos horizontales
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitulo,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double
                  .infinity, // El botón ocupará todo el ancho de la tarjeta
              child: ElevatedButton.icon(
                onPressed: onAccion,
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
                label: Text(
                  textoBoton,
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorAcento,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
