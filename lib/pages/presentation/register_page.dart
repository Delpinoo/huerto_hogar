import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/register/register_button.dart';
import 'package:huerto_hogar/pages/widgets/register/register_form.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3FCE9), // Fondo verde clarito
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.local_florist,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 10),

              // Título
              const Text(
                "HuertoHogar",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 5),

              // Subtítulo
              const Text(
                "Crear una cuenta",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 30),

              // Formulario de registro (inputs)
              const RegisterForm(),

              const SizedBox(height: 25),

              // Botón Sign Up
              const RegisterButton(),

              const SizedBox(height: 20),

              // Texto inferior con link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Aquí navegas al login
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}