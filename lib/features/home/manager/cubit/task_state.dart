
import 'package:todo/features/home/data/models/task_model.dart';

abstract class GetTasksState {}

class GetTasksInit extends GetTasksState {}

class GetTasksLoading extends GetTasksState {}

class GetTasksSuccess extends GetTasksState {
  List<TaskModel> tasks;
  GetTasksSuccess(this.tasks);
}

class GetTasksError extends GetTasksState {
  String error;
  GetTasksError(this.error);
}