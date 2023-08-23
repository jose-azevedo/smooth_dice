import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dots.dart';
import '../dots/one_to_one_animation.dart';
import 'dice_face.dart';

class OneDiceFace extends DiceFace {
  const OneDiceFace({super.key});

  @override
  int get faceValue => 1;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const OneToOneAnimation();
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndOneDots(dotsEndResult: DotsEndResult.smaller);
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const OneAndSixDots(dotsEndResult: DotsEndResult.smaller);
  }
}
