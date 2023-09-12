import 'dart:math';

import 'package:flutter/material.dart';

import 'dice_face/dice_face.dart';

class Dice extends StatefulWidget {
  const Dice(
    this.initialValue, {
    super.key,
    this.size = 75,
    this.disabled = false,
  }) : assert(initialValue > 0 && initialValue <= 6);

  final int initialValue;
  final double size;
  final bool disabled;

  static const _diceFaces = {
    1: OneDiceFace(),
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
  final duration = const Duration(milliseconds: 300);
  final Curve curve = Curves.easeInOutCubicEmphasized;

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
      onTap: widget.disabled ? null : roll,
      child: Container(
        height: widget.size,
        width: widget.size,
        alignment: Alignment.center,
        padding: EdgeInsets.all(widget.size * 12 / 75),
        margin: EdgeInsets.all(widget.size * 5 / 75),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(widget.size * 10 / 75),
          border: Border.all(
            color: theme.colorScheme.primary,
            width: widget.size * 5 / 75,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return DiceProperties(
              key: ValueKey(_value),
              size: widget.size,
              duration: duration,
              curve: curve,
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
  final Curve curve;
  final BoxConstraints constraints;
  final Offset maxOffset;

  DiceProperties({
    super.key,
    this.lastValue,
    required super.child,
    required this.size,
    required this.duration,
    required this.curve,
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
