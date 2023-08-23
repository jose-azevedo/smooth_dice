import 'package:flutter/material.dart';

import '../dice.dart';
import 'dice_dot.dart';

class OneToOneAnimation extends StatefulWidget {
  const OneToOneAnimation({super.key});

  @override
  State<OneToOneAnimation> createState() => _OneToOneAnimationState();
}

class _OneToOneAnimationState extends State<OneToOneAnimation> {
  double endPosition = 0;

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);

    void onEnd() {
      setState(() => endPosition = diceProperties.maxOffset.dx / 2);
    }

    return SizedBox.expand(
      child: Stack(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(
                begin: diceProperties.maxOffset.dx / 2, end: endPosition),
            duration: diceProperties.duration,
            onEnd: onEnd,
            builder: (_, position, __) => Stack(
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
                  left: position,
                  child: const DiceDot(),
                ),
                Positioned(
                  bottom: position,
                  right: position,
                  child: const DiceDot(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
