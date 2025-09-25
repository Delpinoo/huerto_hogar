// En lib/pages/blog_page.dart
import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
import 'package:cached_network_image/cached_network_image.dart'; // ¡Importante para evitar ANR!

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  // Estado para la barra de navegación
  int _selectedIndex = 1; // 1 es el índice para 'Blog', asumiendo que es la segunda pestaña

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // ***NOTA IMPORTANTE: Aquí deberías agregar la lógica de navegación real***
    // Por ejemplo, usar un PageController o Navigator.push para cambiar de página.
    // Esto dependerá de cómo tengas organizada tu estructura de navegación principal.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HuertoHogar Blog',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BotonAtras(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildBlogCard(
            context,
            'Los Beneficios de Comer Productos Locales',
            'Descubre por qué elegir frutas y verduras de origen local no solo es bueno para tu salud, sino que también apoya a tu comunidad y al medio ambiente.',
            '3 min de lectura',
            'https://images.unsplash.com/photo-1542838132-233633d45591?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          const SizedBox(height: 20),
          _buildBlogCard(
            context,
            'Prácticas de Cultivo Sostenible',
            'Aprende sobre los métodos que los agricultores están utilizando para proteger el medio ambiente y producir alimentos saludables para las generaciones venideras.',
            '5 min de lectura',
            'https://images.unsplash.com/photo-1517486801831-50e58d45e54d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          const SizedBox(height: 80), // Espacio extra para que la navbar no cubra el último contenido
        ],
      ),
      // Implementación de la barra de navegación
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], // Debe llenarse con los widgets de las páginas principales
      ),
    );
  }

  // Widget _buildBlogCard con implementación de CachedNetworkImage
  Widget _buildBlogCard(
    BuildContext context,
    String title,
    String description,
    String readTime,
    String imageUrl,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: CachedNetworkImage( // ¡SOLUCIÓN PARA ANR!
              imageUrl: imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              // Muestra un indicador de carga mientras descarga
              placeholder: (context, url) => SizedBox(
                height: 200,
                child: Center(
                  child: CircularProgressIndicator(
                      color: Colors.green[800], strokeWidth: 2),
                ),
              ),
              // Muestra un ícono si falla la carga
              errorWidget: (context, url, error) => const SizedBox(
                height: 200,
                child: Center(
                  child: Icon(Icons.image_not_supported,
                      size: 50, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 116, 175, 126),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  readTime,
                  style: TextStyle(
                    color: Colors.green[600],
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