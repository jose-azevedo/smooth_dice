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

    double startPosition = diceProperties.maxOffset.dx;
    double endPosition = 0;

    if (dotsEndResult == DotsEndResult.smaller) {
      startPosition = 0;
      endPosition = diceProperties.maxOffset.dx;
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
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate && transitionAxis == Axis.vertical
                ? startPosition
                : endPosition,
            left: diceProperties.shouldAnimate &&
                    transitionAxis == Axis.horizontal
                ? startPosition
                : endPosition,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate && transitionAxis == Axis.vertical
                    ? startPosition
                    : endPosition,
            right: diceProperties.shouldAnimate &&
                    transitionAxis == Axis.horizontal
                ? startPosition
                : endPosition,
            child: const DiceDot(),
          ),
        ],
      ),
    );
  }
}
