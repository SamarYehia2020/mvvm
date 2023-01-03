import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/views/screens/control_view.dart';

class CheckOutViewModel extends GetxController {
  int index = 0;
  Pages pages = Pages.DeliveryTime;
  void changeIndex(int i) {
    index = i;
    if (index == 1) {
      pages = Pages.AddAddress;
    } else if (index == 2) {
      pages = Pages.Summary;
    } else if (index == 3) {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == index) {
      return inProgressColor;
    } else if (i < index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
