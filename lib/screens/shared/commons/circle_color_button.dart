import 'package:flutter/material.dart';

class CircleColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final bool isSelected;

  const CircleColorButton({
    super.key,
    required this.color,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.0, // Set your desired size
        height: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.white,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
