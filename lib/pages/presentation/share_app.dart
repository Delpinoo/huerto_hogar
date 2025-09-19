import "package:flutter/material.dart";
import "package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart";

class ShareApp extends StatefulWidget {
  const ShareApp({super.key});


  @override
  State<ShareApp> createState() => _ShareApp();
}


class _ShareApp extends State<ShareApp> {

    static const IconData arrow_forward_ios_sharp = IconData(
  0xe79a,
  fontFamily: 'MaterialIcons',
  matchTextDirection: true,
);

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
        title: Text('Compartir'),
        leading: BotonAtras(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center( 
              child: const Text(
                'Compartir Huerto Hogar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center( 
              child: Text(
                'Excepteur dolore enim minim excepteur sint do veniam excepteur aute Lorem enim. Irure tempor ullamco anim proident et labore pariatur',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),


            const SizedBox(height: 20),

            const Text('Compartir en', style: TextStyle(fontSize: 20),),

            // Tarjetas de redes sociales
            // Facebook
            Card(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 250, 226),
                        child: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Color.fromARGB(255, 5, 172, 11),
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Facebook', style: TextStyle(fontSize: 17)),
                      SizedBox(width: 250,),
                      Icon(arrow_forward_ios_sharp)
                    ],
                  ),
                ),
              )
              ),


            const SizedBox(height: 20),
            // Instagram
               Card(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 250, 226),
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Color.fromARGB(255, 5, 172, 11),
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Instagram', style: TextStyle(fontSize: 17)),
                      SizedBox(width: 250,),
                      Icon(arrow_forward_ios_sharp)
                    ],
                  ),
                ),
                )
              ),


            const SizedBox(height: 20),


            // X / Twitter
             Card(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 250, 226),
                        child: FaIcon(
                          FontAwesomeIcons.xTwitter,
                          color: Color.fromARGB(255, 5, 172, 11),
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('Twitter / X', style: TextStyle(fontSize: 17)),
                      SizedBox(width: 250,),
                      Icon(arrow_forward_ios_sharp)
                    ],
                  ),
                ),
                ) 
              ),


            const SizedBox(height: 20),
            // WhatsApp
              Card(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 250, 226),
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Color.fromARGB(255, 5, 172, 11),
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('WhatsApp', style: TextStyle(fontSize: 17)),
                      SizedBox(width: 250,),
                      Icon(arrow_forward_ios_sharp)
                    ],
                  ),
                ),
                ) 
              ),
            const SizedBox(height: 25),

            
            const Text('Síguenos', style: TextStyle(fontSize: 20),),
            

            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ícono de Facebook
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: SizedBox(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Color.fromARGB(255, 5, 172, 11),
                                size: 30,
                              ),
                              Text('Facebook')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Ícono de Instagram
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: SizedBox(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Color.fromARGB(255, 5, 172, 11),
                                size: 30,
                              ),
                              Text('Instagram')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Ícono de X / Twitter
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: SizedBox(
                          child: Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.xTwitter,
                                color: Color.fromARGB(255, 5, 172, 11),
                                size: 30,
                              ),
                              Text('X Twitter')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
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
    );
  }
}