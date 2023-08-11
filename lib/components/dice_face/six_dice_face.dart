import 'package:flutter/material.dart';

import '../dice.dart';
import '../dots/dice_dot.dart';
import 'dice_face.dart';

class SixDiceFace extends DiceFace {
  const SixDiceFace({super.key});

  @override
  int get faceValue => 6;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
  }
}
