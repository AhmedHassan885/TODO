// ignore_for_file: unnecessary_this

class ChangePasswordResponseModel {
  String? message;
  bool? status;

  ChangePasswordResponseModel({this.message, this.status});

  ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
