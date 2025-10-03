import 'package:flutter/material.dart';
import 'package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart';
import 'package:huerto_hogar/pages/widgets/benefit_card/benefit_card.dart';
import 'package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart';

class LoyaltyPrograms extends StatefulWidget {
  const LoyaltyPrograms({super.key});

  @override
  State<LoyaltyPrograms> createState() => _LoyaltyProgramsState();
}

class _LoyaltyProgramsState extends State<LoyaltyPrograms> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntos y Beneficios'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BotonAtras(),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 3,
                          ),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://tse2.mm.bing.net/th/id/OIP.qbSh1AApPYS3lbuCdhQqnAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Irelia Legends',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 24,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            '1,200 Puntos',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Miembro desde 2022',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Beneficios Disponibles',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                BenefitCard(
                  imageUrl: 'https://i.redd.it/g4s06358u0a61.png',
                  title: '10% de Descuento en tu Próxima Compra',
                  description: 'Canjea 500 puntos para obtener un 10% de descuento en tu próxima compra.',
                  onRedeem: () {
                    print('Canjear 500 puntos');
                  },
                ),
                
                BenefitCard(
                  imageUrl: 'https://static.wikia.nocookie.net/leagueoflegendsoficial/images/a/a7/Plated_Steelcaps.png/revision/latest/smart/width/250/height/250?cb=20220404183317&path-prefix=es',
                  title: 'Envío Gratuito',
                  description: 'Canjea 1,000 puntos para obtener envío gratuito en tu próximo pedido.',
                  onRedeem: () {
                    print('Canjear 1,000 puntos');
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),

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
    );
  }
}