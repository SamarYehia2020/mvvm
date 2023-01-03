import 'dart:math';

class UserModel {
  String? userId;
  String? name;
  String? email;
  String? pic;
  UserModel({this.userId, this.email, this.name, this.pic});
  UserModel.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData == null) {
      return;
    }
    userId = jsonData['userId'];
    name = jsonData['name'];
    email = jsonData['email'];
    pic = jsonData['pic'];
  }
  toJson() {
    return {'userId': userId, 'name': name, 'email': email, 'pic': pic};
  }
}
