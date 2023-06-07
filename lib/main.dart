import 'package:flutter/material.dart';
import 'package:outpost/presentation/title_screen.dart';

void main() {
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
