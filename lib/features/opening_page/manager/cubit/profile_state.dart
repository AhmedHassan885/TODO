import 'package:todo/features/opening_page/data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {}

class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}

class LoginLoading extends ProfileState {}

class LoginSuccess extends ProfileState {}

class LoginError extends ProfileState {
  final String error;
  LoginError(this.error);
}

class GetUserLoading extends ProfileState {}

class GetUserSuccess extends ProfileState {
  ProfileModel user;
  GetUserSuccess(this.user);
}

class GetUserError extends ProfileState {
  String error;
  GetUserError(this.error);
}
