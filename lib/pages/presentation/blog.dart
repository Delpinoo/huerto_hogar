import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int _selectedIndex = 1;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> _blogArticles = const [
    {
      'title': 'Los Beneficios de Comer Productos Locales',
      'description': 'Descubre por qué elegir frutas y verduras de origen local no solo es bueno para tu salud, sino que también apoya a tu comunidad y al medio ambiente.',
      'readTime': '3 min de lectura',
      'imageUrl': 'assets/images/cultivos-de-la-huerta.jpg', 
    },
    {
      'title': 'Prácticas de Cultivo Sostenible',
      'description': 'Aprende sobre los métodos que los agricultores están utilizando para proteger el medio ambiente y producir alimentos saludables para las generaciones venideras.',
      'readTime': '5 min de lectura',
      'imageUrl': 'assets/images/cajatomates.png',
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
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [], 
      ),
    );
  }

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
            child: Image.asset( 
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
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