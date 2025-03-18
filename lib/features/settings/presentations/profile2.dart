import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/edit/presentation/change_password.dart';
import 'package:todo/features/settings/presentations/update_profile.dart';
import 'package:todo/features/settings/presentations/widgets/default_container.dart';

class Profile2 extends StatelessWidget {
  const Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(builder: (context) {
        ProfileCubit.get(context).getUser();
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              BlocBuilder<ProfileCubit, AuthState>(
                builder: (context, state) {
                  if (state is GetUserSuccess) {
                    return DefaultRow(
                      name: state.username,
                      iconButton: Text(""),
                    );
                  }
                  return SafeArea(
                    child: Text(
                      "Mt",
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    navigateTo(context, screen: Update());
                  },
                  child: DefaultContainer(
                      icon: Icon(Icons.person),
                      title: AppString.updatePro_text)),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    navigateTo(context,
                        screen:  ChangePassword());
                  },
                  child: DefaultContainer(
                      icon: Icon(Icons.lock),
                      title: AppString.changePass_text)),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    
                  },
                  child: DefaultContainer(
                      icon: Icon(Icons.settings),
                      title: AppString.settings_text)),
            ],
          ),
        );
      }),
    );
  }
}
