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

class AddTask2 extends StatelessWidget {
  AddTask2({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          centerTitle: true,
          title: Text(
            "Add Task",
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                fontFamily: "Lexend Deca",
                color: Color(0xff24252C)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 261,
              height: 197,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image.asset(
                AppAsset.palstine_image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            DefaulTextFormField2(
              H: "Title",
              secure: false, controller:TextEditingController(),
            ),
            DefaulTextFormField2(
              H: "Description",
              secure: false, controller: TextEditingController(),
            ),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return CircularProgressIndicator();
                }
                return Button(
                  text: "Add Task",
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
