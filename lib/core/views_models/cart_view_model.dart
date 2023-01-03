import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_usamaa_app/core/services/database/cart_db.dart';
import 'package:mvvm_usamaa_app/models/cart_product_model.dart';

class CartViewModel extends GetxController {
  List<CartProductModel> cartProducts = [];
  CartDatabaseHelper cartDatabaseHelper = CartDatabaseHelper();

  ValueNotifier<bool> loading = ValueNotifier(false);
  double totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    loading.value = true;
    cartProducts = await cartDatabaseHelper.getAllProduct();
    loading.value = false;
    getTotalPrice();

    update();
  }

  add(CartProductModel cartProductModel) async {
    // try {
    for (int i = 0; i < cartProducts.length; i++) {
      //     // print("cart products length is ${cartProducts.length}");

      if (cartProducts[i].productId == cartProductModel.productId) {
        print("NOT Allowed");

        return;
      }
    }
    await cartDatabaseHelper.insert(cartProductModel);
    print("Allow");
    // print(cartDatabaseHelper.insert(cartProductModel));
    cartProducts.add(cartProductModel);
    update();

    // } catch (e) {
    //   print(e);
    // }

    // print("hiiii");
  }

  deleteData() async {
    int g = await cartDatabaseHelper.deleteData();
    print(g);
    // update();
  }

  getTotalPrice() {
    for (int i = 0; i < cartProducts.length; i++) {
      totalPrice +=
          double.parse(cartProducts[i].price!) * cartProducts[i].quantity;
      update();
    }
  }

  increaseQuantity(int index) async {
    cartProducts[index].quantity++;
    await cartDatabaseHelper.updateDb(cartProducts[index]);
    totalPrice = totalPrice + double.parse(cartProducts[index].price!);
    update();
  }

  decreaseQuantity(int index) async {
    cartProducts[index].quantity--;
    await cartDatabaseHelper.updateDb(cartProducts[index]);
    totalPrice = totalPrice - double.parse(cartProducts[index].price!);

    update();
  }
}
