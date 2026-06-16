import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const BeafoxApp());
}

class BeafoxApp extends StatelessWidget {
  const BeafoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beafox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEB8A26)),
      ),
      home: const LoginScreen(),
    );
  }
}
