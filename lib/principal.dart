import 'package:flutter/material.dart'; // Importación de herramientas de Material Desing

//Se le pone el nombre de la clase a la pantalla principal, en este caso PantallaPrincipal
class PantallaPrincipal extends StatefulWidget { // El StatefulWidget significa que es una pantalla que tiene la capacidad de cambiar su estado, es decir, que puede actualizarse a sí misma cuando cambian los datos que muestra
  const PantallaPrincipal({super.key});//Identificador único de la pantalla, que se utiliza para diferenciarla de otras pantallas en la aplicación

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState(); //Conecta el nombre de la clase con el estado de la pantalla, que es donde se define cómo se ve y cómo se comporta la pantalla
}

class _PantallaPrincipalState extends State<PantallaPrincipal> { //Clase que define el estado de la pantalla principal, es decir, cómo se ve y cómo se comporta la pantalla
  @override
  Widget build(BuildContext context) { //Método que construye la interfaz de usuario de la pantalla principal, es decir, cómo se ve y cómo se comporta la pantalla
    return Scaffold( // Scaffold es un widget que proporciona una estructura básica para la pantalla, como una barra de navegación, un cuerpo y un pie de página
      // Aquí iremos agregando las piezas del Scaffold
    );
  }
}