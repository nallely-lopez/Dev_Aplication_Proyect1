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
      appBar: AppBar( // AppBar es un widget que proporciona una barra de navegación en la parte superior de la pantalla
        title: const Text('Anatomía del Scaffold'), // Título de la barra de navegación
        backgroundColor: Colors.teal, // Color de fondo de la barra de navegación
        foregroundColor: const Color.fromARGB(255, 255, 255, 255), // Color del texto de la barra de navegación
      ),

      body: const Center( // Center es un widget que centra su hijo en la pantalla
        child: Column( // Column es un widget que organiza a sus hijos en una columna vertical
          mainAxisAlignment: MainAxisAlignment.center, // mainAxisAlignment es una propiedad que define cómo se alinean los hijos en el eje principal de la columna, en este caso, se alinean al centro
          children: [ // children es una propiedad que define los hijos de la columna, en este caso, son un icono y dos textos
            Icon(Icons.widgets, size: 80, color: Colors.teal), // Icon es un widget que muestra un icono, en este caso, el icono de widgets, con un tamaño de 80 y un color de teal
            SizedBox(height: 20), // SizedBox es un widget que crea un espacio vacío con un tamaño específico, en este caso, un espacio de 20 de alto
            Text( // Text es un widget que muestra un texto, en este caso, el texto
              'Este es el BODY',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // style es una propiedad que define el estilo del texto, en este caso, un tamaño de 24 y un peso de negrita
            ),
            Text('Aqui va el contenido principal de la pantalla.'), // Text es un widget que muestra un texto, en este caso, el texto
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton( // FloatingActionButton es un widget que muestra un botón flotante en la pantalla, que se utiliza para realizar una acción principal
        onPressed: () { // onPressed es una propiedad que define la acción que se realiza cuando se presiona el botón flotante
          print('¡Hiciste clic en el FAB!'); // print es una función que muestra un mensaje en la consola, en este caso, el mensaje
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white), // Icon es un widget que muestra un icono, en este caso, el icono de add, con un color de blanco
      ),

      bottomNavigationBar: BottomNavigationBar( // BottomNavigationBar es un widget que muestra una barra de navegación en la parte inferior de la pantalla, que se utiliza para navegar entre diferentes pantallas
        currentIndex: 0,// currentIndex es una propiedad que define el índice del icono seleccionado en la barra de navegación, en este caso, el primer icono
        backgroundColor: Colors.teal, // Color de fondo de la barra de navegación 
        items: const [ // items es una propiedad que define los iconos de la barra de navegación, en este caso, son dos iconos
          BottomNavigationBarItem( // BottomNavigationBarItem es un widget que define un icono de la barra de navegación, en este caso, el icono de inicio
            icon: Icon(Icons.home),// Icon es un widget que muestra un icono, en este caso, el icono de home
            label: 'Inicio', // label es una propiedad que define el texto que se muestra debajo del icono, en este caso, el texto de Inicio
          ),
          BottomNavigationBarItem( //  icono de perfil
            icon: Icon(Icons.person), // Icon es un widget que muestra un icono, en este caso, el icono de person
            label: 'Perfil', // label es una propiedad que define el texto que se muestra debajo del icono, en este caso, el texto de Perfil
          ),
        ],
        onTap: (indice) { // onTap es una propiedad que define la acción que se realiza cuando se presiona un icono de la barra de navegación, en este caso, se muestra un mensaje en la consola con el índice del icono presionado
          print('Tocaste el icono número: $indice'); // print es una función que muestra un mensaje en la consola, en este caso, el mensaje con el índice del icono presionado
        },
      ),
    );
  }
}