import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Resumen del pedido', style: TextStyle(fontWeight: FontWeight.bold)),
                      // Elementos de la lista
                      ListTile(
                        title: Text('Manzanas',
                        style: TextStyle(
                          fontSize: 15
                        ),),
                      trailing: Text('\$2.50',
                      style: TextStyle(
                        fontSize: 16,
                        ),),
                      ),
                      ListTile(
                        title: Text('Plátanos',
                        style: TextStyle(
                          fontSize: 16
                        ),),
                      trailing: Text('\$2.50',
                      style: TextStyle(
                        fontSize: 16,
                        ),),
                      ),
                      ListTile(
                        title: Text('Naranjas',
                        style: TextStyle(
                          fontSize: 16
                        ),),
                      trailing: Text('\$2.50',
                      style: TextStyle(
                        fontSize: 16,
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
                      ListTile(
                        title: Text('Total',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      trailing: const Text('\$2.50',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 59, 138, 62),
                        fontWeight: FontWeight.bold),),
                      ),
            
          ],
          )
        ),

        
      ),
    );
  }
    
}