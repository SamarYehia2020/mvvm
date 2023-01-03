import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  String labelData;
  String hintText;
  final saved;
  final validate;
  CustomTextFormField(
      {required this.labelData,
      required this.hintText,
      required this.saved,
      required this.validate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          data: labelData,
          size: 14,
          color: Colors.black,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          onSaved: saved,
          validator: validate,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 18, color: Colors.black),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
