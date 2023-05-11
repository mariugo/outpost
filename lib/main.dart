import 'package:flutter/material.dart';
import 'package:outpost/styles.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //setWindowMinSize(const Size(800, 500));
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
      home: Scaffold(
        body: Center(
          child: Text(
            'Insert Next-Generation UI Here...',
            style: TextStyles.h2,
          ),
        ),
      ),
    );
  }
}
