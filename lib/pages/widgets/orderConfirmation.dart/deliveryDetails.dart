import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/presentation/orderConfirmation_page.dart';

// Este widget representa la tarjeta que muestra los detalles de la entrega.
class DetallesDeliveryCard extends StatelessWidget {
  // Propiedades dinámicas que se pasan al widget para que sea reutilizable.

  final String tiempoEstimadoDelivery;
  final String direccionEnvio;

  // Constructor del widget, requiere los parámetros para funcionar.
  const DetallesDeliveryCard({
    super.key,
    required this.tiempoEstimadoDelivery,
    required this.direccionEnvio,
  });

  @override
  Widget build(BuildContext context) {
    // El widget Padding añade un espacio alrededor del Container para separarlo de los bordes de la pantalla.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        // El Padding interno añade espacio entre el contenido y los bordes de la tarjeta.
        padding: const EdgeInsets.all(16.0),
        // La propiedad decoration permite personalizar el diseño del contenedor, como el color, bordes y sombras.
        decoration: BoxDecoration(
          color: Colors.white, // Color de fondo de la tarjeta.
          borderRadius: BorderRadius.circular(20), // Bordes redondeados.
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Color de la sombra.
              spreadRadius: 3, // Cuánto se extiende la sombra.
              blurRadius: 10, // Qué tan difuminada es la sombra.
              offset: const Offset(0, 3), // La posición de la sombra (eje X, eje Y).
            ),
          ],
        ),
        // El widget Column organiza sus hijos verticalmente.
        child: Column(
          // crossAxisAlignment alinea los hijos al inicio del eje transversal (horizontal en este caso).
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la tarjeta.
            const Text(
              'Delivery Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Espacio vertical entre el título y el primer Row.
            const SizedBox(height: 15),
            // El primer Row organiza los widgets de forma horizontal (icono, espacio, columna de texto).
            Row(
              children: [
                // Icono de un camión de reparto.
                const Icon(Icons.delivery_dining, color: Color.fromARGB(255, 60, 136, 62)),
                // Espacio horizontal entre el icono y el texto.
                const SizedBox(width: 15),
                // Columna para el texto del tiempo de entrega.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Estimated Delivery',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    // Texto dinámico que muestra el tiempo de entrega.
                    Text(tiempoEstimadoDelivery,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            // Espacio vertical entre las dos filas de detalles.
            const SizedBox(height: 15),
            // El segundo Row organiza los widgets de la dirección.
            Row(
              children: [
                // Icono de ubicación.
                const Icon(Icons.location_on, color: Color.fromARGB(255, 60, 136, 62)),
                // Espacio horizontal.
                const SizedBox(width: 15),
                // Columna para el texto de la dirección.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Shipping Address',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    // Texto dinámico que muestra la dirección.
                    Text(direccionEnvio,
                        style: const TextStyle(color: Colors.grey)),
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