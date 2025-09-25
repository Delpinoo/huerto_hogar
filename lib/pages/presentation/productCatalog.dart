import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCard.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCategoryChips.dart';

// ⚠️ WIDGETS TEMPORALES para las otras 3 páginas (necesarios para la navegación)
// Si no quieres crear archivos para ellos, déjalos aquí:
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Página de Búsqueda'));
}
class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Página de Carrito'));
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Página de Perfil'));
}

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({Key? key}) : super(key: key);

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  int _selectedIndex = 0;

  // 1. LISTA DE PÁGINAS: Debe tener 4 elementos para coincidir con el Navbar.
  final List<Widget> _pages = const [
    ProductCatalogBody(), // Índice 0: El contenido del Catálogo
    SearchPage(),         // Índice 1
    CartPage(),           // Índice 2
    ProfilePage(),        // Índice 3
  ];
  
  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      
      // 2. EL CUERPO MUESTRA LA PÁGINA SELECCIONADA
      // Aquí es donde el estado _selectedIndex funciona correctamente:
      body: _pages[_selectedIndex], 

      // 3. BARRA DE NAVEGACIÓN
      // Pasamos una lista vacía para satisfacer el constructor (si es requerido)
      // pero el body ya no depende de esta propiedad.
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], // <--- MANTENEMOS ESTA LÍNEA PARA NO ROMPER EL CONSTRUCTOR
      ),
    );
  }
}

// 4. WIDGET SEPARADO PARA EL CONTENIDO DEL CATÁLOGO
class ProductCatalogBody extends StatelessWidget {
  const ProductCatalogBody({super.key});

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
          
          // Lista de Productos (Asegúrate que el ProductCard use un placeholder y no Image.network)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: const [
                ProductCard(
                  imageUrl: '', // Valor dummy
                  badgeText: 'OFERTA',
                  title: 'DEL CAMPO',
                  description: 'Fresas Orgánicas',
                  price: '\$4.990',
                ),

                ProductCard(
                  imageUrl: '', // Valor dummy
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