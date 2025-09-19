import "package:flutter/material.dart";
import "package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart";
import "package:huerto_hogar/pages/widgets/review_products/custom_nav_bar.dart";
import "package:huerto_hogar/pages/widgets/seleccion_de_horarios_reparto/select_time_slot.dart";
import "package:table_calendar/table_calendar.dart";

class DeliveryPreferences extends StatefulWidget {
  const DeliveryPreferences({super.key});

  @override
  State<DeliveryPreferences> createState() => _DeliveryPreferencesState();
}

class _DeliveryPreferencesState extends State<DeliveryPreferences> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
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
        title: const Text('Preferencia de Reparto'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BotonAtras(),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(  // <-- Envuelve todo el contenido con SingleChildScrollView
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Text(
                  'Seleccione la fecha',
                  style: TextStyle(fontSize: 25),
                ),
                ), 
                
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  
                  elevation: 5, // La elevación controla la intensidad de la sombra
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TableCalendar(
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF1B5E20),
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                    ),
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(DateTime.now().year + 1),
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDate, selectedDay)) {
                        setState(() {
                          _selectedDate = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const SelectTime(),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity, // <-- Hace que el SizedBox ocupe el ancho disponible
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                // Eliminamos el padding horizontal del botón para controlarlo desde fuera
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), 
                              ),
                              child: const Text(
                                'Guardar Referencia',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      
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
            ),
          ),
        ),
      ),
    );
  }
}