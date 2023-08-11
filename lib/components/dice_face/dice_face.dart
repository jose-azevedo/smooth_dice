import 'package:flutter/material.dart';

export 'two_dice_face.dart';
export 'three_dice_face.dart';
export 'four_dice_face.dart';
export 'five_dice_face.dart';
export 'six_dice_face.dart';

import '../dice.dart';

abstract class DiceFace extends StatelessWidget {
  const DiceFace({super.key});

  int get faceValue;

  Map<int, Widget Function(DiceProperties)> get transitions => {
        1: toOne,
        2: toTwo,
        3: toThree,
        4: toFour,
        5: toFive,
        6: toSix,
      };

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);
    final builder = transitions[diceProperties!.nextValue ?? faceValue];
    return SizedBox(
      key: ValueKey(diceProperties.nextValue),
      child: builder!(diceProperties),
    );
  }

  Widget toOne(DiceProperties diceProperties);
  Widget toTwo(DiceProperties diceProperties);
  Widget toThree(DiceProperties diceProperties);
  Widget toFour(DiceProperties diceProperties);
  Widget toFive(DiceProperties diceProperties);
  Widget toSix(DiceProperties diceProperties);
}
