import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key,required this.onPressed, required this.title, this.height = 80.0});
  final VoidCallback onPressed;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height),
      ),
      child: Text(title),
    );
  }
}