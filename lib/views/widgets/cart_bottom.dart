import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class CartBottomWidget extends StatelessWidget {
  String? data;
  double? price;
  String? buttonData;
  Function() onPress;

  CartBottomWidget(
      {required this.buttonData,
      required this.data,
      required this.price,
      required this.onPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomText(data: data!, size: 12, color: Color(0xff929292)),
              CustomText(data: '$price\$', size: 18, color: primaryColor)
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width * .4,
              child: CustomButton(
                  data: buttonData!, color: primaryColor, onPress: onPress))
        ],
      ),
    );
  }
}
