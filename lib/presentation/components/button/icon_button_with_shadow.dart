import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconButtonWithShadow extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String iconPath;

  const IconButtonWithShadow({
    super.key,
    required this.onPressed,
    this.width = 48,
    this.height = 48,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 8.0,
          left: 6.0,
          child: SvgPicture.asset(
            iconPath,
            width: width - 4,
            height: width - 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            iconPath,
            width: width,
            height: height,
          ),
        ),
      ],
    );
  }
}
