import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/Wave_design.dart/wave.dart';
import 'package:huerto_hogar/pages/widgets/login/login_forms.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});



  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, 
        leading: const BotonAtras()
      ),
      backgroundColor: const Color.fromARGB(255, 226, 247, 221),

      body: SingleChildScrollView( 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Image.asset(
              'assets/images/HuertoHogar.png',
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 20),

            const Text(
              'Iniciar Sesion',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

              SizedBox(
              width: 350,
              child: Text("Inicia seison para poder comprar productos en Huerto hogar",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54
              )),
            ),

            LoginForms(),

            SizedBox(height: screenHeight * 0.065),
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
    )
    );
    }
  }