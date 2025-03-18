import 'package:dartz/dartz.dart';
import 'package:todo/core/network/api_helper.dart';
import 'package:todo/core/network/api_response.dart';
import 'package:todo/core/network/end_points.dart';

class UpdateProfileRepo {
  UpdateProfileRepo._private();
  static final UpdateProfileRepo _instance = UpdateProfileRepo._private();
  factory UpdateProfileRepo() => _instance;
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> updateProfile({
    required String username,
  }) async {
    try {
      ApiResponse response = await apiHelper.putRequest(
        endPoint: EndPoints.update,
        data: {
          "username": username,
        },
      );

      if (response.status) {
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}
