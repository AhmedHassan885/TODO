import 'package:flutter/material.dart';
import 'package:todo/config/app_colors.dart';
import 'package:todo/lets_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.BackgroundColor,
          appBarTheme: AppBarTheme(color: AppColors.BackgroundColor)),
      home: Lets(),
    );
  }
}
