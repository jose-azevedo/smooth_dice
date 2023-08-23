import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';
import 'package:smooth_dice/components/dots/two_and_one_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class FourDiceFace extends DiceFace {
  const FourDiceFace({super.key});

  @override
  int get faceValue => 4;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoAndOneDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
      ],
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      transitionAxis: Axis.horizontal,
      dotsEndResult: DotsEndResult.larger,
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      transitionAxis: Axis.horizontal,
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
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      transitionAxis: Axis.horizontal,
      children: [
        TwoAndFourDots(
          dotsEndResult: DotsEndResult.larger,
        ),
      ],
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
        TwoAndFourDots(
          dotsEndResult: DotsEndResult.larger,
        ),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.smaller,
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
}
