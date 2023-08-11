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

class TwoValueDiceFace extends DiceFace {
  const TwoValueDiceFace({super.key});

  @override
  int get faceValue => 2;

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

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
  }
}

class ThreeValueDiceFace extends DiceFace {
  const ThreeValueDiceFace({super.key});

  @override
  int get faceValue => 3;

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

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
  }
}

class FourValueDiceFace extends DiceFace {
  const FourValueDiceFace({super.key});

  @override
  int get faceValue => 4;

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

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
  }
}

class FiveValueDiceFace extends DiceFace {
  const FiveValueDiceFace({super.key});

  @override
  int get faceValue => 5;

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

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
  }
}

class SixValueDiceFace extends DiceFace {
  const SixValueDiceFace({super.key});

  @override
  int get faceValue => 6;

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

  @override
  Widget toFive(DiceProperties diceProperties) {
    // TODO: implement toFive
    throw UnimplementedError();
  }

  @override
  Widget toFour(DiceProperties diceProperties) {
    // TODO: implement toFour
    throw UnimplementedError();
  }

  @override
  Widget toOne(DiceProperties diceProperties) {
    // TODO: implement toOne
    throw UnimplementedError();
  }

  @override
  Widget toSix(DiceProperties diceProperties) {
    // TODO: implement toSix
    throw UnimplementedError();
  }

  @override
  Widget toThree(DiceProperties diceProperties) {
    // TODO: implement toThree
    throw UnimplementedError();
  }

  @override
  Widget toTwo(DiceProperties diceProperties) {
    // TODO: implement toTwo
    throw UnimplementedError();
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
