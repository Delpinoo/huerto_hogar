import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/Wave_design.dart/wave.dart';

class ContraOlvidada extends StatelessWidget {
  const ContraOlvidada({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BotonAtras(),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 247, 221),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08),
              Image.asset(
                'assets/images/HuertoHogar.png',
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
              ),
              SizedBox(height: screenHeight * 0.025),
              const Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.012),
              SizedBox(
                width: screenWidth * 0.9,
                child: const Text(
                  "Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: Colors.green[800]),
                    hintText: 'ejemplo@correo.com',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green[200]!, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.green[800]!, width: 2),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.green[800]),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              ElevatedButton(
                onPressed: () {
                  // Lógica para enviar el correo de recuperación
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.15,
                    vertical: screenHeight * 0.02,
                  ),
                ),
                child: const Text(
                  'Restablecer Contraseña',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.18,
                width: double.infinity,
                child: CustomPaint(
                  painter: WavePainter(const Color(0xFFC8E6C9)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}