import 'package:example/home_page.dart';
import 'package:example/service/common_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommonService(),
      child: const MaterialApp(
        title: 'Custom Components',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
