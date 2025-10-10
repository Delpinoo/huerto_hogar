import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color waveColor;

  WavePainter(this.waveColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Definimos el pincel y el color de la onda
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    
    // Creamos la ruta (Path) de la onda
    final Path path = Path();
    path.moveTo(0, size.height * 0.8); // Punto de inicio
    
    // Ajustamos las curvas para que sean más pronunciadas
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.5,
      size.width * 0.4, size.height * 0.7,
    );
    
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.95,
      size.width, size.height * 0.8,
    );
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    
    // Dibujamos la onda en el canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}