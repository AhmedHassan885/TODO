// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:todo/features/add_task/data/models/add_task_model.dart';
class TaskRepo {
  TaskRepo._inter();
  static final TaskRepo _inst = TaskRepo._inter();
  static getInst() {
    return _inst;
  }

  TaskModel? model;

  Future<Either<String, void>> saveTask(TaskModel model) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      if (model.task_Name.isEmpty) {
        throw Exception("You should enter a task name");
      }
      this.model = model;
      return right(0);
    } catch (e) {
      return left(e.toString());
    }
  }
}