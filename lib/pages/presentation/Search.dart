import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/ShoppingCartPage.dart';
import 'package:huerto_hogar/pages/presentation/UserProfilePage.dart';
import 'package:huerto_hogar/pages/presentation/welcome_page.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart'; 
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

// --- WIDGET DE EJEMPLO PARA LAS OTRAS PESTAÑAS (DEBE EXISTIR EN TUS RUTAS) ---
class DummyHomePage extends StatelessWidget {
  const DummyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home/Catálogo')),
      body: const Center(child: Text('Página Principal')),
      // Nota: Aquí también se colocaría el CustomNavbar
    );
  }
}

class DummyCartPage extends StatelessWidget {
  const DummyCartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: const Center(child: Text('Carrito')),
      // Nota: Aquí también se colocaría el CustomNavbar
    );
  }
}

class DummyProfilePage extends StatelessWidget {
  const DummyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: const Center(child: Text('Perfil de Usuario')),
      // Nota: Aquí también se colocaría el CustomNavbar
    );
  }
}


// --- 1. CLASE PRINCIPAL (SearchApp) MODIFICADA PARA USAR RUTAS ---

void main() {
  // Aseguramos que la aplicación inicie con una estructura de rutas.
  runApp(const SearchApp());
}

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huerto Hogar',

      // 1. Definimos las rutas que vamos a usar en la CustomNavbar
      routes: {
        '/': (context) => const WelcomePage(),      
        '/search': (context) => const SearchScreen(), 
        '/carrito': (context) => const ShoppingCartPage(),  
        '/profile': (context) => const UserProfilePage(),  
      },
      initialRoute: '/', 
      
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


// --- 2. SEARCH SCREEN CON LÓGICA DE NAVIGATOR ---

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Estado para la barra de navegación. Se inicializa en 1 (Search)
  int _selectedIndex = 1; 

  // Mapeo de índices a rutas
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
    
    // 1. Actualizar el estado para que la pestaña se ilumine
    setState(() {
      _selectedIndex = index;
    });

    // 2. Navegar a la nueva ruta y limpiar la pila para que no quede la página anterior.
    // Esto es ideal para la navegación principal de la barra.
    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, // Remueve todas las rutas anteriores
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda de Productos'),
        centerTitle: true,
        // Usamos el widget BotonAtras
        leading: const BotonAtras(),
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
      // 3. IMPLEMENTACIÓN DEL CUSTOMNAVBAR con la lógica de navegación
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange, // Aquí se ejecuta la navegación
        pages: const [], 
      ),
    );
  }

  // --- MÉTODOS AUXILIARES (Sin Cambios) ---

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