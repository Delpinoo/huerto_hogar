import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/OrderTracking.dart';

import 'package:flutter/material.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key});

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
            const Text('Order Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),
            // La línea de tiempo es una columna de ListTiles
            buildStatusRow('Order Placed', 'Today, 10:00 AM', true),
            buildStatusRow('Processing', 'Today, 10:30 AM', true),
            buildStatusRow('Shipped', 'Today, 11:00 AM', true),
            buildStatusRow('Out for Delivery', 'Today, 11:45 AM', false),
          ],
        ),
      ),
    );
  }

  // Widget de ayuda para construir cada línea de estado
  Widget buildStatusRow(String title, String time, bool completed) {
    return Row(
      children: [
        Column(
          children: [
            Icon(Icons.check_circle,
                color: completed ? const Color(0xFF3C883E) : Colors.grey),
            SizedBox(
              height: 40,
              child: VerticalDivider(
                color: completed ? const Color(0xFF3C883E) : Colors.grey,
                thickness: 2,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(time, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}