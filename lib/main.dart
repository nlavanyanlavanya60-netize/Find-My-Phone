import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FindMyPhoneApp());
}

class FindMyPhoneApp extends StatelessWidget {
  const FindMyPhoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find My Phone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0.5,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
