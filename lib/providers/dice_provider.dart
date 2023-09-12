import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/dice.dart';

final diceProvider =
    StateNotifierProvider<DiceNotifier, List<GlobalKey<DiceState>>>((ref) {
  return DiceNotifier();
});

class DiceNotifier extends StateNotifier<List<GlobalKey<DiceState>>> {
  DiceNotifier() : super([GlobalKey<DiceState>()]);

  void addDice() {
    state.add(GlobalKey<DiceState>());
    state = [...state];
  }

  void removeDice() {
    if (state.isNotEmpty) {
      state.removeLast();
      state = [...state];
    }
  }

  void rollDices() {
    for (final key in state) {
      key.currentState?.roll();
    }
  }
}
