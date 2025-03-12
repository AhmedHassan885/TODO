// ignore_for_file: unnecessary_import, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/opening_page/data/models/profile_model.dart';
import 'package:todo/features/opening_page/data/repo/profile_repo.dart';
import 'package:todo/features/opening_page/manager/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepository repo = ProfileRepository.getInstance();

  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final TextEditingController name_Controller = TextEditingController();
  final TextEditingController password_Controller = TextEditingController();
  final TextEditingController confirm_password_Controller =
      TextEditingController();

  void saveProfile() async {
    emit(ProfileLoading());

    Either<String, void> response = await repo.saveProfile(
        model: ProfileModel(
            name: name_Controller.text, password: password_Controller.text));
    response.fold((String error) {
      emit(ProfileError(error));
    }, (r) {
      emit(ProfileSuccess());
      getUser();
    });
  }

  void getUser() {
    emit(GetUserLoading());
    var response = repo.getUser();
    response.fold((String error) => emit(GetUserError(error)),
        (ProfileModel user) => emit(GetUserSuccess(user)));
  }

  void login(String username, String password) {
    emit(ProfileLoading());

    if (repo.loginUser(username, password)) {
      emit(ProfileSuccess());
    } else {
      emit(ProfileError("Invalid username or password"));
    }
  }

  void log(String username, String password) {
    emit(LoginLoading());

    if (repo.loginUser(username, password)) {
      emit(LoginSuccess());
    } else {
      emit(LoginError("Invalid username or password"));
    }
  }
}
