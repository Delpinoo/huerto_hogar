import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/OrderTracking.dart';

class TrackingMapCard extends StatelessWidget {
  const TrackingMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Order #12345',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 4),
                    Text('Estimated Delivery: 12:00 PM',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
                const Icon(Icons.local_shipping, color: Color(0xFF3C883E)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Aquí va la imagen del mapa
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/map_placeholder.png'), // Reemplaza con tu imagen de mapa
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tarjeta flotante con el estado de la entrega
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 226, 220),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Your order is out for delivery!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text('It should arrive in approximately 15 minutes.',
                        style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}