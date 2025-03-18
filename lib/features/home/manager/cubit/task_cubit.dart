import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/home/data/repo/task_repo.dart';
import 'package:todo/features/home/manager/cubit/task_state.dart';


class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInit());

  static GetTasksCubit get(context) => BlocProvider.of(context);

  GetTasksRepo getTasksRepo = GetTasksRepo();
  void getTasks() async {
    emit(GetTasksLoading());
    var response = await getTasksRepo.getTasks();
    response.fold(
      (e) => emit(GetTasksError(e)),
      (tasks) => emit(GetTasksSuccess(tasks)),
    );
  }
}