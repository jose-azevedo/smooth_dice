import 'package:flutter/material.dart';

import '../dice.dart';
import 'dice_face.dart';

class TwoDiceFace extends DiceFace {
  const TwoDiceFace({super.key});

  @override
  int get faceValue => 2;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DiceDot(),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Spacer(),
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
