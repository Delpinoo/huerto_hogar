import 'package:flutter/material.dart';
// Importamos el CustomNavbar
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 
// No necesitamos CachedNetworkImage aquí, ya que usamos Image.asset

void main() {
  runApp(const SearchApp());
}

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Usamos la versión Stateful para la navegación
      home: const SearchScreen(), 
      theme: ThemeData(
        primaryColor: Colors.green[800],
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.green[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.green[800],
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.green[800],
            fontSize: 16,
          ),
          titleMedium: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// 1. CONVERTIR A STATEFULWIDGET
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Estado para la barra de navegación
  int _selectedIndex = 1; // Asume que 'Categories' (o búsqueda) es el índice 1

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Lógica de navegación real (ej. Navigator) iría aquí.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda de Productos'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green[800]),
          onPressed: () {
            // Lógica para retroceder
          },
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(context),
          _buildFilterChips(context),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              childAspectRatio: 0.7,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                _buildProductCard(
                  'Organico',
                  'Caja de tomates',
                  'assets/images/cajatomates.png',
                  '\$1.000 Pesos',
                ),
                _buildProductCard(
                  'Local',
                  'Tomate Cherry',
                  'assets/images/tomatecherry.png',
                  '\$1.000 Pesos',
                ),
                _buildProductCard(
                  'Organico',
                  'Tomate Roma',
                  'assets/images/tomateroma.png',
                  '\$1.000 Pesos',
                ),
                _buildProductCard(
                  'Local',
                  'Tomate Beefsteak',
                  'assets/images/tomatebeefsteak.jpg',
                  '\$1.000 Pesos',
                ),
              ],
            ),
          ),
        ],
      ),
      // 2. REEMPLAZAR EL BottomNavigationBar ESTÁNDAR POR CUSTOMNAVBAR
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], // Debe llenarse con los widgets de las páginas principales
      ),
    );
  }

  // Los métodos auxiliares se mantienen dentro de _SearchScreenState

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.green[800]),
          hintText: 'Tomates, Lechuga, Zanahorias...',
          hintStyle: TextStyle(color: Colors.green[800]),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildChip('Todo', isSelected: true),
          const SizedBox(width: 8),
          _buildChip('Frutas'),
          const SizedBox(width: 8),
          _buildChip('Verduras'),
          const Spacer(),
          const Icon(Icons.filter_list, color: Colors.grey),
          const SizedBox(width: 4),
          const Text('Filtros', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false}) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green[800],
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isSelected ? Colors.green[800] : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: isSelected
            ? BorderSide.none
            : BorderSide(color: Colors.grey[300]!),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  // El _buildProductCard se mantiene con Image.asset, ya que no presenta riesgo ANR.
  Widget _buildProductCard(
      String category, String name, String imageUrl, String price) {
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.green[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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