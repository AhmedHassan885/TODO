// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/Auth/presentations/registerr.dart';
import 'package:todo/features/home/presentations/home.dart';

class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            children: [
              Image.asset(
                AppAsset.palstine_image,
                fit: BoxFit.cover,
                width: 450,
                height: 300,
              ),
              SizedBox(
                height: 35,
              ),
              DefaulTextFormField2(
                H: AppString.user_hText,
                secure: false,
                controller: ProfileCubit.get(context).login_name_Controller,
              ),
              DefaulTextFormField2(
                H: AppString.password_hText,
                secure: true,
                controller: ProfileCubit.get(context).Login_pass_Controller,
              ),
              SizedBox(
                height: 30,
              ),
              BlocListener<ProfileCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    
                    navigateTo(context, screen: Home());
                  } else if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                child: Button(
                  text: AppString.login_btn,
                  onPressed: () {
                    ProfileCubit.get(context).onLogin();
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    navigateTo(context, screen: Register());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have An Account?     ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ))
            ],
          );
        }),
      ),
    );
  }
}
