import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/review_page.dart';


class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/rene.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Rene Puente', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Hace 1 semana', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('5.0', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'The organic vegetables were incredibly fresh and flavorful. Im very satisfied with the quality and the prompt delivery. Highly recommend!',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
  
}














