import 'package:dayme_assignment/gen/assets.gen.dart';
import 'package:dayme_assignment/presentation/components/button/icon_button_with_shadow.dart';
import 'package:dayme_assignment/presentation/components/text/text_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButtonWithShadow(
          onPressed: () {},
          iconPath: Assets.icons.icClose,
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              children: [
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.images.promoTitleSvg,
                      width: 284,
                      height: 154,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // SVG didn't contain food images, so I used PNG. In order to fix blurry image I need image with high resolution.
                    Image.asset(
                      Assets.images.promoItemsPng.path,
                      width: 260,
                      height: 230,
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        child: TextWithShadow(
                          text: 'Старт',
                          style: TextStyle(
                            fontSize: 32,
                            color: AppColors.darkTextColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Mariupol',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
