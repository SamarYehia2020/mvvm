import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/core/services/home_service.dart';
import 'package:mvvm_usamaa_app/models/category_model.dart';
import 'package:mvvm_usamaa_app/models/product_model.dart';

class HomeViewModel extends GetxController {
  List<CategoryModel> categories = [];
  List<ProductModel> products = [];
  ValueNotifier<bool> loading = ValueNotifier(false);
  HomeViewModel() {
    getCategory();
    getBestSelling();
  }
  getCategory() async {
    loading.value = true;
    HomeService().getCategory().then((value) {
      for (var val in value) {
        categories
            .add(CategoryModel.fromJson(val.data() as Map<String, dynamic>));
        loading.value = false;
      }
      update();
    });
  }

  getBestSelling() async {
    loading.value = true;
    HomeService().getProduct().then((value) {
      for (var val in value) {
        products.add(ProductModel.fromJson(val.data() as Map<String, dynamic>));
        loading.value = false;
      }
      update();
    });
  }
}
