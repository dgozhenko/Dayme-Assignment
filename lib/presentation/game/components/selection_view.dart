import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:dayme_assignment/domain/model/game.dart';
import 'package:dayme_assignment/presentation/components/text/text_with_shadow.dart';
import 'package:dayme_assignment/presentation/game/components/item_card.dart';
import 'package:flutter/material.dart';

class SelectionView extends StatelessWidget {
  final List<Game> games;
  final Function(Game) onLikePressed;
  const SelectionView({
    super.key,
    required this.games,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ItemCard(
              game: games[0],
              isLiked: games[0].isLiked,
              onLikePressed: () => onLikePressed(games[0]),
            ),
            SizedBox(
              width: 8,
            ),
            ItemCard(
              game: games[1],
              isLiked: games[1].isLiked,
              onLikePressed: () => onLikePressed(games[1]),
            ),
          ],
        ),
        Positioned(
          top: 74,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.purple,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: TextWithShadow(
                text: 'або',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mariupol',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
