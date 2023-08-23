import 'package:flutter/material.dart';

import '../dice.dart';
import 'dots.dart';

class OneAndSixDots extends StatelessWidget {
  const OneAndSixDots({
    super.key,
    required this.dotsEndResult,
  });

  final DotsEndResult dotsEndResult;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    Tween<double> tween = Tween(begin: diceProperties.maxOffset.dx / 2, end: 0);

    if (dotsEndResult == DotsEndResult.smaller) {
      tween = Tween(begin: 0, end: diceProperties.maxOffset.dx / 2);
    }

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
