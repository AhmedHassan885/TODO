// ignore_for_file: unnecessary_import, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/features/Auth/data/models/User_model.dart';
import 'package:todo/features/Auth/data/repo/auth_repo..dart';
import 'package:todo/features/Auth/manager/cubit/profile_state.dart';

class ProfileCubit extends Cubit<AuthState> {
  AuthRepo repo = AuthRepo();

  ProfileCubit._internal() : super(RegisterInitialState());
  static final ProfileCubit _cubitInstance = ProfileCubit._internal();
  factory ProfileCubit() {
    return _cubitInstance;
  }
  static ProfileCubit get(context) => BlocProvider.of(context);
  final TextEditingController username_Controller = TextEditingController();
  final TextEditingController password_Controller = TextEditingController();
  final TextEditingController confirm_password_Controller =
      TextEditingController();
  final TextEditingController login_name_Controller = TextEditingController();
  final TextEditingController Login_pass_Controller = TextEditingController();

  XFile? image;
  void setImage(XFile image) {
    this.image = image;
  }

  void onRegister() async {
    emit(RegisterLoadingState());
    var response = await repo.register(
        username: username_Controller.text, password: password_Controller.text);

    response.fold((String error) {
      emit(RegisterErrorState(error));
    }, (r) {
      emit(RegisterSuccessState(msg: r));
    });
  }

  void getUser() {
    emit(GetUserLoading());
    var response = repo.getUser();
    response.fold((String error) => emit(GetUserError(error)),
        (String username) => emit(GetUserSuccess(username)));
  }

  void onLogin() async {
    emit(LoginLoadingState());
    var response = await repo.Login(
        username: login_name_Controller.text,
        password: Login_pass_Controller.text);

    response.fold((String error) {
      emit(LoginErrorState(error));
    }, (User user) {
      repo.model = LoginResponseModel(user: user);
      emit(LoginSuccessState());
    });
  }
}
