import 'package:flutter/material.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context){

    return Column(
      children: [
        // Boton ver productos
        ElevatedButton(onPressed: () {}, 
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        ),
        child: const Text('Ver productos'),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/catalogo');
            
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.green,
            side: const BorderSide(color: Colors.green, width: 2.0),
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          ),
         child: const Text('Iniciar Sesión')
         ),
          
      ],
    );
  }
}