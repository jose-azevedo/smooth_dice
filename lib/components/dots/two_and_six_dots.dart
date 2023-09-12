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

    return TweenAnimationBuilder(
      tween: tween,
      duration: diceProperties.duration,
      curve: diceProperties.curve,
      builder: (_, position, __) => TwoAndFourDots(
        transitionAxis: transitionAxis,
        dotsEndResult: dotsEndResult,
        children: [
          ...children,
          Positioned(
            top: position,
            left: 0,
            child: const DiceDot(),
          ),
          Positioned(
            bottom: position,
            right: 0,
            child: const DiceDot(),
          ),
        ],
      ),
    );
  }
}
