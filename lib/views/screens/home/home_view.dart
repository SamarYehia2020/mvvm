import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/const/const.dart';
import 'package:mvvm_usamaa_app/core/views_models/auth_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/control_view_model.dart';
import 'package:mvvm_usamaa_app/core/views_models/home_view_model.dart';
import 'package:mvvm_usamaa_app/views/screens/home/details_view.dart';
import 'package:mvvm_usamaa_app/views/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final authController = Get.find<AuthViewModel>();

  // final home_view = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                  strokeWidth: 10.0, backgroundColor: Colors.blue),
            )
          : Scaffold(
              body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    searchTextFormField(),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      data: "Categories",
                      size: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    categoryListView(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          data: "Best Selling",
                          size: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          data: "See All",
                          size: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    bestSellingListView()
                  ],
                ),
              ),
            )),
    ));
  }

  Widget categoryListView() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Image.network(controller.categories[index].imgUrl!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(controller.categories[index].name!)
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50)),
        prefixIcon: Icon(Icons.search, color: Colors.black),
        fillColor: Color(0x00000000).withOpacity(.05),
        enabled: true,
        filled: true,
      ),
    );
  }

  Widget bestSellingListView() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 400,
        child: ListView.builder(
          itemCount: controller.products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(
                  () => DetailsView(productModel: controller.products[index]));
            },
            child: Container(
              width: 170,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    width: 164,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                      controller.products[index].imgUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      data: controller.products[index].name!,
                      size: 16,
                      color: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      data: controller.products[index].description!,
                      size: 12,
                      color: Color(0xff929292),
                      maxLines: 1),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      data: controller.products[index].price.toString() + "\$",
                      size: 16,
                      color: primaryColor)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
