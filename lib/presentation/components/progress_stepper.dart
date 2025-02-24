import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ProgressStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressStepper({
    super.key,
    required this.currentStep,
    this.totalSteps = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          totalSteps,
          (index) {
            final isActive = currentStep > 0 && index < currentStep;
            return Expanded(
              child: Padding(
                padding:
                    EdgeInsets.only(right: index != totalSteps - 1 ? 8.0 : 8.0),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.yellow : Colors.transparent,
                    border: isActive
                        ? GradientBoxBorder(
                            width: 2,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.progressGradientStart,
                                AppColors.progressGradientEnd,
                              ],
                            ))
                        : GradientBoxBorder(
                            width: 2,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.purple,
                                AppColors.purple,
                              ],
                            ),
                          ),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                            )
                          ]
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
