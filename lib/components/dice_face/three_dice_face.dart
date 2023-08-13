import 'package:flutter/material.dart';
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
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right: 0,
            child: const DiceDot(),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: DiceDot(),
          ),
          const TwoOppositeDots(
            animationDirection: AnimationDirection.outwards,
          ),
        ],
      ),
    );
  }

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }
}
