// En lib/pages/blog_page.dart
import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';
// Ya NO necesitamos: import 'package:cached_network_image/cached_network_image.dart'; 

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  // Estado para la barra de navegación
  int _selectedIndex = 1;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Lógica de navegación.
  }

  // Lista de artículos del blog usando rutas de ASSETS locales
  final List<Map<String, String>> _blogArticles = const [
    {
      'title': 'Los Beneficios de Comer Productos Locales',
      'description': 'Descubre por qué elegir frutas y verduras de origen local no solo es bueno para tu salud, sino que también apoya a tu comunidad y al medio ambiente.',
      'readTime': '3 min de lectura',
      // Usaremos la imagen que mostraste o una similar para el ejemplo
      'imageUrl': 'assets/images/cultivos-de-la-huerta.jpg', 
    },
    {
      'title': 'Prácticas de Cultivo Sostenible',
      'description': 'Aprende sobre los métodos que los agricultores están utilizando para proteger el medio ambiente y producir alimentos saludables para las generaciones venideras.',
      'readTime': '5 min de lectura',
      'imageUrl': 'assets/images/cajatomates.png', // Usando otro asset existente como ejemplo
    },
    {
      'title': 'Las 5 Frutas Más Saludables que Debes Incluir en Tu Dieta',
      'description': 'Desde las poderosas bayas hasta los cítricos llenos de vitamina C, te presentamos las frutas que potenciarán tu salud.',
      'readTime': '4 min de lectura',
      'imageUrl': 'assets/images/cultivos-de-la-huerta.jpg', 
    },
  ];


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
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _blogArticles.length,
        itemBuilder: (context, index) {
          final article = _blogArticles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: _buildBlogCard(
              context,
              article['title']!,
              article['description']!,
              article['readTime']!,
              article['imageUrl']!,
            ),
          );
        },
      ),
      // Implementación de la barra de navegación
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], 
      ),
    );
  }

  // Widget _buildBlogCard con implementación de Image.asset
  Widget _buildBlogCard(
    BuildContext context,
    String title,
    String description,
    String readTime,
    String imageUrl, // Ahora es una ruta local
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            // CAMBIO CLAVE: Usamos Image.asset en lugar de CachedNetworkImage
            child: Image.asset( 
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              // Los Assets cargan inmediatamente, por lo que no necesitamos placeholder/errorWidget.
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
                    // Color verde suave, similar a los ejemplos anteriores
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