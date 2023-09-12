import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dots.dart';
import 'dice_face.dart';

class SixDiceFace extends DiceFace {
  const SixDiceFace({super.key});

  @override
  int get faceValue => 6;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const OneAndSixDots(dotsEndResult: DotsEndResult.larger);
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
        ),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: DiceDot(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: DiceDot(),
        ),
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndFourDots(dotsEndResult: DotsEndResult.smaller),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    final tween = Tween<double>(begin: 0, end: diceProperties.maxOffset.dx);

    return SizedBox.expand(
      child: TweenAnimationBuilder(
        tween: tween,
        duration: diceProperties.duration,
        builder: (_, position, __) => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: position,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              top: position,
              right: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: position,
              right: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: position,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              right: position,
              child: const DiceDot(),
            ),
          ],
        ),
      ),
    );
  }
}
