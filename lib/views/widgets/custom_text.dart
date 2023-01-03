import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomText extends StatelessWidget {
  String data;
  double size;
  FontWeight? fontWeight;
  Color color;
  Alignment? alignment;
  int? maxLines;
  double? height;
  CustomText(
      {required this.data,
      required this.size,
      required this.color,
      this.fontWeight,
      this.alignment,
      this.maxLines,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        data,
        style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
            height: height),
        maxLines: maxLines,
      ),
    );
  }
}
