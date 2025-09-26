import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/Search.dart';
import 'package:huerto_hogar/pages/presentation/ShoppingCartPage.dart';
import 'package:huerto_hogar/pages/presentation/UserProfilePage.dart';
import 'package:huerto_hogar/pages/presentation/about_us.dart';
import 'package:huerto_hogar/pages/presentation/blog.dart';
import 'package:huerto_hogar/pages/presentation/order_confirmation_page.dart';
import 'package:huerto_hogar/pages/presentation/productCatalog.dart';
import 'package:huerto_hogar/pages/presentation/review_page.dart';
import 'package:huerto_hogar/pages/presentation/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huerto Hogar',

  
      initialRoute: '/',

      routes: <String, WidgetBuilder>{
       
        '/': (context) => const WelcomePage(), // Home 
        '/catalogo': (context) => const ProductCatalogPage(), 
        '/carrito': (context) => const ShoppingCartPage(), 
        '/profile': (context) => const UserProfilePage(),
        '/blog': (context) => const BlogPage(),
        '/about-us': (context) => const AboutUs(),
        '/order-confirmation': (context) => const OrderConfirmationPage(),
        '/review-page': (context) => const ReviewProductPage(),
        
      },

      
    );
  }
}