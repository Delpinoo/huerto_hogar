import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/OrderTracking/TrackingMapCard.dart';
import 'package:huerto_hogar/pages/widgets/OrderTracking/OrderStatus.dart';
import 'package:huerto_hogar/pages/widgets/OrderTracking/DeliveryDetailsCard.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Order Tracking',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TrackingMapCard(),
              SizedBox(height: 20),
              OrderStatusCard(),
              SizedBox(height: 20),
              DeliveryDetailsCard(),
            ],
          ),
        ),
      ),
      // Aquí está la corrección: remueve el Padding y llama al CustomNavbar directamente
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        pages: const [],
      ),
    );
  }
}