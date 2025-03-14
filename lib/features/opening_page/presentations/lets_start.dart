// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/opening_page/presentations/registerr.dart';

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
              // width: 302,
              // height: 343,
            ),
          ),
          Text(
            "Welcome To \n     Do It !",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Ready to conquer your tasks? Let's Do \n                       It together.",
            style: TextStyle(
              color: Color(0xff6E6A7C),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Button(
            text: "Let’s Start",
            onPressed: () {
              navigateTo( context,screen: Register());
            },
           

          ),
        ],
      ),
    );
  }
}
