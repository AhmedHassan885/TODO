// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/helper/my_navigator.dart';
import 'package:todo/core/localization/app_string.dart';
import 'package:todo/core/resource_manager/app_asset.dart';
import 'package:todo/core/widgets/inputs/Default.dart';
import 'package:todo/features/add_task/manager/cubit/ad_task_state.dart';
import 'package:todo/features/add_task/manager/cubit/add_task_cubit.dart';
import 'package:todo/features/home/manager/cubit/task_cubit.dart';
import 'package:todo/features/home/presentations/home_task.dart';

class AddTask2 extends StatelessWidget {
  AddTask2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          title: Text(
            AppString.addTask_text,
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w300,
                color: Color(0xff24252C)),
          ),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 261,
                height: 197,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  AppAsset.palstine_image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 35),
              DefaulTextFormField2(
                H: AppString.title_hText,
                secure: false,
                controller: TaskCubit.get(context).titleController,
              ),
              DefaulTextFormField2(
                H: AppString.description_hText,
                secure: false,
                controller: TaskCubit.get(context).descriptionController,
              ),
              SizedBox(height: 30),
              BlocConsumer<TaskCubit, TaskState>(
                listener: (context, state) {
                  if (state is TaskSuccess) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("task added")));
                    GetTasksCubit.get(context).getTasks();
                    navigateTo(context, screen: HomeTask());
                  } else if (state is TaskError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is TaskLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Button(
                      text: AppString.addTask_text,
                      onPressed: () {
                        TaskCubit.get(context).addTask();
                      },
                    );
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
