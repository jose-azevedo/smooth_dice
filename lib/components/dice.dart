import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice(
    this.value, {
    super.key,
    this.size = 75,
  }) : assert(value > 0 && value <= 6);

  final int value;
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      padding: EdgeInsets.all(size * 0.16),
      margin: EdgeInsets.all(size * 0.066),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.secondary,
          width: 5,
        ),
      ),
      child: DiceProperties(
        size: size,
        child: _diceFaces[value]!,
      ),
    );
  }
}

class DiceProperties extends InheritedWidget {
  final double size;
  final double dotSize;

  const DiceProperties({
    super.key,
    required super.child,
    required this.size,
  }) : dotSize = size * 10 / 75;

  static DiceProperties? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DiceProperties>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class TwoValueDiceFace extends StatelessWidget {
  const TwoValueDiceFace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              DiceDot(),
              Spacer(),
            ],
          ),
          Row(
            children: const [
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
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              DiceDot(),
              Spacer(),
            ],
          ),
          const DiceDot(),
          Row(
            children: const [
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
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DiceDot(),
              DiceDot(),
            ],
          ),
          const DiceDot(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DiceDot(),
              DiceDot(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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
