import 'dart:math';

import 'package:flutter/material.dart';

import 'dice_face/dice_face.dart';
import 'dots/dice_dot.dart';

class Dice extends StatefulWidget {
  const Dice(
    this.initialValue, {
    super.key,
    this.size = 75,
  }) : assert(initialValue > 0 && initialValue <= 6);

  final int initialValue;
  final double size;

  static const _diceFaces = {
    1: DiceDot(),
    2: TwoDiceFace(),
    3: ThreeDiceFace(),
    4: FourDiceFace(),
    5: FiveDiceFace(),
    6: SixDiceFace(),
  };

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  late int _value;
  late int _lastValue;
  final duration = const Duration(milliseconds: 200);

  int get value => _value;

  @override
  void initState() {
    _value = widget.initialValue;
    _lastValue = _value;

    super.initState();
  }

  void roll() {
    setState(() {
      _lastValue = _value;
      _value = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: roll,
      child: Container(
        height: widget.size,
        width: widget.size,
        alignment: Alignment.center,
        padding: EdgeInsets.all(widget.size * 0.16),
        margin: EdgeInsets.all(widget.size * 0.066),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.colorScheme.secondary,
            width: 5,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return DiceProperties(
              key: ValueKey(_value),
              size: widget.size,
              duration: duration,
              constraints: constraints,
              lastValue: _lastValue,
              child: Dice._diceFaces[_value]!,
            );
          },
        ),
      ),
    );
  }
}

class DiceProperties extends InheritedWidget {
  final double size;
  final int? lastValue;
  final double dotSize;
  final Duration duration;
  final BoxConstraints constraints;
  final Offset maxOffset;

  DiceProperties({
    super.key,
    this.lastValue,
    required super.child,
    required this.size,
    required this.duration,
    required this.constraints,
  })  : dotSize = size * 10 / 75,
        maxOffset = Offset(constraints.maxHeight - size * 10 / 75,
            constraints.maxWidth - size * 10 / 75);

  static DiceProperties of(BuildContext context) {
    final properties =
        context.dependOnInheritedWidgetOfExactType<DiceProperties>();

    if (properties == null) {
      throw Exception('No DiceProperties found in context');
    }

    return properties;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
