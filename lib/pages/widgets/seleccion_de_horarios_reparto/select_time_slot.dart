// delivery_preferences.dart
import "package:flutter/material.dart";


// (Your DeliveryPreferences widget code here...)

// (Your _DeliveryPreferencesState widget code here...)

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  String? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
  return Container(
    // 1. Margen para separar la tarjeta de otros elementos de la pantalla
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    // 2. Decoración para la forma, color y sombra de la tarjeta
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    // 3. Relleno interior para que el contenido no esté pegado a los bordes
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Seleccionar hora de reparto',
          style: TextStyle(fontSize: 15),
        ),
        // Aquí los widgets de TimeSlotOption
        TimeSlotOption(
          label: 'Mañana (8 AM - 12 PM)',
          isSelected: _selectedTimeSlot == 'Mañana',
          onTap: () {
            setState(() {
              _selectedTimeSlot = 'Mañana';
            });
          },
        ),
        TimeSlotOption(
          label: 'Tarde (1 PM - 5 PM)',
          isSelected: _selectedTimeSlot == 'Tarde',
          onTap: () {
            setState(() {
              _selectedTimeSlot = 'Tarde';
            });
          },
        ),
        TimeSlotOption(
          label: 'Tarde-noche (6 PM - 9 PM)',
          isSelected: _selectedTimeSlot == 'Tarde-noche',
          onTap: () {
            setState(() {
              _selectedTimeSlot = 'Tarde-noche';
            });
          },
        ),
      ],
    ),
  );
}
}

// ----------------------------------------
// The TimeSlotOption widget (must be in this file)
// ----------------------------------------

class TimeSlotOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}