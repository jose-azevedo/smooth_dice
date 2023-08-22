import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';
import 'package:smooth_dice/components/dots/two_opposite_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class FiveDiceFace extends DiceFace {
  const FiveDiceFace({super.key});

  @override
  int get faceValue => 5;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoOppositeDots(
      children: [
        TwoOppositeDots(
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      transitionAxis: Axis.horizontal,
      children: [
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
        ),
      ],
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      transitionAxis: Axis.horizontal,
      children: [
        TwoOppositeDots(
          animationDirection: AnimationDirection.outwards,
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromFour(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      transitionAxis: Axis.horizontal,
      children: [
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
        ),
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
      ],
    );
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      dotsEndResult: DotsEndResult.smaller,
      children: [
        TwoAndFourDots(),
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
        ),
        DiceDot(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndFourDots(dotsEndResult: DotsEndResult.smaller),
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
        ),
        TwoOppositeDots(
          animationDirection: AnimationDirection.inwards,
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
      ],
    );
  }
}
