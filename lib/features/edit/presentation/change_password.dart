// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/edit/manager/cubit/edit_cubit.dart';
import 'package:todo/features/edit/manager/cubit/edit_state.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
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
              SizedBox(height: 15),
              DefaulTextFormField2(
                H: AppString.old_password_hText,
                secure: true,
                controller:
                    ChangePasswordCubit.get(context).currentPasswordController,
              ),
              DefaulTextFormField2(
                H: AppString.new_password_hText,
                secure: true,
                controller:
                    ChangePasswordCubit.get(context).newPasswordController,
              ),
              DefaulTextFormField2(
                H: AppString.confirm_password_hText,
                secure: true,
                controller:
                    ChangePasswordCubit.get(context).confirmPasswordController,
              ),
              SizedBox(height: 5),
              BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.green),
                    );
                  } else if (state is ChangePasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: Colors.red),
                    );
                  }
                },
                builder: (context, state) {
                  return state is ChangePasswordLoading
                      ? CircularProgressIndicator()
                      : Button(
                          onPressed: () {
                            ChangePasswordCubit.get(context).changePassword();
                          },
                          text: AppString.save_btn,
                        );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
