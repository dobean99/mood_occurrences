import 'package:flutter/material.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';
import 'package:mood_occurrences/core/constants/app_constants.dart';

class RoundedGradientStrokeButton extends StatelessWidget {
  final double? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final bool isCircleButton;
  final bool isEnabled;

  const RoundedGradientStrokeButton({
    super.key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
    this.isCircleButton = false,
    this.isEnabled = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: Container(
        width: width ?? AppConstants.buttonMenuWidth,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: isCircleButton
            ? BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.blackToGrey,
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppConstants.borderWidth,
                ),
              )
            : BoxDecoration(
                gradient: AppColors.blackToGrey,
                borderRadius: BorderRadius.circular(
                    borderRadius ?? AppConstants.borderRadius),
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: AppConstants.borderWidth,
                ),
              ),
        child: InkWell(
          onTap: onPressed,
          child: Center(child: child),
        ),
      ),
    );
  }
}
