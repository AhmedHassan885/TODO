// ignore_for_file: unused_field, void_checks, curly_braces_in_flow_control_structures, file_names, non_constant_identifier_names, avoid_print

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/local/local_data.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/core/network/end_points.dart';
import 'package:todo/features/Auth/data/models/User_model.dart';

class AuthRepo {
  AuthRepo._internal();
  static final AuthRepo _instance = AuthRepo._internal();
  factory AuthRepo() => _instance;

  LoginResponseModel? model;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> register(
      {required String username, required String password}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.register,
          data: {"username": username, "password": password},
          isAuthorized: false);

      if (apiResponse.status) {
        return Right(apiResponse.message);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, User>> Login(
      {required String username, required String password}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
          endPoint: EndPoints.login,
          data: {"username": username, "password": password},
          isAuthorized: false);
      if (apiResponse.status) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(apiResponse.data);
        if (loginResponseModel.user == null) {
          return Left(apiResponse.message);
        }
        
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', loginResponseModel.accessToken.toString());

        LocalData.accessToken = loginResponseModel.accessToken;
        LocalData.refreshToken = loginResponseModel.refreshToken;
        return Right(loginResponseModel.user!);
      } else {
        return Left(apiResponse.message);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Either<String, String> getUser() {
    try {
      if (model!=null && model!.user != null && model!.user!.username != null) {
        return Right(model!.user!.username! );
      } else {
        throw Exception('Enter Your Name First');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
