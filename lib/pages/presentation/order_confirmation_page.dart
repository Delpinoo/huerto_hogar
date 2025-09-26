import 'package:flutter/material.dart';
// Importamos los widgets locales para la confirmación
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/order_confirmated.dart'; 
import 'package:huerto_hogar/pages/widgets/orderConfirmation.dart/delivery_details.dart';
// Importamos tu widget de navegación
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  // Índice por defecto 0 (Home), ya que esta página no está en la navegación principal.
  int _selectedIndex = 0; 
  
  // Definición de las rutas principales
  final List<String> _routes = const [
    '/',          // 0: Home (WelcomePage)
    '/search',    // 1: Search
    '/carrito',   // 2: Cart (ShoppingCartPage)
    '/profile',   // 3: Profile (UserProfilePage)
  ];

  // Lógica de navegación completa
  void _onTabChange(int index) {
    if (_selectedIndex == index) {
      return; 
    }

    // 1. Actualizar el estado (opcional, ya que la página se reemplaza)
    setState(() {
      _selectedIndex = index;
    });

    // 2. Navegar a la nueva ruta y limpiar la pila de rutas (para que no se pueda volver atrás).
    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, // Remueve todas las rutas anteriores
    );
  }

  // Contenido de la página de confirmación
  final Widget _confirmationContent = SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 90),
          // Icono de confirmación
          const Icon(
            Icons.check_circle,
            color: Color(0xFF4C7B42), // Usamos un verde más coherente
            size: 100,
          ),
          const SizedBox(height: 10),
          // Título de agradecimiento
          const Text(
            '¡Gracias, René!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Mensaje de confirmación
          const Text(
            'Tu orden fue confirmada y está siendo procesada.',
            style: TextStyle(color: Color.fromARGB(255, 122, 122, 122)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          // Componente de Total (asumiendo que Total() es un widget válido)
          const Total(),
          const SizedBox(height: 30),
          // Componente de Detalles de Delivery (asumiendo que DetallesDeliveryCard() es un widget válido)
          const DetallesDeliveryCard(
            tiempoEstimadoDelivery: 'Mañana, 10 AM - 12 PM',
            direccionEnvio: '123 Calle Falsa, Ciudad',
          ),
          const SizedBox(height: 80), // Espacio para el navbar
        ],
      ),
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Confirmación de Orden', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // *** IMPORTANTE: QUITAMOS el 'leading' (flecha de retroceso)
        // en esta pantalla ya que el flujo de compra ha terminado. ***
      ),
      body: _confirmationContent, // Mostramos directamente el contenido de confirmación
      
      // Barra de navegación personalizada
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange, // Usa la lógica de pushNamedAndRemoveUntil
        pages: const [], // La lista de páginas no es necesaria aquí, ya que usamos rutas.
      ),
    );
  }
}