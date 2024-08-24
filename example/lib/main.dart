import 'package:custom_components/custom_components.dart';
import 'package:example/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Components',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: CustomTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
