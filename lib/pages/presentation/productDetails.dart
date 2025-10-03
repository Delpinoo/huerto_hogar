

import 'package:flutter/material.dart';

import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedIndex = 0;

  final List<String> _routes = const [
    '/', 
    '/search', 
    '/carrito',
    '/profile',
  ];

  void _onTabChange(int index) {
    if (_selectedIndex == index) return;
    
    if (_routes[index] == ModalRoute.of(context)?.settings.name) return;

    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushNamedAndRemoveUntil(
      context, 
      _routes[index], 
      (route) => false, 
    );
  }

  final String productName = 'Organic Tomatoes';
  final String description = 
      'Freshly harvested organic tomatoes from the fields of the Andes. Grown with '
      'sustainable practices, ensuring the highest quality and flavor.';
  final String price = '\$2.99/lb';
  final String origin = 'Andes Farms';
  final String localImageUrl = 'assets/images/tomate.jpg'; 
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/carrito');
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: AssetImage(localImageUrl), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
  
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 12.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/carrito');
            },
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
          selectedIndex: _selectedIndex,
          onTabChange: _onTabChange,
          pages: const [],
        ),
      ],
    );
  }
}