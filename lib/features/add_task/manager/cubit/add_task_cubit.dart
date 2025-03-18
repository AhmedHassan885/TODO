// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_task/data/repo/add_task_repo.dart';
import 'package:todo/features/add_task/manager/cubit/ad_task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TaskCubit() : super(TaskInitial());

  static TaskCubit get(context) => BlocProvider.of(context);
  final AddTaskRepo taskRepo = AddTaskRepo();

  void addTask() async {
    emit(TaskLoading());

    final response = await taskRepo.addTask(
        title: titleController.text, description: descriptionController.text);

    response.fold(
      (error) {
        print("Task Add Failed: $error");
        emit(TaskError(error));
      },
      (task) => emit(TaskSuccess(task)),
    );
  }
}
