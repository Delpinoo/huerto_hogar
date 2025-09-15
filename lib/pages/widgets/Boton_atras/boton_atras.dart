// Tu widget de Botón de volver atrás
import 'package:flutter/material.dart';

class BotonAtras extends StatelessWidget {
  const BotonAtras({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // Acá seleccionamos el icono que queremos mostrar y configuramos su color
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        // Esto sirve para vovler atras
        Navigator.pop(context);
      },
    );
  }
}