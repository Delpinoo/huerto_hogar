import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import "package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart";


class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}


class _AboutUsState extends State<AboutUs> {

  int _selectedIndex = 0; // Agrega el estado para el navbar

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Aquí puedes añadir la lógica para navegar a otras páginas
  }



@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros'),
        leading: BotonAtras(),
      ),

      body: 
         Stack(
          children: [Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                child: SizedBox(
                  child: const Text('¿Quienes somos?'),),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsetsGeometry.all(10),
                      child: Column(
                        children: [
                        const SizedBox(height: 20,),
                        const Text('Sunt et et minim consequat reprehenderit eu elit non exercitation anim. Enim ex esse aliqua deserunt ut proident. Incididunt ullamco non id aliquip laboris dui.')
                        ],
                      ),),
                    ],
                  ),
                )
                ),


                const SizedBox(height: 30,),


                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: const Text('¿Quienes que hacemos?'),
                ),


                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            const Text('Ullamco pariatur ad culpa Lorem cupidatat sint et nulla ut nostrud. Excepteur do commodo pariatur quis officia commodo sunt et reprehenderit non dolore. Deserunt ex eu ea quis ut ea. Est officia sint tempor duis. Laboris nulla pariatur officia enim non ex enim culpa qui consequat labore deserunt labore in. Non mollit amet eiusmod ad laborum veniam adipisicing in cupidatat. Dolore aliqua aute eu ullamco consequat proident dolor do.')
                          ],
                        ),
                        ),
                      ],
                  ),
                ),
                ),
                
                const SizedBox(height: 20,),
                Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                child: const Text('¿Que queremos?'),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 30,),
                            const Text('Excepteur dolore enim minim excepteur sint do veniam excepteur aute Lorem enim. Irure tempor ullamco anim proident et labore pariatur consectetur. Tempor esse magna eiusmod quis et adipisicing ea ea occaecat qui.')

                          ],
                        ),
                        ),                        ],
                  ),
                ),
                ),
                const SizedBox(height: 70,),
                Align( // <-- Align la pone en la parte de abajo
                      alignment: Alignment.bottomCenter,
                      child: SafeArea( // <-- Mantiene la barra lejos de los botones del sistema
                        child: CustomNavbar(
                          selectedIndex: _selectedIndex,
                          onTabChange: _onTabChange,
                          pages: const [],
                        ),
                      ),
                    ),
                    
              ],
          ),
        ),
          ],
         )
    );
  }
}