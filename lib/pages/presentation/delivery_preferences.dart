import "package:flutter/material.dart";
import "package:huerto_hogar/pages/widgets/Boton_atras/boton_atras.dart";
import "package:huerto_hogar/pages/widgets/seleccion_de_horarios_reparto/select_time_slot.dart";
import "package:table_calendar/table_calendar.dart";

class DeliveryPreferences extends StatefulWidget {
  const DeliveryPreferences({super.key});

  @override
  State<DeliveryPreferences> createState() => _DeliveryPreferencesState();
}

// Acá usamos un claendario que tiene futter incluido 
class _DeliveryPreferencesState extends State<DeliveryPreferences> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencia de Reparto'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        // acá usamos el widget del boton atras(!!!!AUN NO FUNICONA¡¡¡¡)
        leading: const BotonAtras(),
      ),
      backgroundColor:  const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child:SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                const Text('Seleccione la fecha',
                            style: TextStyle(
                              fontSize: 25),
                ),
                TableCalendar(
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                    color: Color(0xFF1B5E20),
                    shape: BoxShape.circle,
                  ),
                  ),
                  headerStyle: HeaderStyle(
                    // desactiva la opcion para cambiar de formato el calendario
                    formatButtonVisible: false,
                  ),
                  focusedDay: _focusedDay, 
                  firstDay: DateTime.now(), 
                  lastDay: DateTime(DateTime.now(). year + 1),
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
              const SizedBox(height: 50,),
              // Insertamos las fechas que debe seleccionar el usuario para hacer su pedido
              SelectTime(),
              const SizedBox(height: 30,),
              Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.green,
                   foregroundColor: Colors.white,
                   padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                 ),
                 child: const Text('Guardar Referencia',
                 style: TextStyle(fontSize: 20
                 ),
                 ),
               ),
              ]
              ),
              )
                
                


              ],
              
        ),
      ),
      ) 
      

      
      );
  }
}
