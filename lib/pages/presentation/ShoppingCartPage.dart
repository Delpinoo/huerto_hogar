import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';

// *** IMPORTACIÓN NECESARIA PARA RESOLVER EL ERROR DE NAVEGACIÓN ***
// Asegúrate de que esta ruta sea correcta en tu estructura de carpetas
import 'package:huerto_hogar/pages/presentation/order_confirmation_page.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  // Estado para la barra de navegación. 'Cart' es la tercera pestaña (índice 2)
  int _selectedIndex = 2;

  // Mapeo de índices a las rutas definidas en tu MaterialApp (SearchApp en este caso)
  final List<String> _routes = const [
    '/', // 0: Home (WelcomePage)
    '/search', // 1: Search
    '/carrito', // 2: Cart (ShoppingCartPage)
    '/profile', // 3: Profile (UserProfilePage)
  ];

  void _onTabChange(int index) {
    if (_selectedIndex == index) {
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushNamedAndRemoveUntil(
      context,
      _routes[index],
      (route) => false,
    );
  }

  // Lista de productos del carrito con datos simulados
  final List<Map<String, dynamic>> _cartItems = [
    // ... (Lista de productos) ...
    {
      'Nombre': 'Manzanas organicas',
      'Cantidad': 2,
      'Peso': '1 kg',
      'Precio': 4500,
      'imageUrl':
          'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?q=80&w=1994&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'Nombre': 'Espinacas Frescas',
      'Cantidad': 1,
      'Peso': '500 g',
      'Precio': 3000,
      'imageUrl':
          'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?q=80&w=1994&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'Nombre': 'Tomates Rojos',
      'Cantidad': 3,
      'Peso': '1 kg',
      'Precio': 2000,
      'imageUrl':
          'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?q=80&w=1994&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Calculo de precios simulado
    double subtotal = _cartItems.fold(
      0,
      (sum, item) => sum + (item['Precio'] * item['Cantidad']),
    );
    const double shipping = 3500;
    const double promotion = 1800;
    double total = subtotal + shipping - promotion;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Tu Carrito',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BotonAtras(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._cartItems.map((item) => _buildCartItem(item)).toList(),
                const SizedBox(height: 20),

                _buildSummaryCard(subtotal, shipping, promotion, total),
                const SizedBox(height: 100),
              ],
            ),
          ),

          // Botón 'Proceed to Checkout' fijo en la parte inferior
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                // Lógica de navegación a la ruta que ya definiste en main.dart
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderConfirmationPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C7B42), // Verde oscuro
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Proceder al Pago',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [],
      ),
    );
  }

  // --- MÉTODOS AUXILIARES (Omitidos por brevedad) ---

  Widget _buildCartItem(Map<String, dynamic> item) {
    // ... (implementación de _buildCartItem) ...
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // IMAGEN: Usando CachedNetworkImage
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: item['imageUrl'],
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  width: 70,
                  height: 70,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => const SizedBox(
                  width: 70,
                  height: 70,
                  child: Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // DETALLES DEL PRODUCTO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['Nombre'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${item['Peso']} | \$${item['Precio']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),

            // CONTROLES DE CANTIDAD
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Lógica para decrementar cantidad
                  },
                ),
                Text(
                  item['Cantidad'].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Color(0xFF4C7B42),
                  ), // Verde oscuro
                  onPressed: () {
                    // Lógica para incrementar cantidad
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    double subtotal,
    double shipping,
    double promotion,
    double total,
  ) {
    // ... (implementación de _buildSummaryCard) ...
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSummaryRow(
                  'Subtotal',
                  '\$${subtotal.toStringAsFixed(0)}',
                  Colors.black,
                ),
                _buildSummaryRow(
                  'Envío',
                  '\$${shipping.toStringAsFixed(0)}',
                  Colors.black,
                ),
                _buildSummaryRow(
                  'Promoción',
                  '-\$${promotion.toStringAsFixed(0)}',
                  Colors.orange,
                ),
                const Divider(),
                _buildSummaryRow(
                  'Total',
                  '\$${total.toStringAsFixed(0)}',
                  const Color(0xFF4C7B42),
                  isTotal: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    Color valueColor, {
    bool isTotal = false,
  }) {
    // ... (implementación de _buildSummaryRow) ...
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 20 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
