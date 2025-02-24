import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:dayme_assignment/gen/assets.gen.dart';
import 'package:dayme_assignment/presentation/components/button/elevated_button_with_shadow.dart';
import 'package:dayme_assignment/presentation/components/button/icon_button_with_shadow.dart';
import 'package:dayme_assignment/presentation/components/row/bonus_score_row.dart';
import 'package:dayme_assignment/presentation/components/text/text_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class GameResultsScreen extends StatelessWidget {
  const GameResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButtonWithShadow(
          onPressed: () {
            context.pop();
          },
          iconPath: Assets.icons.icClose,
        ),
        actions: [
          BonusScoreRow(
            bonus: 10,
            isCompleted: true,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              AppColors.mainGradientStart,
              AppColors.mainGradientEnd,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Column(
                children: [
                  TextWithShadow(
                    text: 'Вітаємо!',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mariupol',
                    ),
                  ),
                  TextWithShadow(
                    text: 'Твій виграш',
                    style: TextStyle(
                      fontSize: 42,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mariupol',
                    ),
                  ),
                  SizedBox(
                    height: 46,
                  ),
                  SvgPicture.asset(Assets.icons.icWin),
                ],
              ),
              Spacer(),
              ElevatedButtonWithShadow(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Бонуси отримано'),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(Assets.icons.icDefaultCoin),
                    SizedBox(
                      width: 8,
                    ),
                    TextWithShadow(
                      text: 'Забрати бонуси',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mariupol',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
