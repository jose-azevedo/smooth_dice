import 'dart:math';

import 'package:flutter/material.dart';

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
    2: TwoValueDiceFace(),
    3: ThreeValueDiceFace(),
    4: FourValueDiceFace(),
    5: FiveValueDiceFace(),
    6: SixValueDiceFace(),
  };

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  late int _value;
  int? _nextValue;
  bool _shouldAnimate = false;
  final duration = const Duration(milliseconds: 200);

  int get value => _value;

  @override
  void initState() {
    _value = widget.initialValue;

    super.initState();
  }

  Future<int> roll() async {
    setState(() {
      _nextValue = Random().nextInt(6) + 1;
      _shouldAnimate = false;
    });

    await Future.delayed(duration);

    setState(() => _shouldAnimate = true);

    await Future.delayed(duration);

    setState(() {
      _value = _nextValue!;
    });

    return _value;
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
              shouldAnimate: _shouldAnimate,
              duration: duration,
              constraints: constraints,
              nextValue: _nextValue,
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
  final int? nextValue;
  final double dotSize;
  final bool shouldAnimate;
  final Duration duration;
  final BoxConstraints constraints;
  final Offset maxOffset;

  DiceProperties({
    super.key,
    this.nextValue,
    required super.child,
    required this.size,
    required this.shouldAnimate,
    required this.duration,
    required this.constraints,
  })  : dotSize = size * 10 / 75,
        maxOffset = Offset(constraints.maxHeight - size * 10 / 75,
            constraints.maxWidth - size * 10 / 75);

  static DiceProperties? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DiceProperties>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class TwoValueDiceFace extends StatelessWidget {
  const TwoValueDiceFace({super.key});

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
}

class ThreeValueDiceFace extends StatelessWidget {
  const ThreeValueDiceFace({super.key});

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
          DiceDot(),
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
}

class FourValueDiceFace extends StatelessWidget {
  const FourValueDiceFace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
        ],
      ),
    );
  }
}

class FiveValueDiceFace extends StatelessWidget {
  const FiveValueDiceFace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          DiceDot(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
        ],
      ),
    );
  }
}

class SixValueDiceFace extends StatelessWidget {
  const SixValueDiceFace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiceDot(),
              DiceDot(),
            ],
          ),
        ],
      ),
    );
  }
}

class DiceDot extends StatelessWidget {
  const DiceDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DiceProperties.of(context)?.dotSize ?? 10,
      width: DiceProperties.of(context)?.dotSize ?? 10,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
