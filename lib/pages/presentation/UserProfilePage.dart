import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart'; 

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  
  int _selectedIndex = 3; 
  final Color _primaryGreen = const Color(0xFF4C7B42); 

  final List<String> _routes = const [
    '/catalogo',
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

  void _navigateToEditProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navegar a la página de Edición de Perfil.'),
        duration: Duration(seconds: 2),
      ),
    );
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
        leading: const BotonAtras(),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: _primaryGreen),
            onPressed: _navigateToEditProfile,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 30),

            _buildSectionTitle('Detalles de la Cuenta'),
            _buildAccountDetail(Icons.email, 'Email', 'sofia.ramirezh@email.com'),
            _buildAccountDetail(Icons.phone, 'Teléfono', '+56 9 1234 5678'),
            _buildAccountDetail(Icons.location_on, 'Dirección', '123 Main Street, Santiago'),
            const SizedBox(height: 30),

            _buildSectionTitle('Pedidos'),
            _buildOrderHistory(),
            const SizedBox(height: 30),

            _buildSectionTitle('Recomendaciones'),
            _buildRecommendations(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], 
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) { 
    const String profileImageUrl = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

    return Center(
      child: Column(
        children: [
          ClipOval(
            child: CachedNetworkImage( 
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Navegar a Historial de Pedidos')),
        );
      },
    );
  }

  Widget _buildRecommendations() {
    
    final List<Map<String, dynamic>> recommendations = [
      {'title': 'Kale', 'imageUrl': 'https://images.unsplash.com/photo-1596707447668-525e982f170d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'title': 'Salad Mix', 'imageUrl': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'title': 'Carrots', 'imageUrl': 'https://images.unsplash.com/photo-1507914758552-32a76f296319?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
      {'title': 'Broccoli', 'imageUrl': 'https://images.unsplash.com/photo-1582234372754-20b1c554b73b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'},
    ];

    return SizedBox(
      height: 150, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Ver detalles de ${item['title']}')),
              );
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage( 
                      imageUrl: item['imageUrl'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(color: _primaryGreen, strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}