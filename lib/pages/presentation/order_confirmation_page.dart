import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/order_confirmated.dart';
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/delivery_details.dart';
// Importa tu widget de navegación
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  int _selectedIndex = 0;

  // Lista de widgets (páginas) que se mostrarán al cambiar de pestaña.
  // IMPORTANTE: Reemplaza estos Center widgets con tus páginas reales.
  final List<Widget> _pages = const [
    // Primera página: tu página de confirmación actual
    SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 90),
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 10),
            Text(
              'Gracias, René!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Tu orden fue confirmada!',
              style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
            ),
            SizedBox(height: 30),
            Total(),
            SizedBox(height: 30),
            DetallesDeliveryCard(
              tiempoEstimadoDelivery: 'Mañana, 10 AM - 12 PM',
              direccionEnvio: '123 Calle Falsa, Ciudad',
            ),
          ],
        ),
      ),
    ),
    // Ejemplo de cambio de pantalla por el navbar
    // Segunda página: un placeholder para la búsqueda
    Center(child: Text('Página de Búsqueda')),
    // Tercera página: un placeholder para el carrito
    Center(child: Text('Página del Carrito')),
    // Cuarta página: un placeholder para el perfil
    Center(child: Text('Página de Perfil')),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: _pages[_selectedIndex], // Muestra la página de la lista según el índice seleccionado.
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: _pages, // Aunque no se usa en el widget, lo pasamos para mantener la firma del constructor.
      ),
    );
  }
}