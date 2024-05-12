import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sip_calculator/core/constants/theme.dart';
import 'package:sip_calculator/presentation/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sip Calculator',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: lightTheme,
      home: const HomePage(),
    );
  }
}
