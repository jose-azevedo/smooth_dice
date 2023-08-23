import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';
import 'package:smooth_dice/components/dots/two_and_one_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class FiveDiceFace extends DiceFace {
  const FiveDiceFace({super.key});

  @override
  int get faceValue => 5;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.larger,
      transitionAxis: Axis.horizontal,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
        ),
      ],
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.larger,
      transitionAxis: Axis.horizontal,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.larger,
      transitionAxis: Axis.horizontal,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndFourDots(
          dotsEndResult: DotsEndResult.smaller,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoAndFourDots(
          dotsEndResult: DotsEndResult.larger,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.smaller,
          dotsPosition: DotsPosition.bottomLeftTopRight,
        ),
      ],
    );
  }
}
