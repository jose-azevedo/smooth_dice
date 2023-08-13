import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import '../dots/two_and_four_dots.dart';
import '../dots/two_opposite_dots.dart';
import 'dice_face.dart';

class TwoDiceFace extends DiceFace {
  const TwoDiceFace({super.key});

  @override
  int get faceValue => 2;

  @override
  Widget toOne(DiceProperties diceProperties) {
    return const TwoOppositeDots();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
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
  Widget toThree(DiceProperties diceProperties) {
    return const SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
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
          TwoOppositeDots()
        ],
      ),
    );
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    return const TwoAndFourDots();
  }

  @override
  Widget toFive(DiceProperties diceProperties) {
    return const TwoAndFourDots(
      children: [
        TwoOppositeDots(),
      ],
    );
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    return TwoAndFourDots(
      transitionAxis: Axis.horizontal,
      children: [
        AnimatedPositioned(
          duration: diceProperties.duration,
          top: diceProperties.shouldAnimate
              ? diceProperties.maxOffset.dy / 2
              : 0,
          left: 0,
          child: const DiceDot(),
        ),
        AnimatedPositioned(
          duration: diceProperties.duration,
          bottom: diceProperties.shouldAnimate
              ? diceProperties.maxOffset.dy / 2
              : 0,
          right: 0,
          child: const DiceDot(),
        ),
      ],
    );
  }
}
