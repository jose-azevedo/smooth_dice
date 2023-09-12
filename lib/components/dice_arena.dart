import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dice_provider.dart';
import 'dice.dart';

class DiceArena extends ConsumerWidget {
  const DiceArena({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keys = ref.watch(diceProvider);

    return Center(
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: keys
            .map(
              (key) => Dice(1, key: key),
            )
            .toList(),
      ),
    );
  }
}
