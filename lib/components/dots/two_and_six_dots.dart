import 'package:flutter/material.dart';

import '../dice.dart';
import 'dots.dart';

class TwoAndSixDots extends StatelessWidget {
  const TwoAndSixDots({
    super.key,
    required this.dotsEndResult,
    this.transitionAxis = Axis.vertical,
    this.children = const [],
  });

  final DotsEndResult dotsEndResult;
  final Axis transitionAxis;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    Tween<double> tween = Tween(begin: 0, end: diceProperties.maxOffset.dx / 2);

    if (dotsEndResult == DotsEndResult.smaller) {
      tween = Tween(begin: diceProperties.maxOffset.dx / 2, end: 0);
    }

    return TwoAndFourDots(
      transitionAxis: transitionAxis,
      dotsEndResult: dotsEndResult,
      children: [
        ...children,
        TweenAnimationBuilder(
          tween: tween,
          duration: diceProperties.duration,
          builder: (_, position, __) => AnimatedPositioned(
            duration: diceProperties.duration,
            top: position,
            left: 0,
            child: const DiceDot(),
          ),
        ),
        TweenAnimationBuilder(
          tween: tween,
          duration: diceProperties.duration,
          builder: (_, position, __) => AnimatedPositioned(
            duration: diceProperties.duration,
            bottom: position,
            right: 0,
            child: const DiceDot(),
          ),
        ),
      ],
    );
  }
}
