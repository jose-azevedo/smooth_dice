import 'package:flutter/material.dart';

export 'one_dice_face.dart';
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
        1: fromOne,
        2: fromTwo,
        3: fromThree,
        4: fromFour,
        5: fromFive,
        6: fromSix,
      };

  @override
  Widget build(BuildContext context) {
    final diceProperties = DiceProperties.of(context);
    final builder = transitions[diceProperties.lastValue];
    return SizedBox(
      key: ValueKey(UniqueKey()),
      child: builder!(diceProperties),
    );
  }

  Widget fromOne(DiceProperties diceProperties);
  Widget fromTwo(DiceProperties diceProperties);
  Widget fromThree(DiceProperties diceProperties);
  Widget fromFour(DiceProperties diceProperties);
  Widget fromFive(DiceProperties diceProperties);
  Widget fromSix(DiceProperties diceProperties);
}
