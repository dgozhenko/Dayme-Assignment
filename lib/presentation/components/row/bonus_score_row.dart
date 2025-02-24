import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:dayme_assignment/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BonusScoreRow extends StatelessWidget {
  final int bonus;
  final bool isCompleted;
  const BonusScoreRow({
    super.key,
    required this.bonus,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '10 / ',
          style: TextStyle(
            color: isCompleted ? AppColors.white : AppColors.primaryTextColor,
            fontFamily: 'Mariupol',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          '$bonus',
          style: TextStyle(
            color: AppColors.white,
            fontFamily: 'Mariupol',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        SvgPicture.asset(Assets.icons.icActiveCoin),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
