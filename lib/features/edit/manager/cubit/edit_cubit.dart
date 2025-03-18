// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/edit/data/repo/edit_repo.dart';
import 'package:todo/features/edit/manager/cubit/edit_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ChangePasswordRepo changePasswordRepo = ChangePasswordRepo();

  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());

    var response = await changePasswordRepo.changePassword(
      oldPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    response.fold(
      (error) {
        print("Task Add Failed: $error");
        emit(ChangePasswordError(error));
      },
      (massage) => emit(ChangePasswordSuccess(massage)),
    );
  }
}
