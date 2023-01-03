import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';
import 'package:mvvm_usamaa_app/views/screens/auth/sign_up.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_social_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      data: "Welcome,",
                      size: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offAll(() => SignUpScreen());
                        },
                        child: CustomText(
                            data: "Sign Up", size: 18, color: primaryColor))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  data: "Sign in to Continue",
                  size: 14,
                  color: secondaryColor,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 30,
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
                  hintText: "****************",
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
                  height: 10,
                ),
                CustomText(
                  data: "Forgot Password?",
                  size: 14,
                  color: Colors.black,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  data: "Sign In",
                  color: primaryColor,
                  onPress: () {
                    formKey.currentState!.save();

                    if (formKey.currentState!.validate()) {
                      authViewModel.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(data: "-OR-", size: 18, color: Colors.black),
                SizedBox(
                  height: 20,
                ),
                CustomSocialButton(
                  onPress: () {
                    authViewModel.signInWithFacebook();
                  },
                  imgUrl: "assets/images/facebook.png",
                  data: "Sign in with Facebook",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomSocialButton(
                    onPress: () {
                      authViewModel.googleSignInMethod();
                    },
                    imgUrl: "assets/images/google.png",
                    data: "Sign in with Google")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
