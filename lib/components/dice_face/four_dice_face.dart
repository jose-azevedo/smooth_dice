import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';
import 'package:smooth_dice/components/dots/two_opposite_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class FourDiceFace extends DiceFace {
  const FourDiceFace({super.key});

  @override
  int get faceValue => 4;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      children: [
        TwoOppositeDots(
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
      ],
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      transitionAxis: Axis.horizontal,
      dotsEndResult: DotsEndResult.smaller,
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      transitionAxis: Axis.horizontal,
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoOppositeDots(),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      transitionAxis: Axis.horizontal,
      children: [
        TwoAndFourDots(),
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoOppositeDots(),
        TwoAndFourDots(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
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
