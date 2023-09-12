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
      child: TweenAnimationBuilder(
        tween: tween,
        duration: diceProperties.duration,
        builder: (_, position, __) => Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: position,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              top: position,
              right: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: position,
              right: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: position,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              left: position,
              child: const DiceDot(),
            ),
            Positioned(
              bottom: diceProperties.maxOffset.dy / 2,
              right: position,
              child: const DiceDot(),
            ),
          ],
        ),
      ),
    );
  }
}
