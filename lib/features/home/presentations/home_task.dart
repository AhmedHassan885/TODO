import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/Auth/manager/cubit/profile_cubit.dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';
import 'package:todo/features/add_task/presentations/add_task2.dart';
import 'package:todo/features/home/manager/cubit/task_cubit.dart';
import 'package:todo/features/home/manager/cubit/task_state.dart';
import 'package:todo/features/home/presentations/widgets/added_task.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({super.key});
  final int count = 4;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
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
              SizedBox(height: 50),
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
                        "5",
                        style: const TextStyle(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<GetTasksCubit, GetTasksState>(
                builder: (context, state) {
                  if (state is GetTasksLoading) {
                    return CircularProgressIndicator();
                  } else if (state is GetTasksError) {
                    return Column(
                      children: [
                        Text(state.error),
                        TextButton(
                          onPressed: () {
                            if (state is GetTasksSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('got Tasks')),
                              );
                              navigateTo(context, screen: HomeTask());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          child: Text('Refresh'),
                        ),
                      ],
                    );
                  } else if (state is GetTasksSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) =>
                            AddedTask(task: state.tasks[index]),
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
