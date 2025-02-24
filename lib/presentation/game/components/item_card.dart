import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:dayme_assignment/domain/model/game.dart';
import 'package:dayme_assignment/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  final Game game;
  final bool isLiked;
  final Function() onLikePressed;
  const ItemCard({
    super.key,
    required this.game,
    required this.isLiked,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 174,
      height: 326,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(
            color: AppColors.cyan,
            width: 3,
          ),
          right: BorderSide(
            color: AppColors.cyan,
            width: 3,
          ),
          top: BorderSide(
            color: AppColors.cyan,
            width: 5,
          ),
          bottom: BorderSide(
            color: AppColors.cyan,
            width: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Image.network(
                        game.imageUrl,
                        key: ValueKey(game.imageUrl),
                      ),
                    ),
                    SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        game.name,
                        key: ValueKey(game.name),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mariupol',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: IconButton(
                key: ValueKey(isLiked),
                onPressed: () => onLikePressed(),
                icon: SvgPicture.asset(
                  isLiked
                      ? Assets.icons.icActiveLike
                      : Assets.icons.icDefaultLike,
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
