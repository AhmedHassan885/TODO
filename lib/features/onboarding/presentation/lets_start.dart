// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/presentations/registerr.dart';

class Lets extends StatelessWidget {
  const Lets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset(
              AppAsset.lets,
            ),
          ),
          Text(
            AppString.welcome_text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            AppString.opening_text,
            style: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Button(
            text: AppString.Lets_btn,
            onPressed: () {
              navigateTo(context,
                  screen: BlocProvider(
                      create: (context) => ProfileCubit(), child: Register()));
            },
          ),
        ],
      ),
    );
  }
}
