  import 'package:flutter/material.dart';
  import 'package:huerto_hogar/pages/widgets/welcome/welcome.dart';
  import 'package:huerto_hogar/pages/widgets/Wave_design.dart/wave.dart';

  class WelcomePage extends StatelessWidget {
    const WelcomePage({super.key});

    @override
    Widget build(BuildContext context) {

      final screenHeight = MediaQuery.of(context).size.height;


      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 247, 221),
        body: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 150,),
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


              SizedBox(height: screenHeight * 0.1),
              const SizedBox(height: 70,),
            // acá invocamos el widget de la wave verde que está al final abajo

                SizedBox(
                height: 150,
                width: double.infinity,
                child: CustomPaint(
                    painter: WavePainter(const Color(0xFFC8E6C9)),
                ),
              )
            ],
          ),
        ),
      );
    }
  }