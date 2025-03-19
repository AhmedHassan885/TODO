import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/presentations/login_view.dart';
import 'package:todo/features/settings/manager/cubit/settings_cubit.dart';
import 'package:todo/features/settings/manager/cubit/settings_state.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Form(
            key: UpdateProfileCubit.get(context).form,
            child: Column(
              children: [
                Image.asset(
                  AppAsset.palstine_image,
                  fit: BoxFit.cover,
                  width: 450,
                  height: 300,
                ),
                SizedBox(height: 15),
                DefaulTextFormField2(
                  H: AppString.user_hText,
                  secure: false,
                  controller:
                      UpdateProfileCubit.get(context).usernameController,
                ),
                SizedBox(height: 5),
                BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.green),
                      );
                      navigateTo(context, screen: Login());
                    } else if (state is UpdateProfileError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red),
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is UpdateProfileLoading
                        ? CircularProgressIndicator()
                        : Button(
                            onPressed: () {
                              UpdateProfileCubit.get(context).updateProfile();
                            },
                            text: AppString.update_btn,
                          );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
