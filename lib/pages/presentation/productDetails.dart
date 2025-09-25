import 'package:flutter/material.dart';
// Asegúrate de que esta ruta sea correcta para tu CustomNavbar
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  final String productName = 'Organic Tomatoes';
  final String description = 
      'Freshly harvested organic tomatoes from the fields of the Andes. Grown with '
      'sustainable practices, ensuring the highest quality and flavor.';
  final String price = '\$2.99/lb';
  final String origin = 'Andes Farms';
  
  // ⚠️ Cambia 'assets/images/tomatoes.png' por la ruta y el nombre de tu archivo.
  final String localImageUrl = 'assets/images/tomatoes.png'; 
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Imagen del Producto (Cargada desde la carpeta de assets)
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    // ✅ La solución es usar Image.asset
                    image: AssetImage('assets/images/tomate.jpg'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            // 2. Detalles del Producto
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  const Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  _buildDetailRow(context, 'Price', price),
                  const SizedBox(height: 8),

                  _buildDetailRow(context, 'Origin', origin),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
  
  // --- Widgets Auxiliares ---
  
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
  Widget _buildBottomBar(BuildContext context) {
    const int dummySelectedIndex = 0; 
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade600,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        CustomNavbar(
          selectedIndex: dummySelectedIndex,
          onTabChange: (index) {
            print('Intentando navegar a índice $index desde Detalles');
          },
          pages: const [],
        ),
      ],
    );
  }
}