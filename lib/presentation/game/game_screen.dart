import 'package:dayme_assignment/core/bloc_utils/bloced_state.dart';
import 'package:dayme_assignment/core/navigation/app_routes.dart';
import 'package:dayme_assignment/core/theme/colors.dart';
import 'package:dayme_assignment/gen/assets.gen.dart';
import 'package:dayme_assignment/presentation/components/button/icon_button_with_shadow.dart';
import 'package:dayme_assignment/presentation/components/button/outlined_button_with_shadow.dart';
import 'package:dayme_assignment/presentation/components/progress_stepper.dart';
import 'package:dayme_assignment/presentation/components/text/text_with_shadow.dart';
import 'package:dayme_assignment/presentation/game/bloc/game_bloc.dart';
import 'package:dayme_assignment/presentation/game/components/item_card.dart';
import 'package:dayme_assignment/presentation/game/components/selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends BlocedState<GameScreen, GameBloc, GameState> {
  @override
  void initState() {
    super.initState();
    bloc.add(GameEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return blocConsumer(
      listener: (context, state) {
        if (state.stage.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.error ?? 'Сталася помилка. Спробуйте ще раз.'),
            ),
          );
          bloc.add(GameEvent.errorObserved());
        }
        if (state.stage == GameStage.reportSent) {
          context.pushReplacement(AppRoutes.gameResult.path);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
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
                  Text(
                    '10 / ',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontFamily: 'Mariupol',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${state.selectedGameIds.length}',
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
                    padding: const EdgeInsets.only(top: 135),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProgressStepper(
                              currentStep: state.currentStep,
                              totalSteps: 10,
                            ),
                            SizedBox(height: 100),
                            Center(
                              child: TextWithShadow(
                                text: 'А що обереш ти?',
                                style: TextStyle(
                                  fontSize: 32,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mariupol',
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            if (state.games.isNotEmpty)
                              SelectionView(
                                games: state.games.sublist(
                                    state.currentStep * 2,
                                    (state.currentStep * 2) + 2),
                                onLikePressed: (game) {
                                  bloc.add(GameEventLikeItem(gameId: game.id));
                                },
                              ),
                          ],
                        ),
                        Spacer(),
                        OutlinedButtonWithShadow(
                          onPressed: () {
                            bloc.add(GameEventNextStep());
                          },
                          child: TextWithShadow(
                            text: 'Далі',
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mariupol',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state.stage.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      },
    );
  }
}
