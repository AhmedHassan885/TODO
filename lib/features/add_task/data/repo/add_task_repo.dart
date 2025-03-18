// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/core/network/end_points.dart';

class AddTaskRepo {
  AddTaskRepo._private();
  static final AddTaskRepo _instance = AddTaskRepo._private();
  factory AddTaskRepo() => _instance;

  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> addTask(
      {required String title, required String description}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.newTask,
        data: {
          "title": title,
          "description": description,
        },
        isAuthorized: true,
      );
      print("API Response: ${apiResponse.data}");

      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      print("Exception in addTask: $e");
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
