import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/welcome/welcome.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 247, 221),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //aqui agrego la imagen desde la carpeta assets
            Image.asset(
              'assets/images/HuertoHogar.png',
              width: 200,
              height: 200,
              ),
            const SizedBox(height: 20,),
            //aqui va el codigo del titulo
            const Text('Bienvenido a',
            style: TextStyle(fontSize: 24,//tamaño de la fuente 
            fontWeight: FontWeight.bold, //letra en negrita
            ),
            ),
            const Text(
              'Huerto Hogar',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              ),
              // espacio entre el titulo y los elementos de abajo
              const SizedBox(height: 70,),
              // aqui llamo a los widget de botones
              const WelcomeButtons(),
          ],
        ),
      ),
    );
  }
}