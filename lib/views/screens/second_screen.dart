import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Get.put(AuthViewModel());
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          // Center(
          //   child: GetX<AuthViewModel>(
          //     init: AuthViewModel(),
          //     builder: (controller) =>
          //         Text(controller.counter.value.toString()),
          //   ),
          // ),
          // TextButton(
          //     onPressed: () {
          //       authViewModel.increment();
          //     },
          //     child: Text("increment"))
          // Obx(
          //   () => Center(
          //     child: Text(authViewModel.counter.value.toString()),
          //   ),
          // ),
          // TextButton(
          //     onPressed: () {
          //       authViewModel.increment();
          //     },
          //     child: Text("increment"))
        ]),
      ),
    );
  }
}
