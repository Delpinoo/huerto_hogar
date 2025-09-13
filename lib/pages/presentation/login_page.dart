import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/login/login_email.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            LoginFormEmail(),
          ],
        ),
      ),
    );
  }
}
