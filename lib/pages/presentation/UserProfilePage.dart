import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Corrección ANR
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart'; 

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Estado para la barra de navegación
  // Asume que 'Profile' es la cuarta pestaña (índice 3)
  int _selectedIndex = 3; 
  final Color _primaryGreen = const Color(0xFF4C7B42); // Verde oscuro principal

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // *** Lógica de Navegación: Aquí se debe cambiar a la pantalla correspondiente ***
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Perfil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Ícono de retroceso
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        // Ícono de edición (lápiz)
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black87),
            onPressed: () {
              // Lógica para editar perfil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sección de Perfil Superior
            _buildProfileHeader(context),
            const SizedBox(height: 30),

            // Sección de Detalles de la Cuenta
            _buildSectionTitle('Detalles de la Cuenta'),
            _buildAccountDetail(Icons.email, 'Email', 'sofia.ramirezh@email.com'),
            _buildAccountDetail(Icons.phone, 'Teléfono', '+56 9 1234 5678'),
            _buildAccountDetail(Icons.location_on, 'Dirección', '123 Main Street, Santiago'),
            const SizedBox(height: 30),

            // Sección de Pedidos
            _buildSectionTitle('Pedidos'),
            _buildOrderHistory(),
            const SizedBox(height: 30),

            // Sección de Recomendaciones
            _buildSectionTitle('Recomendaciones'),
            _buildRecommendations(),
            const SizedBox(height: 80), // Espacio para el Navbar
          ],
        ),
      ),
      // CustomNavbar implementado
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], // Asegúrate de pasar la lista de widgets de las páginas aquí
      ),
    );
  }

  // --- WIDGETS AUXILIARES ---

  Widget _buildProfileHeader(BuildContext context) {
    // URL de imagen simulada para CachedNetworkImage
    const String profileImageUrl = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return Center(
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage( // Aplicando la corrección ANR
              imageUrl: profileImageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: _primaryGreen),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.person, size: 100, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sofia Ramirez',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Miembro desde 2021',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildAccountDetail(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _primaryGreen, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistory() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: Icon(Icons.history, color: _primaryGreen, size: 24),
      title: const Text(
        'Historial de Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {
        // Lógica para ir al historial de pedidos
      },
    );
  }

  Widget _buildRecommendations() {
    // Datos simulados para las tarjetas de recomendación (con URLs)
    final List<Map<String, dynamic>> recommendations = [
      {'title': 'Kale', 'imageUrl': 'https://images.unsplash.com/photo-1596707447668-525e982f170d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'title': 'Salad Mix', 'imageUrl': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'title': 'Carrots', 'imageUrl': 'https://images.unsplash.com/photo-1507914758552-32a76f296319?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    ];

    return SizedBox(
      height: 150, // Altura fija para el scroll horizontal
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return Container(
            width: 120,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage( // Aplicando la corrección ANR aquí también
                imageUrl: item['imageUrl'],
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: _primaryGreen, strokeWidth: 2),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}