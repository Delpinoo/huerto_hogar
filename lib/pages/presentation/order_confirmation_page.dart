import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/order_confirmated.dart'; 
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/delivery_details.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  int _selectedIndex = 0; 
  
  final List<String> _routes = const [
    '/',
    '/search',
    '/carrito',
    '/profile',
  ];

  void _onTabChange(int index) {
    if (_selectedIndex == index) {
      return; 
    }
    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Confirmación de Orden', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              const Icon(
                Icons.check_circle,
                color: Color(0xFF4C7B42),
                size: 100,
              ),
              const SizedBox(height: 10),
              const Text(
                '¡Gracias, René!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Tu orden fue confirmada y está siendo procesada.',
                style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Total(),
              const SizedBox(height: 30),
              const DetallesDeliveryCard(
                tiempoEstimadoDelivery: 'Mañana, 10 AM - 12 PM',
                direccionEnvio: '123 Calle Falsa, Ciudad',
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/ordertracking');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C7B42),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Seguir Pedido',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [],
      ),
    );
  }
}