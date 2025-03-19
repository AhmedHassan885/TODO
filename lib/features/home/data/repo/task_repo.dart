import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/core/network/end_points.dart';
import 'package:todo/features/home/data/models/task_model.dart';


class GetTasksRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.myTasks,
      );

      if (response.status) {
        GetTasksResponseModel getTasksResponseModel =
            GetTasksResponseModel.fromJson(response.data);

        return Right(getTasksResponseModel.tasks!);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}