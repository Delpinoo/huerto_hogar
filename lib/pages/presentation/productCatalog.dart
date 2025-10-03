

import 'package:flutter/material.dart';

import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCard.dart';
import 'package:huerto_hogar/pages/widgets/ProductCategory/productCategoryChips.dart';

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({Key? key}) : super(key: key);

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
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

    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, 
    );
  }

  void _handleShare() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Gracias por compartir HuertoHogar!'),
        duration: Duration(seconds: 2),
      ),
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
        
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {
              Navigator.pushNamed(context, '/carrito'); 
            },
          ),
          
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onSelected: (String result) {
              switch (result) {
                case 'blog':
                  Navigator.pushNamed(context, '/blog');
                  break;
                case 'impacto':
                  Navigator.pushNamed(context, '/impacto');
                  break;
                case 'share':
                  _handleShare();
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'blog',
                child: Text('Blog'),
              ),
              const PopupMenuItem<String>(
                value: 'impacto',
                child: Text('Impacto Ambiental'),
              ),
              const PopupMenuItem<String>(
                value: 'share',
                child: Text('Compartir App'),
              ),
            ],
          ),
        ],
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50),
              ),
              child: Text(
                'Menú HuertoHogar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Blog'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/blog');
              },
            ),
            ListTile(
              leading: const Icon(Icons.spa),
              title: const Text('Impacto Ambiental'),
              onTap: () {
                Navigator.pop(context); 
                Navigator.pushNamed(context, '/impacto');
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Compartir App'),
              onTap: () {
                Navigator.pop(context); 
                _handleShare();
              },
            ),
          ],
        ),
      ),

      body: const ProductCatalogBody(), 

      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange, 
        pages: const [], 
      ),
    );
  }
}

// WIDGET SEPARADO PARA EL CONTENIDO DEL CATÁLOGO (CON NAVEGACIÓN)
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
          
          // Lista de Productos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Producto 1 con navegación
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/product-details');
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ProductCard(
                    imageUrl: 'assets/images/cultivos-de-la-huerta.jpg', 
                    badgeText: 'OFERTA',
                    title: 'DEL CAMPO',
                    description: 'Fresas Orgánicas',
                    price: '\$4.990',
                  ),
                ),

                // Producto 2 con navegación
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/product-details');
                  },
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ProductCard(
                    imageUrl: 'assets/images/cultivos-de-la-huerta.jpg', 
                    badgeText: 'COSECHA LOCAL',
                    title: 'COSECHA LOCAL',
                    description: 'Tomates Medallón',
                    price: '\$2.490',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}