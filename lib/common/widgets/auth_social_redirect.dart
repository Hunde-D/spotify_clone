import 'package:flutter/material.dart';

class AuthSwitchText extends StatelessWidget {
  const AuthSwitchText({super.key, required this.mainText, required this.actionText, this.onTap});

  final String mainText;
  final String actionText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2,
      children: [
        Text(
          mainText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff288CE9),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
