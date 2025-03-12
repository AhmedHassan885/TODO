// ignore_for_file: unused_field, void_checks, curly_braces_in_flow_control_structures

import 'package:dartz/dartz.dart';
import 'package:todo/features/opening_page/data/models/profile_model.dart';

class ProfileRepository {
  ProfileRepository._internal();
  static final ProfileRepository _instance = ProfileRepository._internal();
  static getInstance() {
    return _instance;
  }

  ProfileModel? profile;

  Either<String, ProfileModel> getUser() {
    try {
      if (profile != null) {
        return Right(profile!);
      } else {
        throw Exception('Enter Your Name First');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> saveProfile(
      {required ProfileModel model}) async {
    try {
      await Future.delayed(Duration(seconds: 1));

      if (model.name.isEmpty) {
        throw Exception("the name can not be empty");
      }

      profile = model;
      return right(0);
    } catch (e) {
      return left(e.toString());
    }
  }

  bool loginUser(String username, String password) {
    return profile != null &&
        profile!.name == username &&
        profile!.password == password;
  }
}
