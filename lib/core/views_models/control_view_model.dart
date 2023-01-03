import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/views/screens/home/account_view.dart';
import 'package:mvvm_usamaa_app/views/screens/home/cart_view.dart';
import 'package:mvvm_usamaa_app/views/screens/home/home_view.dart';

class ControlViewModel extends GetxController {
  int navigatorVal = 0;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;

  void navVal(int selectedVal) {
    navigatorVal = selectedVal;
    switch (selectedVal) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CarttView();
          break;
        }
      case 2:
        {
          _currentScreen = AccountView();
          break;
        }
    }
    update();
  }
}
