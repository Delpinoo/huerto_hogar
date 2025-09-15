import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingReview extends StatelessWidget {
  const RatingReview({super.key});

//Widget para la calificación con las estrellas
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 200, 0),
          ),
          onRatingUpdate: (rating) {
          },
        ),
        //fin del widget de la calificación


        //Creo un espacio entre las estrellas y la caja de texto
        const SizedBox(height: 20),


        //Este es el widget para la caja de texto
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 250, 250, 250),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 5, // permite varias lineas para la reseña
              decoration: InputDecoration(
                hintText: 'Comparte tu reseña...',
                border: InputBorder.none,// Elimina el borde del textfield
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      // Aqui agrego el botón de enviar la reseña y tambien lo dejo centrado
    Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 60, 136, 62),
          padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15),
        ),
        child: const Text('Enviar reseña'),
      ),
    ),

      ],
    );
  }
}