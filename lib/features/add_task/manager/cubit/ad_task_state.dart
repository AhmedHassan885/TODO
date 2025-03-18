import 'package:todo/features/home/data/models/task_model.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  late final List<TaskModel> tasks;
}

class TaskSuccess extends TaskState {
  final String task;
  TaskSuccess(this.task);
}

class TaskError extends TaskState {
  final String message;
  TaskError(this.message);
}
