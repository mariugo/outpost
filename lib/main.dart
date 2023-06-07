import 'package:flutter/material.dart';
import 'package:outpost/presentation/screens/title_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const NextGenApp());
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const TitleScreen(),
    );
  }
}
