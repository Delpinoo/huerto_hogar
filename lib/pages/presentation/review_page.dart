import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/review_products/review.dart';
import 'package:huerto_hogar/pages/widgets/review_products/review_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Importa el paquete GNav

class ReviewProductPage extends StatefulWidget {
  const ReviewProductPage({super.key});

  @override
  _ReviewProductPageState createState() => _ReviewProductPageState();
}

class _ReviewProductPageState extends State<ReviewProductPage> {
  int _selectedIndex = 0; // Índice de la página actual

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Aquí iría tu lógica de navegación a otras páginas.
    // Por ejemplo:
    // if (index == 0) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reseñas de productos',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Califica tu compra!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Widget de calificación y caja de texto
            const RatingReview(),
            const SizedBox(height: 20),
            const Text(
              'Reviews anteriores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Las tarjetas de reseña
            const ReviewCard(),
            const ReviewCard(),
          ],
        ),
      ),
      // Aquí está el BottomNavigationBar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            backgroundColor: Colors.white,
            color: Colors.grey,
            activeColor: Colors.green,
            tabBackgroundColor: Colors.green.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}