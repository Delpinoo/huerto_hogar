import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Wave_design.dart/wave.dart';
import 'package:huerto_hogar/pages/widgets/login/login_email.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 247, 221),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            CircleAvatar(
              radius: 80, // Imagen mucho más grande
              backgroundImage: const NetworkImage('https://thumbs.dreamstime.com/b/casa-con-el-logotipo-de-la-hoja-verde-dise%C3%B1o-huerto-hogar-granja-logo-icono-ecol%C3%B3gica-292979555.jpg'),
            ),

            const SizedBox(height: 20),

            const Text(
              'Huerto Hogar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),


            const Text(
              "Iniciar sesion",
              style: TextStyle(
                fontSize: 19,
                color: Colors.black54
              ),
            ),

            
            LoginFormEmail(),


            const Spacer(),
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
