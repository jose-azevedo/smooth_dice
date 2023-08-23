import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';
import 'package:smooth_dice/components/dots/two_opposite_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class ThreeDiceFace extends DiceFace {
  const ThreeDiceFace({super.key});

  @override
  int get faceValue => 3;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      dotsEndResult: DotsEndResult.smaller,
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
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoOppositeDots(
          dotsEndResult: DotsEndResult.larger,
        ),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoOppositeDots(
          dotsEndResult: DotsEndResult.smaller,
        )
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoOppositeDots(
          dotsPosition: DotsPosition.topRightBottomLeft,
          dotsEndResult: DotsEndResult.smaller,
        ),
      ],
    );
  }
}
