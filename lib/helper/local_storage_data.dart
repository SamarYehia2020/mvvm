import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_usamaa_app/models/user_model.dart';

class LocalStorageData extends GetxController {
  GetStorage userBox = GetStorage();
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  setUser(UserModel userModel) {
    userBox.write('user', json.encode(userModel.toJson()));
  }

  getUserData() {
    return UserModel.fromJson(jsonDecode(userBox.read('user')));
  }

  deleteUser() {
    userBox.remove('user');
  }
}
