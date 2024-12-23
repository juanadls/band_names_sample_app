import 'package:bands_names_sample_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band Names Sample app',
      initialRoute: "home",
      routes: {
        'home': (_) => const HomeScreen(),
      },
    );
  }
}
