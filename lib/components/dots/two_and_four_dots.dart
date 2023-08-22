import 'package:flutter/material.dart';

import '../dice.dart';
import 'dice_dot.dart';

enum DotsEndResult {
  larger,
  smaller,
}

class TwoAndFourDots extends StatelessWidget {
  const TwoAndFourDots({
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

    Tween<double> tween = Tween(begin: diceProperties.maxOffset.dx, end: 0);

    if (dotsEndResult == DotsEndResult.smaller) {
      tween = Tween(begin: 0, end: diceProperties.maxOffset.dx);
    }

    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...children,
          const Positioned(
            top: 0,
            left: 0,
            child: DiceDot(),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: DiceDot(),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => AnimatedPositioned(
              duration: diceProperties.duration,
              top: transitionAxis == Axis.vertical ? position : 0,
              left: transitionAxis == Axis.horizontal ? position : 0,
              child: const DiceDot(),
            ),
          ),
          TweenAnimationBuilder(
            tween: tween,
            duration: diceProperties.duration,
            builder: (_, position, __) => AnimatedPositioned(
              duration: diceProperties.duration,
              bottom: transitionAxis == Axis.vertical ? position : 0,
              right: transitionAxis == Axis.horizontal ? position : 0,
              child: const DiceDot(),
            ),
          ),
        ],
      ),
    );
  }
}
