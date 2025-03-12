import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/resource_manager/app_colors.dart';
import 'package:todo/features/add_task/presentations/add_task2.dart';
import 'package:todo/features/onboarding/presentation/onboarding_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Lexend Deca",
          scaffoldBackgroundColor: AppColors.BackgroundColor,
          appBarTheme: AppBarTheme(color: AppColors.BackgroundColor)),
      home: Onboarding(),
    );
  }
}
