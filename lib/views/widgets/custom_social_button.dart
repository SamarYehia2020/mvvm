import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  String imgUrl;
  String data;
  Function() onPress;
  CustomSocialButton(
      {required this.imgUrl,
      required this.data,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Image.asset(imgUrl),
            SizedBox(
              width: 70,
            ),
            CustomText(
              data: data,
              size: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(color: secondaryColor, width: 1),
              borderRadius: BorderRadius.circular(10))),
        ));
  }
}
