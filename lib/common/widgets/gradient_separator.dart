import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class GradientSeparator extends StatelessWidget {
  const GradientSeparator({
    super.key,
    required this.text,
    required this.colors,
    this.darkColors,
    this.lineHeight = 1.0,
  });

  final String text;
  final List<Color> colors;
  final List<Color>? darkColors;
  final double lineHeight;

  @override
  Widget build(BuildContext context) {
    final effectiveColors = context.isDarkMode ? (darkColors ?? colors) : colors;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: lineHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: effectiveColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Container(
            height: lineHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: effectiveColors,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
