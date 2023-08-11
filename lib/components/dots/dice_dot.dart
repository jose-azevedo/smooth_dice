import 'package:flutter/material.dart';

import '../dice.dart';

class DiceDot extends StatelessWidget {
  const DiceDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DiceProperties.of(context).dotSize,
      width: DiceProperties.of(context).dotSize,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
