import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/order_confirmated.dart';
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/delivery_details.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// Cambia a StatefulWidget para manejar el estado de la barra de navegación
class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  // Ahora puedes definir y manejar el estado del índice seleccionado
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 90),
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Gracias, René!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Tu orden fue confirmada!',
              style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
            ),
            const SizedBox(height: 30),
            const Total(), // Asegúrate de que este widget existe
            const SizedBox(height: 30),
            // Asegúrate de que este widget existe y recibe los parámetros
            const DetallesDeliveryCard(
              tiempoEstimadoDelivery: 'Mañana, 10 AM - 12 PM',
              direccionEnvio: '123 Calle Falsa, Ciudad',
            ),
          ],
        ),
      ),
      // Mueve el bottomNavigationBar aquí, ya que es una propiedad de Scaffold
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