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
  });

  final AnimationDirection animationDirection;
  final DotsPosition dotsPosition;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    double startWidth = diceProperties.maxOffset.dx;
    double startHeight = diceProperties.maxOffset.dy;
    double finalWidth = diceProperties.dotSize;
    double finalHeight = diceProperties.dotSize;

    if (animationDirection == AnimationDirection.outwards) {
      startWidth = diceProperties.dotSize;
      startHeight = diceProperties.dotSize;
      finalWidth = diceProperties.maxOffset.dx;
      finalHeight = diceProperties.maxOffset.dy;
    }

    return AnimatedContainer(
      duration: diceProperties.duration,
      curve: Curves.easeInOutCirc,
      width: diceProperties.shouldAnimate ? finalWidth : startWidth,
      height: diceProperties.shouldAnimate ? finalHeight : startHeight,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: dotsPosition == DotsPosition.topLeftBottomRight ? 0 : null,
            right: dotsPosition == DotsPosition.topRightBottomLeft ? 0 : null,
            child: const DiceDot(),
          ),
          Positioned(
            bottom: 0,
            left: dotsPosition == DotsPosition.topRightBottomLeft ? 0 : null,
            right: dotsPosition == DotsPosition.topLeftBottomRight ? 0 : null,
            child: const DiceDot(),
          ),
        ],
      ),
    );
  }
}
