import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.width,
    this.height,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      foregroundColor: textColor ?? Colors.white,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2,
    );

    final buttonLabel = Text(
      label,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
    );

    final button = icon != null
        ? ElevatedButton.icon(
            style: buttonStyle,
            onPressed: onPressed,
            icon: Icon(icon),
            label: buttonLabel,
          )
        : ElevatedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: buttonLabel,
          );

    return SizedBox(
      width: width,
      height: height,
      child: button,
    );
  }
}
