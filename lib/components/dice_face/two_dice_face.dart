import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import '../dots/two_and_four_dots.dart';
import '../dots/two_and_six_dots.dart';
import '../dots/two_opposite_dots.dart';
import 'dice_face.dart';

class TwoDiceFace extends DiceFace {
  const TwoDiceFace({super.key});

  @override
  int get faceValue => 2;

  @override
  Widget fromOne(DiceProperties diceProperties) {
    return const TwoOppositeDots();
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dx : 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dx : 0,
            child: const DiceDot(),
          ),
        ],
      ),
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoOppositeDots(
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
    return const TwoAndFourDots();
  }

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      children: [
        TwoOppositeDots(),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    return const TwoAndSixDots();
  }
}
