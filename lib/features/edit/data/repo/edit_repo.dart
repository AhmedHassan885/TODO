// ignore_for_file: prefer_final_fields, avoid_print

import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/core/network/end_points.dart';

class ChangePasswordRepo {
  APIHelper apiHelper = APIHelper();

  ChangePasswordRepo._private();
  static ChangePasswordRepo _instance = ChangePasswordRepo._private();
  factory ChangePasswordRepo() => _instance;

  Future<Either<String, String>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        endPoint: EndPoints.change,
        data: {
          "current_password": oldPassword,
          "new_password": newPassword,
          "new_password_confirm": confirmPassword,
        },
      );

      if (response.status && newPassword == confirmPassword) {
        return Right(response.message);
      } else {
        return Left(response.message);
      }
    } catch (e) {
      print("Exception in addTask: $e");
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
