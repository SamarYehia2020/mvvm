import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_social_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_textformfield.dart';

class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Get.find<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 20, bottom: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomText(
                  data: "Sign Up",
                  size: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labelData: "Name",
                  hintText: "Samar Yehia",
                  saved: (value) {
                    authViewModel.name = value;
                  },
                  validate: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labelData: "Email",
                  hintText: "samaryehia74@gmail.com",
                  saved: (value) {
                    authViewModel.email = value;
                  },
                  validate: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labelData: "Password",
                  hintText: "..............",
                  saved: (value) {
                    authViewModel.password = value;
                  },
                  validate: (value) {
                    if (value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  data: "Sign Up",
                  color: primaryColor,
                  onPress: () {
                    formKey.currentState!.save();

                    if (formKey.currentState!.validate()) {
                      authViewModel.signUpWithNameAndEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
