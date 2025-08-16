import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key, this.onGooglePressed, this.onApplePressed});

  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset(AppVectors.googleLogo, height: 28, width: 28, errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.g_mobiledata, size: 36);
          }),
          onPressed: onGooglePressed,
        ),
        const SizedBox(width: 24),
        IconButton(
          icon: const Icon(Icons.apple_rounded, size: 36),
          onPressed: onApplePressed,
        ),
      ],
    );
  }
}
