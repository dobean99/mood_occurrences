import 'package:flutter/material.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  const RoundedContainer({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? AppColors.redColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: child,
    );
  }
}
