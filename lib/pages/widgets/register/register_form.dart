import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  // Función privada para construir cada campo de texto
  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTextField(
          hint: "Email",
          icon: Icons.email_outlined,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          hint: "Password",
          icon: Icons.lock_outline,
          obscure: true,
        ),
        const SizedBox(height: 15),
        _buildTextField(
          hint: "Confirm Password",
          icon: Icons.lock_reset,
          obscure: true,
        ),
      ],
    );
  }
}