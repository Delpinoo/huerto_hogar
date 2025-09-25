import 'package:flutter/material.dart';

class ProductCategoryChips extends StatelessWidget {
  const ProductCategoryChips({Key? key}) : super(key: key);

  // Widget para cada 'chip' de categoría
  Widget _buildCategoryChip(String text, bool isSelected) {
    final Color selectedColor = Colors.green.shade700;
    final Color unselectedColor = Colors.grey.shade200;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(text),
        selected: isSelected,
        onSelected: (bool selected) {
          // Lógica de selección aquí (usaría setState en la página principal)
        },
        backgroundColor: unselectedColor,
        selectedColor: selectedColor,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // El primer chip está seleccionado (ver imagen)
          _buildCategoryChip('Todos', true),
          _buildCategoryChip('Frutas', false),
          _buildCategoryChip('Verduras', false),
          _buildCategoryChip('Orgánicos', false),
          _buildCategoryChip('Lácteos', false),
          // Agrega más categorías aquí
        ],
      ),
    );
  }
}