import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/Search.dart';
import 'package:huerto_hogar/pages/presentation/about_us.dart';
import 'package:huerto_hogar/pages/presentation/order_confirmation_page.dart';

// import 'package:huerto_hogar/pages/presentation/delivery_preferences.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

  return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Huerto Hogar',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const WelcomePage(),
      //   '/login': (context) => const LoginPage()
      // },
      home: OrderConfirmationPage()

    );
  }
  }
