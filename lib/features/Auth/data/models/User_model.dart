// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  User? user;

  LoginResponseModel(
      {this.accessToken, this.refreshToken, this.status, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  Null imagePath;
  String? username;

  User({this.id, this.imagePath, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['username'] = this.username;
    return data;
  }
}
