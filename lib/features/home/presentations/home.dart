import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/add_task/manager/cubit/add_task_cubit.dart';
import 'package:todo/features/add_task/presentations/add_task.dart';
import 'package:todo/features/opening_page/manager/cubit/profile_cubit.dart';
import 'package:todo/features/opening_page/manager/cubit/profile_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is GetUserSuccess) {
                    return DefaultRow(
                      iconButton: IconButton(
                          onPressed: () {
                            navigateTo(context,
                                screen: BlocProvider(
                                    create: (context) => TaskCubit(),
                                    child: Add_task()));
                          },
                          icon: Icon(Icons.add_outlined)),
                      name: state.user.name,
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
                height: 60,
              ),
              Text(
                "There are no tasks yet,\n      Press the button\n      To add New Task ",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Lexend Deca",
                    fontWeight: FontWeight.w300,
                    color: Color(0xff24252C)),
              ),
              SizedBox(
                height: 55,
              ),
              Image.asset(AppAsset.person_imae)
            ],
          ),
        );
      }),
    );
  }
}
