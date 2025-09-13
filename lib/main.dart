import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/login_page.dart';
import 'package:huerto_hogar/pages/presentation/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage());
  }
}