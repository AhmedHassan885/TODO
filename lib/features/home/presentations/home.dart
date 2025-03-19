// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/add_task/manager/cubit/ad_task_state.dart';
import 'package:todo/features/add_task/manager/cubit/add_task_cubit.dart';
import 'package:todo/features/add_task/presentations/add_task2.dart';
import 'package:todo/features/home/manager/cubit/task_cubit.dart';
import 'package:todo/features/home/presentations/widgets/task_cont.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..getUser()),
        BlocProvider(create: (context) => GetTasksCubit()),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 10),
              BlocBuilder<ProfileCubit, AuthState>(
                builder: (context, state) {
                  if (state is GetUserSuccess) {
                    return DefaultRow(
                      iconButton: IconButton(
                        onPressed: () {
                          navigateTo(context, screen: AddTask2());
                        },
                        icon: const Icon(Icons.add_outlined),
                      ),
                      name: state.username,
                    );
                  }
                  return const SafeArea(child: Text("Loading..."));
                },
              ),
              const SizedBox(height: 60),
              BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  if (state is TaskLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is TaskLoaded && state.tasks.isNotEmpty) {
                    return Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Row(
                              children: [
                                const Text(
                                  "Tasks",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff24252C),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                Container(
                                  alignment: Alignment.center,
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.teal[100],
                                  ),
                                  child: Text(
                                    "${state.tasks.length}",
                                    style: const TextStyle(color: Colors.teal),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.tasks.length,
                              itemBuilder: (context, index) {
                                final task = state.tasks[index];
                                return TaskContainer(
                                  title: "",
                                  desc: "",
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Text(
                      "There are no tasks yet,\n      Press the button\n      To add New Task ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff24252C),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 55),
              Image.asset(AppAsset.person_imae),
            ],
          ),
        );
      }),
    );
  }
}
