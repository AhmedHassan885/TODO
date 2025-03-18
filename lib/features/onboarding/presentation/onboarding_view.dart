// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/constants/app_constant.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/resource_manager/app_colors.dart';
import 'package:todo/features/onboarding/presentation/lets_start.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigateTo(context, screen: Lets());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset(AppAsset.true_sign)),
          SizedBox(height: 30),
          Text(
            AppConstant.app_name,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 36,
                color: AppColors.darkGreen),
          )
        ],
      ),
    );
  }
}
