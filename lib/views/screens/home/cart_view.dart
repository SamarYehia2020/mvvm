import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/core/views_models/cart_view_model.dart';
import 'package:mvvm_usamaa_app/views/screens/checkout/checkout_view.dart';
import 'package:mvvm_usamaa_app/views/widgets/cart_bottom.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class CarttView extends StatelessWidget {
  CarttView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder<CartViewModel>(
        builder: (controller) => controller.cartProducts.isNotEmpty
            ? Column(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * .30,
                                height:
                                    MediaQuery.of(context).size.height * .20,
                                child: Image.network(
                                  controller.cartProducts[index].imgUrl!,
                                  fit: BoxFit.fill,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    data: controller.cartProducts[index].name!,
                                    size: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    data: controller.cartProducts[index].price!,
                                    size: 16,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    data: controller
                                        .cartProducts[index].productId!,
                                    size: 16,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                    decoration: BoxDecoration(
                                        color: secondaryColor.withOpacity(.2)),
                                    child: Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              controller
                                                  .increaseQuantity(index);
                                            },
                                            child: Icon(
                                              size: 15,
                                              Icons.add,
                                              color:
                                                  Colors.black.withOpacity(.5),
                                            )),
                                        CustomText(
                                            data: controller
                                                .cartProducts[index].quantity
                                                .toString(),
                                            size: 14,
                                            color: Colors.black),
                                        TextButton(
                                            onPressed: () {
                                              controller
                                                  .decreaseQuantity(index);
                                            },
                                            child: Icon(
                                              size: 15,
                                              Icons.remove,
                                              color:
                                                  Colors.black.withOpacity(.5),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                CartBottomWidget(
                  buttonData: "CHECKOUT",
                  data: "Total",
                  price: controller.totalPrice,
                  onPress: () {
                    Get.to(() => VerticalExample());
                  },
                ),
              ])
            : Container(
                padding: EdgeInsets.all(20),
                // color: Colors.amber,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/images/cart_empty.svg",
                          height: 200, width: 200),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        data: "Cart Is Empty",
                        size: 30,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )
                    ]),
              ),
      )),
    );
  }
}
