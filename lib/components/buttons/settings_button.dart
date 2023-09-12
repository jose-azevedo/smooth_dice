import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dice_provider.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => ref.read(diceProvider.notifier).removeDice(),
                  icon: const Icon(
                    Icons.remove_rounded,
                    size: 50,
                  ),
                ),
                IconButton(
                  onPressed: () => ref.read(diceProvider.notifier).addDice(),
                  icon: const Icon(
                    Icons.add_rounded,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.settings_outlined),
    );
  }
}
