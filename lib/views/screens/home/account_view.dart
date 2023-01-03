import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvvm_usamaa_app/core/views_models/account_view_model.dart';
import 'package:mvvm_usamaa_app/helper/local_storage_data.dart';
import 'package:mvvm_usamaa_app/views/screens/auth/login_screen.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AccountViewModel(),
      builder: (controller) => controller.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Scaffold(
                  body: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 100,
                              height: 100,
                              child: Image.asset("assets/images/Avatar.png")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userModel.name!,
                                style: TextStyle(fontSize: 26),
                              ),
                              Text(
                                controller.userModel.email!,
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    accountItems("assets/images/Icon_Edit-Profile.png",
                        "Edit Profile", () {}),
                    accountItems("assets/images/Icon_Location.png",
                        "Shipping Address", () {}),
                    accountItems("assets/images/Icon_History.png",
                        "Order History", () {}),
                    accountItems(
                        "assets/images/Icon_Payment.png", "Cards", () {}),
                    accountItems(
                        "assets/images/Icon_Alert.png", "Notifications", () {}),
                    accountItems(
                      "assets/images/Icon_Exit.png",
                      "Log Out",
                      () {
                        controller.signOut();
                        Get.offAll(LoginScreen());
                      },
                    )
                  ],
                )),
              )),
            ),
    );
  }

  Container accountItems(String imgUrl, String data, Function() onPress) {
    return Container(
      child: TextButton(
          onPressed: onPress,
          child: ListTile(
            title: Text(
              data,
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_right_sharp),
            leading: Image.asset(imgUrl),
          )),
    );
  }
}
