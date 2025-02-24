import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OutlinedButtonWithShadow extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const OutlinedButtonWithShadow({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 8),
              blurRadius: 0,
            ),
          ],
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.white, width: 3),
            backgroundColor: AppColors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
