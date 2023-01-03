import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/core/views_models/cart_view_model.dart';
import 'package:mvvm_usamaa_app/models/cart_product_model.dart';
import 'package:mvvm_usamaa_app/models/product_model.dart';
import 'package:mvvm_usamaa_app/views/widgets/cart_bottom.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_button.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  ProductModel? productModel = ProductModel();
  DetailsView({this.productModel, super.key});
  CartProductModel cartProductModel = CartProductModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 270,
              child: Image.network(
                productModel!.imgUrl!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        data: productModel!.name!,
                        size: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: secondaryColor,
                                )),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                      data: "size",
                                      size: 14,
                                      color: Colors.black),
                                  CustomText(
                                    data: productModel!.size!,
                                    size: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )
                                ]),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * .45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: secondaryColor,
                                )),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                      data: "Color",
                                      size: 14,
                                      color: Colors.black),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: productModel!.color!,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  )
                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        data: "Details",
                        size: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        data: productModel!.description!,
                        size: 14,
                        color: Colors.black,
                        alignment: Alignment.topLeft,
                        height: 2.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller) => CartBottomWidget(
                  buttonData: "ADD",
                  data: "Price",
                  price: double.parse(productModel!.price!),
                  onPress: () async {
                    await controller.add(CartProductModel(
                        name: productModel!.name,
                        imgUrl: productModel!.imgUrl,
                        price: productModel!.price,
                        productId: productModel!.productId,
                        quantity: 1));
                    print(controller.cartProducts.length);

                    // await controller.deleteData();
                  }),
            )
          ],
        ),
      )),
    );
  }
}
