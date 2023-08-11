import 'package:flutter/material.dart';

import '../dice.dart';
import 'dice_face.dart';

class TwoDiceFace extends DiceFace {
  const TwoDiceFace({super.key});

  @override
  int get faceValue => 2;

  @override
  Widget toOne(DiceProperties diceProperties) {
    return AnimatedContainer(
      duration: diceProperties.duration,
      curve: Curves.easeInOutCirc,
      width: diceProperties.shouldAnimate
          ? diceProperties.dotSize
          : diceProperties.maxOffset.dx,
      height: diceProperties.shouldAnimate
          ? diceProperties.dotSize
          : diceProperties.maxOffset.dy,
      child: const Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: DiceDot(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: DiceDot(),
          ),
        ],
      ),
    );
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dx : 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dx : 0,
            child: const DiceDot(),
          ),
        ],
      ),
    );
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
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
          AnimatedContainer(
            duration: diceProperties.duration,
            curve: Curves.linear,
            width: diceProperties.shouldAnimate
                ? diceProperties.dotSize
                : diceProperties.maxOffset.dx,
            height: diceProperties.shouldAnimate
                ? diceProperties.dotSize
                : diceProperties.maxOffset.dy,
            child: const Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: DiceDot(),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: DiceDot(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right: 0,
            child: const DiceDot(),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: DiceDot(),
          ),
        ],
      ),
    );
  }

  @override
  Widget toFive(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
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
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right: 0,
            child: const DiceDot(),
          ),
          AnimatedContainer(
            duration: diceProperties.duration,
            curve: Curves.linear,
            width: diceProperties.shouldAnimate
                ? diceProperties.dotSize
                : diceProperties.maxOffset.dx,
            height: diceProperties.shouldAnimate
                ? diceProperties.dotSize
                : diceProperties.maxOffset.dy,
            child: const Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: DiceDot(),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: DiceDot(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            left: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            top: diceProperties.shouldAnimate
                ? diceProperties.maxOffset.dy / 2
                : 0,
            left: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom:
                diceProperties.shouldAnimate ? diceProperties.maxOffset.dy : 0,
            right: 0,
            child: const DiceDot(),
          ),
          AnimatedPositioned(
            duration: diceProperties.duration,
            bottom: diceProperties.shouldAnimate
                ? diceProperties.maxOffset.dy / 2
                : 0,
            right: 0,
            child: const DiceDot(),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: DiceDot(),
          ),
        ],
      ),
    );
  }
}
