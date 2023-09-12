import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/buttons/roll_button.dart';
import '../components/buttons/settings_button.dart';
import '../components/dice_arena.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smooth Dice',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [
          SettingsButton(),
        ],
      ),
      body: const DiceArena(),
      floatingActionButton: const RollButton(),
    );
  }
}
