import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_colors.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/add_task/presentations/add_task2.dart';
import 'package:todo/features/home/presentations/widgets/task_cont.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(builder: (context) {
        ProfileCubit.get(context).getUser();
        return Scaffold(
            body: Column(children: [
          SizedBox(
            height: 10,
          ),
          BlocBuilder<ProfileCubit, AuthState>(
            builder: (context, state) {
              if (state is GetUserSuccess) {
                return DefaultRow(
                  iconButton: IconButton(
                      onPressed: () {
                        navigateTo(context, screen: AddTask2());
                      },
                      icon: Icon(Icons.add_outlined)),
                  name: state.username,
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
            height: 50,
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Text(
                        AppString.tasks_text,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff24252C)),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 15,
                        height: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.teal[100],
                        ),
                        child: Text(
                          "5",
                          style: TextStyle(color: AppColors.darkGreen),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TaskContainer(desc: "Improve my English skills \nby trying to speek",title: "My First Task",)
        ]));
      }),
    );
  }
}
