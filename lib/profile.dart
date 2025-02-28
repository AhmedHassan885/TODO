import 'package:flutter/material.dart';
import 'package:todo/config/Default.dart';
import 'package:todo/config/app_asset.dart';
import 'package:todo/home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            AppAsset.palstine_image,
            fit: BoxFit.cover,
            width: 450,
            height: 400,
          ),
          SizedBox(
            height: 35,
          ),
          DefaultFormField(
            labelText: "Your Name",
            hint: "type your name here",
          ),
          SizedBox(
            height: 30,
          ),
          Button(text: "Save", destination: Home())
        ],
      ),
    );
  }
}
