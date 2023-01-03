import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  String data;
  Color color;
  Color? forColor;
  Function() onPress;
  CustomButton(
      {required this.data,
      required this.color,
      required this.onPress,
      this.forColor = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: CustomText(
        data: data,
        size: 14,
        color: forColor!,
        alignment: Alignment.center,
      ),
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20)),
          backgroundColor: MaterialStateProperty.all(color)),
    );
  }
}
