import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dice_provider.dart';
import '../dice.dart';

class RollButton extends ConsumerStatefulWidget {
  const RollButton({
    super.key,
  });

  @override
  ConsumerState<RollButton> createState() => _RollButtonState();
}

class _RollButtonState extends ConsumerState<RollButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  @override
  void initState() {
    super.initState();

    _animation = Tween<double>(begin: 0, end: pi / 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _controller.forward(from: 0);
        ref.read(diceProvider.notifier).rollDices();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) => Transform.rotate(
          angle: _animation.value,
          child: const Dice(
            4,
            disabled: true,
            size: 30,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
