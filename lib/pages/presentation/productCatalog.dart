import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCard.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCategoryChips.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart'; 

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({Key? key}) : super(key: key);

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  // 1. Índice: El catálogo es la página principal, usualmente el índice 0.
  int _selectedIndex = 0; 

  // 2. Lista de RUTAS nombradas (DEBE ser la misma en todas las páginas con CustomNavbar)
  final List<String> _routes = const [
    '/',          // 0: Catálogo/Home
    '/catalogo',    // 1: Catalogo
    '/carrito',   // 2: Cart
    '/profile',   // 3: Profile
  ];

  // 3. Lógica de navegación del CustomNavbar: Navegar a la ruta y limpiar el historial
  void _onTabChange(int index) {
    if (_selectedIndex == index) {
      return; 
    }

    // Actualiza el estado para que el CustomNavbar resalte la pestaña correcta
    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la nueva ruta y ELIMINAR TODAS las rutas anteriores de la pila.
    // Esto es el comportamiento esperado para un Bottom Navigation Bar.
    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HuertoHogar',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        // Botón de Menú (Leading) para la página principal
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              // Lógica para abrir el menú lateral (Drawer)
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              // Navegar al carrito (sin limpiar la pila, para poder volver)
              Navigator.pushNamed(context, '/carrito'); 
            },
          ),
        ],
      ),
      
      // 4. El body ahora solo muestra el contenido del catálogo
      body: const ProductCatalogBody(), 

      // 5. BARRA DE NAVEGACIÓN
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange, // Usa la lógica de navegación por rutas
        pages: const [], // No es necesario pasar widgets si usas navegación por rutas
      ),
    );
  }
}

// WIDGET SEPARADO PARA EL CONTENIDO DEL CATÁLOGO (Sin Cambios)
class ProductCatalogBody extends StatelessWidget {
  const ProductCatalogBody({super.key});
  // ... (código del body permanece igual) ...
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barra de Búsqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Buscar productos...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Chips de Categoría
          const ProductCategoryChips(),
          
          // Lista de Productos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: const [
                ProductCard(
                  imageUrl: '', 
                  badgeText: 'OFERTA',
                  title: 'DEL CAMPO',
                  description: 'Fresas Orgánicas',
                  price: '\$4.990',
                ),

                ProductCard(
                  imageUrl: '', 
                  badgeText: 'COSECHA LOCAL',
                  title: 'COSECHA LOCAL',
                  description: 'Tomates Medallón',
                  price: '\$2.490',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}