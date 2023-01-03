import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm_usamaa_app/helper/local_storage_data.dart';
import 'package:mvvm_usamaa_app/models/user_model.dart';

class AccountViewModel extends GetxController {
  LocalStorageData localStorageData = Get.find<LocalStorageData>();
  UserModel userModel = UserModel();
  ValueNotifier loading = ValueNotifier(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  Future<Void?> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  getCurrentUser() {
    loading.value = true;
    localStorageData.getUser.then((value) {
      userModel = value!;
    });
    loading.value = false;

    update();
  }
}
