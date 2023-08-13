import 'package:flutter/material.dart';

import '../dice.dart';
import 'dice_dot.dart';

enum AnimationDirection { inwards, outwards }

enum DotsPosition { topLeftBottomRight, topRightBottomLeft }

class TwoOppositeDots extends StatelessWidget {
  const TwoOppositeDots({
    super.key,
    this.animationDirection = AnimationDirection.inwards,
    this.dotsPosition = DotsPosition.topLeftBottomRight,
    this.children = const [],
  });

  final AnimationDirection animationDirection;
  final DotsPosition dotsPosition;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    double startPosition = diceProperties.maxOffset.dx / 2;
    double endPosition = 0;

    if (animationDirection == AnimationDirection.outwards) {
      startPosition = 0;
      endPosition = diceProperties.maxOffset.dx / 2;
    }

    return SizedBox.expand(
      child: Transform.flip(
        flipX: dotsPosition == DotsPosition.topRightBottomLeft,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...children,
            AnimatedPositioned(
              duration: diceProperties.duration,
              curve: Curves.easeInOutCirc,
              top: diceProperties.shouldAnimate ? startPosition : endPosition,
              left: diceProperties.shouldAnimate ? startPosition : endPosition,
              child: const DiceDot(),
            ),
            AnimatedPositioned(
              duration: diceProperties.duration,
              curve: Curves.easeInOutCirc,
              bottom:
                  diceProperties.shouldAnimate ? startPosition : endPosition,
              right: diceProperties.shouldAnimate ? startPosition : endPosition,
              child: const DiceDot(),
            ),
          ],
        ),
      ),
    );
  }
}
