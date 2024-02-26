import 'package:flutter/material.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';

class ParallelogramButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ParallelogramButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        painter: ParallelogramPainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: AppConstants.titleFontSize,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.redColor; // Change the color as needed

    final Path path = Path()
      ..moveTo(40, size.height)
      ..lineTo(size.width - 60, size.height)
      ..lineTo(size.width - 40, 0)
      ..lineTo(60, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
