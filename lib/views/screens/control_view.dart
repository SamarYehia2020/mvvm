import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/control_view_model.dart';
import 'package:mvvm_usamaa_app/views/screens/auth/login_screen.dart';
import 'package:mvvm_usamaa_app/views/screens/home/account_view.dart';
import 'package:mvvm_usamaa_app/views/screens/home/cart_view.dart';
import 'package:mvvm_usamaa_app/views/screens/home/home_view.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthViewModel>();
    final controlController = Get.find<ControlViewModel>();
    return
        // Obx(() {
        //   return authController.user == null
        //       ? LoginScreen()
        //       :

        GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => Scaffold(
          bottomNavigationBar: bottomNavigationBar(),
          body: controller.currentScreen),
    );
  }
}

Widget bottomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    init: Get.find<ControlViewModel>(),
    builder: (controller) => BottomNavigationBar(
      unselectedLabelStyle: TextStyle(fontSize: 14),
      items: [
        BottomNavigationBarItem(
            activeIcon: Text("Explore"),
            label: "",
            icon: Image.asset(
              "assets/images/Icon_Explore.png",
              width: 20,
              fit: BoxFit.contain,
            )),
        BottomNavigationBarItem(
            activeIcon: Text("Cart"),
            label: "",
            icon: Image.asset(
              "assets/images/Icon_Cart.png",
              width: 20,
              fit: BoxFit.contain,
            )),
        BottomNavigationBarItem(
            activeIcon: Text("Account"),
            label: "",
            icon: Image.asset(
              "assets/images/Icon_Account.png",
              width: 20,
              fit: BoxFit.contain,
            )),
      ],
      currentIndex: controller.navigatorVal,
      onTap: (index) {
        controller.navVal(index);
        print(controller.navigatorVal);
      },
    ),
  );
}
