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

    Tween<double> tween = Tween(begin: 0, end: diceProperties.maxOffset.dx / 2);

    if (animationDirection == AnimationDirection.outwards) {
      tween = Tween(begin: diceProperties.maxOffset.dx / 2, end: 0);
    }

    return SizedBox.expand(
      child: Transform.flip(
        flipX: dotsPosition == DotsPosition.topRightBottomLeft,
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
