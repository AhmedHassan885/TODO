// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/add_task/data/models/add_task_model.dart';
import 'package:todo/features/add_task/data/repo/add_task_repo.dart';
import 'package:todo/features/add_task/manager/cubit/ad_task_state.dart';

class TaskCubit extends Cubit<AddTaskState> {
  final TextEditingController task_nameController = TextEditingController();
  final TextEditingController task_DescController = TextEditingController();
  String selectedTaskGroup = "Home";

  TaskRepo repo = TaskRepo.getInst();
  TaskCubit() : super(TaskInitState());

  static TaskCubit get(context) => BlocProvider.of<TaskCubit>(context);

  void updateSelectedTaskGroup(String group) {
    selectedTaskGroup = group;
    emit(TaskInitState());
  }

  void saveTask() async {
    emit(TaskLoadingState());
    Either<String, void> response = await repo.saveTask(
        TaskModel(task_nameController.text, task_DescController.text, selectedTaskGroup));
    response.fold((String error) {
      emit(TaskErrorState(error));
    }, (r) {
      emit(TaskSuccessState());
    });
  }
}