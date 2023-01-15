import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Dice',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getThemeData(),
      home: const HomePage(),
    );
  }
}
