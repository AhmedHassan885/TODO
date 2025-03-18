import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/settings/data/repo/settings_repo.dart';
import 'package:todo/features/settings/manager/cubit/settings_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit._internal() : super(UpdateProfileInitial());
  static final UpdateProfileCubit _instance = UpdateProfileCubit._internal();
  factory UpdateProfileCubit() => _instance;

  UpdateProfileRepo updateProfileRepo = UpdateProfileRepo();
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  Future<void> updateProfile() async {
    if (validate()) {
      emit(UpdateProfileLoading());

      var response = await updateProfileRepo.updateProfile(
          username: usernameController.text);

      response.fold((error) {
        emit(UpdateProfileError(error));
      }, (massage) {
        emit(UpdateProfileSuccess(massage));
      });
    }
  }

  bool validate() {
    return form.currentState?.validate() ?? false;
  }
}
