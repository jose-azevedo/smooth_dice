import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';

import '../dice.dart';
import 'dice_dot.dart';

enum DotsPosition { topLeftBottomRight, bottomLeftTopRight }

class TwoAndOneDots extends StatelessWidget {
  const TwoAndOneDots({
    super.key,
    required this.dotsEndResult,
    this.dotsPosition = DotsPosition.topLeftBottomRight,
    this.children = const [],
  });

  final DotsEndResult dotsEndResult;
  final DotsPosition dotsPosition;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    Tween<double> tween = Tween(begin: diceProperties.maxOffset.dx / 2, end: 0);

    if (dotsEndResult == DotsEndResult.smaller) {
      tween = Tween(begin: 0, end: diceProperties.maxOffset.dx / 2);
    }

    return SizedBox.expand(
      child: Transform.flip(
        flipX: dotsPosition == DotsPosition.bottomLeftTopRight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...children,
            TweenAnimationBuilder(
              tween: tween,
              duration: diceProperties.duration,
              builder: (_, position, __) => AnimatedPositioned(
                duration: diceProperties.duration,
                top: position,
                left: position,
                child: const DiceDot(),
              ),
            ),
            TweenAnimationBuilder(
              tween: tween,
              duration: diceProperties.duration,
              builder: (_, position, __) => AnimatedPositioned(
                duration: diceProperties.duration,
                bottom: position,
                right: position,
                child: const DiceDot(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
