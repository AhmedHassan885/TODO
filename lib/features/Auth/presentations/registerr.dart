// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/image_manager/image_manager_view.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/Auth/presentations/login_view.dart';

class Register extends StatelessWidget {
  Register({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Column(
            children: [
             ImageManagerView(
                      onSelected: (XFile image) {},
                      selectedImageBuilder: (XFile image) {
                        return Container(
                          width: double.infinity,
                          height: 298,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: FileImage(File(image.path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      unSelectedImageBuilder: () {
                        return Container(
                          width: double.infinity,
                          height: 298,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: AssetImage(AppAsset.palstine_image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
              SizedBox(
                height: 35,
              ),
              DefaulTextFormField2(
                H: AppString.user_hText,
                secure: false,
                controller: ProfileCubit.get(context).username_Controller,
              ),
              DefaulTextFormField2(
                H: AppString.password_hText,
                secure: true,
                controller: ProfileCubit.get(context).password_Controller,
              ),
              DefaulTextFormField2(
                H: AppString.confirm_password_hText,
                secure: true,
                controller:
                    ProfileCubit.get(context).confirm_password_Controller,
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<ProfileCubit, AuthState>(
                builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return CircularProgressIndicator();
                  } else {
                    return Button(
                      text: AppString.register_btn,
                      onPressed: () {
                        ProfileCubit.get(context).onRegister();
                      },
                    );
                  }
                },
                listener: (context, state) {
                  print(state.toString());
                  if (state is RegisterSuccessState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.msg)));
                    navigateTo(context, screen: Login());
                  } else if (state is RegisterErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error),
                    ));
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    navigateTo(context, screen: Login());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have An Account?    ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Login",
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
