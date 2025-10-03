

import 'package:flutter/material.dart';

import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

// --- WIDGET DE LA PANTALLA PRINCIPAL ---

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Estado para la barra de navegación. Se inicializa en 1 (Search)
  int _selectedIndex = 1; 

  // Mapeo de índices a rutas (4 elementos)
  final List<String> _routes = const [
    '/catalogo', // 0: Home/Catálogo
    '/search', // 1: Search
    '/carrito', // 2: Cart
    '/profile', // 3: Profile
  ];

  void _onTabChange(int index) {
    if (_selectedIndex == index) {
      return; 
    }
    
    // Si la página actual es la misma, no navegamos
    if (_routes[index] == ModalRoute.of(context)?.settings.name) {
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    // Navegar a la nueva ruta y limpiar la pila
    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, 
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF388E3C);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda de Productos', style: TextStyle(color: primaryGreen)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      
      body: const SearchScreenBody(),
      
      // *** CUSTOMNAVBAR RESTAURADA ***
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange, 
        pages: const [], 
      ),
    );
  }
}

// --- WIDGET PARA EL CUERPO (BODY) DE LA PANTALLA ---

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Paleta de colores verdes definida para consistencia.
    const Color primaryGreen = Color(0xFF388E3C); // Verde oscuro principal
    const Color lightGreen = Color(0xFFE8F5E9); // Verde claro para fondos

    return Column(
      children: [
        SearchBarWidget(primaryColor: primaryGreen, backgroundColor: lightGreen),
        FilterChipsWidget(primaryColor: primaryGreen, lightColor: lightGreen),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16.0),
            childAspectRatio: 0.7,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: [
              ProductCardWidget(
                category: 'Organico',
                name: 'Caja de tomates',
                imageUrl: 'assets/images/cajatomates.png',
                price: '\$1.000 Pesos',
                primaryColor: primaryGreen,
              ),
              ProductCardWidget(
                category: 'Local',
                name: 'Tomate Cherry',
                imageUrl: 'assets/images/tomatecherry.png',
                price: '\$1.000 Pesos',
                primaryColor: primaryGreen,
              ),
              ProductCardWidget(
                category: 'Organico',
                name: 'Tomate Roma',
                imageUrl: 'assets/images/tomateroma.png',
                price: '\$1.000 Pesos',
                primaryColor: primaryGreen,
              ),
              ProductCardWidget(
                category: 'Local',
                name: 'Tomate Beefsteak',
                imageUrl: 'assets/images/tomatebeefsteak.jpg',
                price: '\$1.000 Pesos',
                primaryColor: primaryGreen,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- WIDGET MODULARIZADO PARA LA BARRA DE BÚSQUEDA ---

class SearchBarWidget extends StatelessWidget {
  final Color primaryColor;
  final Color backgroundColor;
  const SearchBarWidget({super.key, required this.primaryColor, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: primaryColor),
          hintText: 'Tomates, Lechuga, Zanahorias...',
          hintStyle: TextStyle(color: primaryColor.withOpacity(0.7)),
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }
}

// --- WIDGET MODULARIZADO PARA LOS CHIPS DE FILTRO ---

class FilterChipsWidget extends StatelessWidget {
  final Color primaryColor;
  final Color lightColor;
  const FilterChipsWidget({super.key, required this.primaryColor, required this.lightColor});

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isSelected ? primaryColor : lightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          _buildChip('Todo', isSelected: true),
          const SizedBox(width: 8),
          _buildChip('Frutas'),
          const SizedBox(width: 8),
          _buildChip('Verduras'),
          const Spacer(),
          Icon(Icons.filter_list, color: primaryColor),
          const SizedBox(width: 4),
          Text('Filtros', style: TextStyle(color: primaryColor)),
        ],
      ),
    );
  }
}

// --- WIDGET MODULARIZADO PARA LA TARJETA DE PRODUCTO ---

class ProductCardWidget extends StatelessWidget {
  final String category;
  final String name;
  final String imageUrl;
  final String price;
  final Color primaryColor;

  const ProductCardWidget({
    super.key,
    required this.category,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 120,
                  color: Colors.grey[200],
                  child: Icon(Icons.image_not_supported, color: Colors.grey[400]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: primaryColor.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navega a la página de detalles del producto
                        Navigator.pushNamed(context, '/product-details');
                      },
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}