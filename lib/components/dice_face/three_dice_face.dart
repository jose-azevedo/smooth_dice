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
  Widget toOne(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      children: [
        DiceDot(),
      ],
    );
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      animationDirection: AnimationDirection.outwards,
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
  Widget toThree(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      animationDirection: AnimationDirection.inwards,
      children: [
        TwoOppositeDots(
          animationDirection: AnimationDirection.outwards,
        ),
      ],
    );
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      children: [
        TwoOppositeDots(
          animationDirection: AnimationDirection.outwards,
        )
      ],
    );
  }

  @override
  Widget toFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      children: [
        DiceDot(),
      ],
    );
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      children: [
        TwoOppositeDots(
          dotsPosition: DotsPosition.topRightBottomLeft,
          animationDirection: AnimationDirection.outwards,
        ),
      ],
    );
  }
}
