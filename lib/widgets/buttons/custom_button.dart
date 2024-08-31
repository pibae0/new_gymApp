import 'package:flutter/material.dart';
import 'package:gym_new_app/utils/const_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  const CustomButton(
      {super.key, required this.onPressed, required this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 30, horizontal: 130),
          backgroundColor: AppTheme.accent,
          foregroundColor: AppTheme.dark,
          shape: const LinearBorder()),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
