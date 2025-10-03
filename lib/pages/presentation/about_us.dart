import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import "package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart";

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _selectedIndex = 0; 

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nosotros'),
        leading: const BotonAtras(),
        centerTitle: true,
      ),

      body: SingleChildScrollView( 
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle('¿Quienes somos?'),
            _buildContentCard(
              'Sunt et et minim consequat reprehenderit eu elit non exercitation anim. Enim ex esse aliqua deserunt ut proident. Incididunt ullamco non id aliquip laboris dui.',
            ),

            const SizedBox(height: 30),

            _buildTitle('¿Qué hacemos?'),
            _buildContentCard(
              'Ullamco pariatur ad culpa Lorem cupidatat sint et nulla ut nostrud. Excepteur do commodo pariatur quis officia commodo sunt et reprehenderit non dolore. Deserunt ex eu ea quis ut ea. Est officia sint tempor duis. Laboris nulla pariatur officia enim non ex enim culpa qui consequat labore deserunt labore in. Non mollit amet eiusmod ad laborum veniam adipisicing in cupidatat. Dolore aliqua aute eu ullamco consequat proident dolor do.',
            ),

            const SizedBox(height: 30),

            _buildTitle('¿Que Queremos?', fontSize: 25),
            _buildContentCard(
              'Excepteur dolore enim minim excepteur sint do veniam excepteur aute Lorem enim. Irure tempor ullamco anim proident et labore pariatur consectetur. Tempor esse magna eiusmod quis et adipisicing ea ea occaecat qui.',
            ),

            const SizedBox(height: 70), 
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
  
  Widget _buildTitle(String text, {double fontSize = 20}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.brown[600],
        ),
      ),
    );
  }

  Widget _buildContentCard(String content) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ),
    );
  }
}