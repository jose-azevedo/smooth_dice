import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';
import 'package:smooth_dice/components/dots/two_and_six_dots.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import '../dots/two_and_one_dots.dart';
import 'dice_face.dart';

class SixDiceFace extends DiceFace {
  const SixDiceFace({super.key});

  @override
  int get faceValue => 6;
  @override
  Widget fromOne(DiceProperties diceProperties) {
    final tween = Tween<double>(begin: diceProperties.maxOffset.dx / 2, end: 0);

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              top: position,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              top: position,
              right: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: position,
              right: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: position,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              right: position,
              child: const DiceDot(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget fromTwo(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
    );
  }

  @override
  Widget fromThree(DiceProperties diceProperties) {
    return const TwoAndSixDots(
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
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
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

  @override
  Widget fromFive(DiceProperties diceProperties) {
    return const TwoAndSixDots(
      dotsEndResult: DotsEndResult.larger,
      children: [
        TwoAndFourDots(dotsEndResult: DotsEndResult.smaller),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
        ),
        TwoAndOneDots(
          dotsEndResult: DotsEndResult.larger,
          dotsPosition: DotsPosition.topRightBottomLeft,
        ),
      ],
    );
  }

  @override
  Widget fromSix(DiceProperties diceProperties) {
    final tween = Tween<double>(begin: 0, end: diceProperties.maxOffset.dx);

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              top: position,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              top: position,
              right: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: position,
              right: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: position,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              left: position,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              right: position,
              child: const DiceDot(),
            ),
          ),
        ],
      ),
    );
  }
}
