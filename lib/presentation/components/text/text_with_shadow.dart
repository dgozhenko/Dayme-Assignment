import 'package:flutter/material.dart';

class TextWithShadow extends StatelessWidget {
  final String text;
  final TextStyle style;

  const TextWithShadow({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          child: Text(
            text,
            style: style.copyWith(
              color: Colors.black.withOpacity(0.25),
            ),
          ),
        ),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
