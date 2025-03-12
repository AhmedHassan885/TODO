abstract class AddTaskState {}

class TaskInitState extends AddTaskState {}

class TaskLoadingState extends AddTaskState {}
class TaskSuccessState extends AddTaskState {}
class TaskErrorState extends AddTaskState {

   final String error;
  TaskErrorState(this.error);
}
