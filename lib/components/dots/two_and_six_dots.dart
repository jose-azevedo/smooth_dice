import 'package:flutter/material.dart';
import 'package:smooth_dice/components/dots/two_and_four_dots.dart';

import '../dice.dart';
import 'dice_dot.dart';

class TwoAndSixDots extends StatelessWidget {
  const TwoAndSixDots({
    super.key,
    this.dotsEndResult = DotsEndResult.larger,
    this.transitionAxis = Axis.vertical,
    this.children = const [],
  });

  final DotsEndResult dotsEndResult;
  final Axis transitionAxis;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    double startPosition = diceProperties.maxOffset.dx / 2;
    double endPosition = 0;

    if (dotsEndResult == DotsEndResult.smaller) {
      startPosition = 0;
      endPosition = diceProperties.maxOffset.dx / 2;
    }

    return TwoAndFourDots(
      transitionAxis: transitionAxis,
      dotsEndResult: dotsEndResult,
      children: [
        ...children,
        AnimatedPositioned(
          duration: diceProperties.duration,
          top: diceProperties.shouldAnimate ? startPosition : endPosition,
          left: 0,
          child: const DiceDot(),
        ),
        AnimatedPositioned(
          duration: diceProperties.duration,
          bottom: diceProperties.shouldAnimate ? startPosition : endPosition,
          right: 0,
          child: const DiceDot(),
        ),
      ],
    );
  }
}
