import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dots.dart';
import 'dice_face.dart';

class TwoDiceFace extends DiceFace {
  const TwoDiceFace({super.key});

  @override
  int get faceValue => 2;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.larger,
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    final tween = Tween<double>(begin: 0, end: diceProperties.maxOffset.dx);

    return SizedBox.expand(
      child: TweenAnimationBuilder(
        tween: tween,
        duration: diceProperties.duration,
        builder: (_, position, __) => Stack(
          children: [
            Positioned(
              top: position,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: position,
              right: position,
              child: const DiceDot(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: DiceDot(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: DiceDot(),
        ),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
        ),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.smaller,
    );
  }
}
