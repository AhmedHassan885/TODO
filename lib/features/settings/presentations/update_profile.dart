// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/home/presentations/home.dart';
import 'package:todo/features/opening_page/manager/cubit/profile_cubit.dart';
import 'package:todo/features/opening_page/manager/cubit/profile_state.dart';

class Update extends StatelessWidget {
  Update({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        body: Column(
          children: [
            Image.asset(
              AppAsset.palstine_image,
              fit: BoxFit.cover,
              width: 450,
              height: 300,
            ),
            SizedBox(
              height: 15,
            ),
            DefaulTextFormField2(
              H: "Username",
              secure: false, controller: TextEditingController(),
            ),
            SizedBox(
              height: 5,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return CircularProgressIndicator();
                }
                return Button(
                  text: "Update",
                  onPressed: () {
                    ProfileCubit.get(context).saveProfile();
                  },
                );
              },
              listener: (context, state) {
                if (state is ProfileSuccess) {
                  navigateTo(context, screen: Home());
                } else if (state is ProfileError) {
                  Get.showSnackbar(GetSnackBar(
                    title: "error",
                    message: state.error,
                    duration: Duration(seconds: 3),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
