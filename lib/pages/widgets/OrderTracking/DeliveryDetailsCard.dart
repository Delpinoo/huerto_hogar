import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/OrderTracking.dart';

class DeliveryDetailsCard extends StatelessWidget {
  const DeliveryDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Delivery Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 15),
            Row(
              children: const [
                Icon(Icons.location_on, color: Color(0xFF3C883E)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery Address',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Av. Providencia 2550, Santiago',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: const [
                Icon(Icons.phone, color: Color(0xFF3C883E)),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('+56 9 1234 5678', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}